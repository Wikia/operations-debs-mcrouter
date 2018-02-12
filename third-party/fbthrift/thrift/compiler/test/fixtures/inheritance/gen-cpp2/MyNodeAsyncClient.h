/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
#pragma once

#include <folly/futures/Future.h>
#include <thrift/lib/cpp/TApplicationException.h>
#include <thrift/lib/cpp2/async/AsyncClient.h>
#include <thrift/lib/cpp2/async/FutureRequest.h>
#include "src/gen-cpp2/module_types.h"
#include "src/gen-cpp2/MyRootAsyncClient.h"

namespace folly {
  class IOBuf;
  class IOBufQueue;
}
namespace apache { namespace thrift {
  class Cpp2RequestContext;
  class BinaryProtocolReader;
  class CompactProtocolReader;
  namespace transport { class THeader; }
}}

namespace cpp2 {

class MyNodeAsyncClient : public  ::cpp2::MyRootAsyncClient {
 public:
  using  ::cpp2::MyRootAsyncClient::MyRootAsyncClient;

  char const* getServiceName() const noexcept override {
    return "MyNode";
  }

  virtual void do_mid(std::unique_ptr<apache::thrift::RequestCallback> callback);
  virtual void do_mid(apache::thrift::RpcOptions& rpcOptions, std::unique_ptr<apache::thrift::RequestCallback> callback);
 private:
  virtual void do_midImpl(bool useSync, apache::thrift::RpcOptions& rpcOptions, std::unique_ptr<apache::thrift::RequestCallback> callback);
 public:
  virtual void sync_do_mid();
  virtual void sync_do_mid(apache::thrift::RpcOptions& rpcOptions);
  virtual folly::Future<folly::Unit> future_do_mid();
  virtual folly::Future<folly::Unit> future_do_mid(apache::thrift::RpcOptions& rpcOptions);
  virtual folly::Future<std::pair<folly::Unit, std::unique_ptr<apache::thrift::transport::THeader>>> header_future_do_mid(apache::thrift::RpcOptions& rpcOptions);
  virtual void do_mid(folly::Function<void (::apache::thrift::ClientReceiveState&&)> callback);
  static folly::exception_wrapper recv_wrapped_do_mid(::apache::thrift::ClientReceiveState& state);
  static void recv_do_mid(::apache::thrift::ClientReceiveState& state);
  // Mock friendly virtual instance method
  virtual void recv_instance_do_mid(::apache::thrift::ClientReceiveState& state);
  virtual folly::exception_wrapper recv_instance_wrapped_do_mid(::apache::thrift::ClientReceiveState& state);
 private:
  template <typename Protocol_>
  void do_midT(Protocol_* prot, bool useSync, apache::thrift::RpcOptions& rpcOptions, std::unique_ptr<apache::thrift::RequestCallback> callback);
 public:
};

} // cpp2
