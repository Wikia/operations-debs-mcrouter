/*
 *  Copyright (c) 2017, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 */

/*
 *  THIS FILE IS AUTOGENERATED. DO NOT MODIFY IT; ALL CHANGES WILL BE LOST IN
 *  VAIN.
 *
 */

namespace carbon {
namespace test {

template <class V>
void BaseStruct::visitFields(V&& v) {
  if (!v.visitField(1, "baseInt64Member", baseInt64Member_)) {
    return;
  }
}

template <class V>
void BaseStruct::visitFields(V&& v) const {
  if (!v.visitField(1, "baseInt64Member", baseInt64Member_)) {
    return;
  }
}

template <class V>
void SimpleStruct::visitFields(V&& v) {
  if (v.enterMixin(1, "BaseStruct", _carbon_basestruct_)) {
    _carbon_basestruct_.visitFields(std::forward<V>(v));
  }
  if (!v.leaveMixin()) {
    return;
  }
  if (!v.visitField(1, "int32Member", int32Member_)) {
    return;
  }
  if (!v.visitField(2, "stringMember", stringMember_)) {
    return;
  }
  if (!v.visitField(3, "enumMember", enumMember_)) {
    return;
  }
  if (!v.visitField(4, "vectorMember", vectorMember_)) {
    return;
  }
}

template <class V>
void SimpleStruct::visitFields(V&& v) const {
  if (v.enterMixin(1, "BaseStruct", _carbon_basestruct_)) {
    _carbon_basestruct_.visitFields(std::forward<V>(v));
  }
  if (!v.leaveMixin()) {
    return;
  }
  if (!v.visitField(1, "int32Member", int32Member_)) {
    return;
  }
  if (!v.visitField(2, "stringMember", stringMember_)) {
    return;
  }
  if (!v.visitField(3, "enumMember", enumMember_)) {
    return;
  }
  if (!v.visitField(4, "vectorMember", vectorMember_)) {
    return;
  }
}

} // test
} // carbon
