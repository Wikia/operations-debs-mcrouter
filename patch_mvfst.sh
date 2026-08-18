#!/usr/bin/env bash
# Patch mvfst for Ubuntu Resolute (26.04) GCC 15 / libstdc++ compatibility.
#
# GCC 15's libstdc++ enforces CWG 2335, which requires that default member
# initializers (DMIs) be fully parsed before the enclosing class is complete.
# In mvfst's DatagramFlowManager.h, the QueuedDatagram struct uses brace-init
# DMIs (e.g. `TimePoint enqueueTime{TimePoint::max()};`). When QueuedDatagram
# is used as a value type inside folly::F14FastMap, libstdc++ instantiates
# std::__is_implicitly_default_constructible on it — which requires evaluating
# its DMIs — before the enclosing DatagramFlowManager class is complete. This
# triggers: "default member initializer required before the end of its
# enclosing class".
#
# The fix: remove the DMIs and add an explicit default constructor with a
# member initializer list, which is not subject to the same restriction.
# The default values (TimePoint::max() and 0) are preserved exactly.
#
# Risks: if upstream mvfst adds new fields to QueuedDatagram with DMIs, or
# renames/removes these fields, the sed will silently no-op and the build may
# fail again with the same error or with uninitialized members. Check this
# patch when bumping mcrouter_version.
set -ex

pkg_dir="/var/tmp/tmp.AJvPCDTbXG/pkgs"
cd "${pkg_dir}"

sed -i 's/TimePoint enqueueTime{TimePoint::max()};/TimePoint enqueueTime;/' \
  mvfst/quic/datagram/DatagramFlowManager.h
sed -i 's/uint64_t intraFlowPriority{0};/uint64_t intraFlowPriority;/' \
  mvfst/quic/datagram/DatagramFlowManager.h
sed -i '/struct QueuedDatagram {/a\      QueuedDatagram() : enqueueTime(TimePoint::max()), intraFlowPriority(0) {}' \
  mvfst/quic/datagram/DatagramFlowManager.h
