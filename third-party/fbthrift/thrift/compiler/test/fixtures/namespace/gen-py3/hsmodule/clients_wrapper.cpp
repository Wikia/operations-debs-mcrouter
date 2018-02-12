/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

#include <gen-py3/hsmodule/clients_wrapper.h>

namespace cpp2 {
HsTestServiceClientWrapper::HsTestServiceClientWrapper(
    std::shared_ptr<cpp2::HsTestServiceAsyncClient> async_client) : 
    async_client(async_client) {}

HsTestServiceClientWrapper::~HsTestServiceClientWrapper() {}

folly::Future<folly::Unit> HsTestServiceClientWrapper::disconnect() {
  return folly::via(
    this->async_client->getChannel()->getEventBase(),
    [this] { disconnectInLoop(); });
}

void HsTestServiceClientWrapper::disconnectInLoop() {
    async_client.reset();
}

void HsTestServiceClientWrapper::setPersistentHeader(const std::string& key, const std::string& value) {
    auto headerChannel = async_client->getHeaderChannel();
    if (headerChannel != nullptr) {
        headerChannel->setPersistentHeader(key, value);
    }
}


folly::Future<int64_t>
HsTestServiceClientWrapper::init(
    int64_t arg_int1) {
 return async_client->future_init(
   arg_int1
 );
}


} // namespace cpp2
