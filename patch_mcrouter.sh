#!/usr/bin/env bash
# Patch mcrouter for Ubuntu Resolute's newer Boost:
# - boost/filesystem/convenience.hpp was removed; contents merged into boost/filesystem.hpp
# - boost::filesystem::complete() was removed; replaced by boost::filesystem::absolute()
set -ex

pkg_dir="/var/tmp/tmp.AJvPCDTbXG/pkgs"
cd "${pkg_dir}/mcrouter"

grep -rl 'boost/filesystem/convenience.hpp' . | xargs -r sed -i 's|<boost/filesystem/convenience.hpp>|<boost/filesystem.hpp>|'
# complete() was removed from Boost.Filesystem; absolute() is the replacement
# handles both qualified (boost::filesystem::complete) and unqualified (complete(...)) calls
grep -rl 'boost::filesystem::complete' . | xargs -r sed -i 's|boost::filesystem::complete|boost::filesystem::absolute|g'
grep -rl '= complete(' . | xargs -r sed -i 's|= complete(|= absolute(|g'
