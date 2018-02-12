/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
#pragma once

#include <array>
#include <cstddef>

#include <thrift/lib/cpp/Thrift.h>

#include "thrift/compiler/test/fixtures/separate_processmap/gen-cpp2/module_types.h"

namespace cpp2 {

struct _MyEnumEnumDataStorage {
  using type = MyEnum;
  static constexpr const std::size_t size = 2;
  static constexpr const std::array<MyEnum, 2> values = {{
    MyEnum::MyValue1,
    MyEnum::MyValue2,
  }};
  static constexpr const std::array<folly::StringPiece, 2> names = {{
    "MyValue1",
    "MyValue2",
  }};
};

} // cpp2
namespace apache { namespace thrift {

template <> struct TEnumDataStorage< ::cpp2::MyEnum> {
  using storage_type =  ::cpp2::_MyEnumEnumDataStorage;
};

}} // apache::thrift

