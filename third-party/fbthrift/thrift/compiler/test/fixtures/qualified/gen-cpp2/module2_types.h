/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
#pragma once

#include <thrift/lib/cpp2/Thrift.h>
#include <thrift/lib/cpp2/protocol/Protocol.h>
#include <thrift/lib/cpp/TApplicationException.h>
#include <folly/io/IOBuf.h>
#include <folly/io/Cursor.h>

#include "module0_types.h"
#include "module1_types.h"
#include <thrift/lib/cpp2/GeneratedHeaderHelper.h>



namespace module2 {

class Struct;
class BigStruct;

class Struct final : private apache::thrift::detail::st::ComparisonOperators<Struct> {
 public:

  Struct() {}
  // FragileConstructor for use in initialization lists only
  Struct(apache::thrift::FragileConstructor,  ::module0::Struct first__arg,  ::module1::Struct second__arg);
  template <typename T__ThriftWrappedArgument__Ctor, typename... Args__ThriftWrappedArgument__Ctor>
  Struct(::apache::thrift::detail::argument_wrapper<1, T__ThriftWrappedArgument__Ctor> arg, Args__ThriftWrappedArgument__Ctor&&... args):
    Struct(std::forward<Args__ThriftWrappedArgument__Ctor>(args)...)
  {
    first = arg.move();
    __isset.first = true;
  }
  template <typename T__ThriftWrappedArgument__Ctor, typename... Args__ThriftWrappedArgument__Ctor>
  Struct(::apache::thrift::detail::argument_wrapper<2, T__ThriftWrappedArgument__Ctor> arg, Args__ThriftWrappedArgument__Ctor&&... args):
    Struct(std::forward<Args__ThriftWrappedArgument__Ctor>(args)...)
  {
    second = arg.move();
    __isset.second = true;
  }

  Struct(Struct&&) = default;

  Struct(const Struct&) = default;

  Struct& operator=(Struct&&) = default;

  Struct& operator=(const Struct&) = default;
  void __clear();
   ::module0::Struct first;
   ::module1::Struct second;

  struct __isset {

    bool first;
    bool second;
  } __isset = {};
  bool operator==(const Struct& rhs) const;

  bool operator < (const Struct& rhs) const {
    if (!(first == rhs.first)) {
      return first < rhs.first;
    }
    if (!(second == rhs.second)) {
      return second < rhs.second;
    }
    (void)rhs;
    return false;
  }
  const  ::module0::Struct& get_first() const&;
   ::module0::Struct get_first() &&;

  template <typename T_Struct_first_struct_setter>
   ::module0::Struct& set_first(T_Struct_first_struct_setter&& first_) {
    first = std::forward<T_Struct_first_struct_setter>(first_);
    __isset.first = true;
    return first;
  }
  const  ::module1::Struct& get_second() const&;
   ::module1::Struct get_second() &&;

  template <typename T_Struct_second_struct_setter>
   ::module1::Struct& set_second(T_Struct_second_struct_setter&& second_) {
    second = std::forward<T_Struct_second_struct_setter>(second_);
    __isset.second = true;
    return second;
  }

  template <class Protocol_>
  uint32_t read(Protocol_* iprot);
  template <class Protocol_>
  uint32_t serializedSize(Protocol_ const* prot_) const;
  template <class Protocol_>
  uint32_t serializedSizeZC(Protocol_ const* prot_) const;
  template <class Protocol_>
  uint32_t write(Protocol_* prot_) const;

 private:
  static void translateFieldName(FOLLY_MAYBE_UNUSED folly::StringPiece _fname, FOLLY_MAYBE_UNUSED int16_t& fid, FOLLY_MAYBE_UNUSED apache::thrift::protocol::TType& _ftype);
};

void swap(Struct& a, Struct& b);
extern template uint32_t Struct::read<>(apache::thrift::BinaryProtocolReader*);
extern template uint32_t Struct::write<>(apache::thrift::BinaryProtocolWriter*) const;
extern template uint32_t Struct::serializedSize<>(apache::thrift::BinaryProtocolWriter const*) const;
extern template uint32_t Struct::serializedSizeZC<>(apache::thrift::BinaryProtocolWriter const*) const;
extern template uint32_t Struct::read<>(apache::thrift::CompactProtocolReader*);
extern template uint32_t Struct::write<>(apache::thrift::CompactProtocolWriter*) const;
extern template uint32_t Struct::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
extern template uint32_t Struct::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

} // module2
namespace apache { namespace thrift {

template <> inline void Cpp2Ops< ::module2::Struct>::clear( ::module2::Struct* obj) {
  return obj->__clear();
}

template <> inline constexpr apache::thrift::protocol::TType Cpp2Ops< ::module2::Struct>::thriftType() {
  return apache::thrift::protocol::T_STRUCT;
}

template <> template <class Protocol> uint32_t Cpp2Ops< ::module2::Struct>::write(Protocol* proto,  ::module2::Struct const* obj) {
  return obj->write(proto);
}

template <> template <class Protocol> void Cpp2Ops< ::module2::Struct>::read(Protocol* proto,  ::module2::Struct* obj) {
  obj->read(proto);
}

template <> template <class Protocol> uint32_t Cpp2Ops< ::module2::Struct>::serializedSize(Protocol const* proto,  ::module2::Struct const* obj) {
  return obj->serializedSize(proto);
}

template <> template <class Protocol> uint32_t Cpp2Ops< ::module2::Struct>::serializedSizeZC(Protocol const* proto,  ::module2::Struct const* obj) {
  return obj->serializedSizeZC(proto);
}

}} // apache::thrift
namespace module2 {

class BigStruct final : private apache::thrift::detail::st::ComparisonOperators<BigStruct> {
 public:

  BigStruct() :
      id(0) {}
  // FragileConstructor for use in initialization lists only
  BigStruct(apache::thrift::FragileConstructor,  ::module2::Struct s__arg, int32_t id__arg);
  template <typename T__ThriftWrappedArgument__Ctor, typename... Args__ThriftWrappedArgument__Ctor>
  BigStruct(::apache::thrift::detail::argument_wrapper<1, T__ThriftWrappedArgument__Ctor> arg, Args__ThriftWrappedArgument__Ctor&&... args):
    BigStruct(std::forward<Args__ThriftWrappedArgument__Ctor>(args)...)
  {
    s = arg.move();
    __isset.s = true;
  }
  template <typename T__ThriftWrappedArgument__Ctor, typename... Args__ThriftWrappedArgument__Ctor>
  BigStruct(::apache::thrift::detail::argument_wrapper<2, T__ThriftWrappedArgument__Ctor> arg, Args__ThriftWrappedArgument__Ctor&&... args):
    BigStruct(std::forward<Args__ThriftWrappedArgument__Ctor>(args)...)
  {
    id = arg.move();
    __isset.id = true;
  }

  BigStruct(BigStruct&&) = default;

  BigStruct(const BigStruct&) = default;

  BigStruct& operator=(BigStruct&&) = default;

  BigStruct& operator=(const BigStruct&) = default;
  void __clear();
   ::module2::Struct s;
  int32_t id;

  struct __isset {

    bool s;
    bool id;
  } __isset = {};
  bool operator==(const BigStruct& rhs) const;

  bool operator < (const BigStruct& rhs) const {
    if (!(s == rhs.s)) {
      return s < rhs.s;
    }
    if (!(id == rhs.id)) {
      return id < rhs.id;
    }
    (void)rhs;
    return false;
  }
  const  ::module2::Struct& get_s() const&;
   ::module2::Struct get_s() &&;

  template <typename T_BigStruct_s_struct_setter>
   ::module2::Struct& set_s(T_BigStruct_s_struct_setter&& s_) {
    s = std::forward<T_BigStruct_s_struct_setter>(s_);
    __isset.s = true;
    return s;
  }

  int32_t get_id() const {
    return id;
  }

  int32_t& set_id(int32_t id_) {
    id = id_;
    __isset.id = true;
    return id;
  }

  template <class Protocol_>
  uint32_t read(Protocol_* iprot);
  template <class Protocol_>
  uint32_t serializedSize(Protocol_ const* prot_) const;
  template <class Protocol_>
  uint32_t serializedSizeZC(Protocol_ const* prot_) const;
  template <class Protocol_>
  uint32_t write(Protocol_* prot_) const;

 private:
  static void translateFieldName(FOLLY_MAYBE_UNUSED folly::StringPiece _fname, FOLLY_MAYBE_UNUSED int16_t& fid, FOLLY_MAYBE_UNUSED apache::thrift::protocol::TType& _ftype);
};

void swap(BigStruct& a, BigStruct& b);
extern template uint32_t BigStruct::read<>(apache::thrift::BinaryProtocolReader*);
extern template uint32_t BigStruct::write<>(apache::thrift::BinaryProtocolWriter*) const;
extern template uint32_t BigStruct::serializedSize<>(apache::thrift::BinaryProtocolWriter const*) const;
extern template uint32_t BigStruct::serializedSizeZC<>(apache::thrift::BinaryProtocolWriter const*) const;
extern template uint32_t BigStruct::read<>(apache::thrift::CompactProtocolReader*);
extern template uint32_t BigStruct::write<>(apache::thrift::CompactProtocolWriter*) const;
extern template uint32_t BigStruct::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
extern template uint32_t BigStruct::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

} // module2
namespace apache { namespace thrift {

template <> inline void Cpp2Ops< ::module2::BigStruct>::clear( ::module2::BigStruct* obj) {
  return obj->__clear();
}

template <> inline constexpr apache::thrift::protocol::TType Cpp2Ops< ::module2::BigStruct>::thriftType() {
  return apache::thrift::protocol::T_STRUCT;
}

template <> template <class Protocol> uint32_t Cpp2Ops< ::module2::BigStruct>::write(Protocol* proto,  ::module2::BigStruct const* obj) {
  return obj->write(proto);
}

template <> template <class Protocol> void Cpp2Ops< ::module2::BigStruct>::read(Protocol* proto,  ::module2::BigStruct* obj) {
  obj->read(proto);
}

template <> template <class Protocol> uint32_t Cpp2Ops< ::module2::BigStruct>::serializedSize(Protocol const* proto,  ::module2::BigStruct const* obj) {
  return obj->serializedSize(proto);
}

template <> template <class Protocol> uint32_t Cpp2Ops< ::module2::BigStruct>::serializedSizeZC(Protocol const* proto,  ::module2::BigStruct const* obj) {
  return obj->serializedSizeZC(proto);
}

}} // apache::thrift
namespace module2 {

} // module2
