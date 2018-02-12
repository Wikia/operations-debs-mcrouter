/*
 * Copyright 2017-present Facebook, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#pragma once

#include <wangle/channel/Handler.h>

#include <thrift/test/gen-cpp/ThriftTest.h>
#include <thrift/lib/cpp/util/ThriftSerializer.h>

// Do some serialization / deserialization using thrift.
// A real rpc server would probably use generated client/server stubs
class ServerSerializeHandler : public wangle::Handler<
  std::unique_ptr<folly::IOBuf>, thrift::test::Bonk,
  thrift::test::Xtruct, std::unique_ptr<folly::IOBuf>> {
 public:
  void read(Context* ctx, std::unique_ptr<folly::IOBuf> msg) override {
    thrift::test::Bonk received;
    ser.deserialize<thrift::test::Bonk>(msg->moveToFbString(), &received);
    ctx->fireRead(received);
  }

  folly::Future<folly::Unit> write(Context* ctx, thrift::test::Xtruct b)
      override {
    std::string out;
    ser.serialize<thrift::test::Xtruct>(b, &out);
    return ctx->fireWrite(folly::IOBuf::copyBuffer(out));
  }

 private:
  apache::thrift::util::ThriftSerializerCompact<> ser;
};
