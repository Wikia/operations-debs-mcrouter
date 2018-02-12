// Autogenerated by Thrift Compiler (facebook)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
// @generated

package module

import (
	"bytes"
	"sync"
	"fmt"
	"git.apache.org/thrift.git/lib/go/thrift"
)

// (needed to ensure safety because of naive import list construction.)
var _ = thrift.ZERO
var _ = fmt.Printf
var _ = sync.Mutex{}
var _ = bytes.Equal

type MyNode interface {
MyRoot

  DoMid() (err error)
}

type MyNodeClient struct {
  *MyRootClient
}

func (client *MyNodeClient) Close() error {
  return client.Transport.Close()
}

func NewMyNodeClientFactory(t thrift.Transport, f thrift.ProtocolFactory) *MyNodeClient {
  return &MyNodeClient{MyRootClient: NewMyRootClientFactory(t, f)}}

func NewMyNodeClientProtocol(t thrift.Transport, iprot thrift.Protocol, oprot thrift.Protocol) *MyNodeClient {
  return &MyNodeClient{MyRootClient: NewMyRootClientProtocol(t, iprot, oprot)}
}

func (p *MyNodeClient) DoMid() (err error) {
  if err = p.sendDoMid(); err != nil { return }
  return p.recvDoMid()
}

func (p *MyNodeClient) sendDoMid()(err error) {
  oprot := p.OutputProtocol
  if oprot == nil {
    oprot = p.ProtocolFactory.GetProtocol(p.Transport)
    p.OutputProtocol = oprot
  }
  p.SeqId++
  if err = oprot.WriteMessageBegin("do_mid", thrift.CALL, p.SeqId); err != nil {
      return
  }
  args := MyNodeDoMidArgs{
  }
  if err = args.Write(oprot); err != nil {
      return
  }
  if err = oprot.WriteMessageEnd(); err != nil {
      return
  }
  return oprot.Flush()
}


func (p *MyNodeClient) recvDoMid() (err error) {
  iprot := p.InputProtocol
  if iprot == nil {
    iprot = p.ProtocolFactory.GetProtocol(p.Transport)
    p.InputProtocol = iprot
  }
  method, mTypeId, seqId, err := iprot.ReadMessageBegin()
  if err != nil {
    return
  }
  if method != "do_mid" {
    err = thrift.NewApplicationException(thrift.WRONG_METHOD_NAME, "do_mid failed: wrong method name")
    return
  }
  if p.SeqId != seqId {
    err = thrift.NewApplicationException(thrift.BAD_SEQUENCE_ID, "do_mid failed: out of sequence response")
    return
  }
  if mTypeId == thrift.EXCEPTION {
    error6 := thrift.NewApplicationException(thrift.UNKNOWN_APPLICATION_EXCEPTION, "Unknown Exception")
    var error7 error
    error7, err = error6.Read(iprot)
    if err != nil {
      return
    }
    if err = iprot.ReadMessageEnd(); err != nil {
      return
    }
    err = error7
    return
  }
  if mTypeId != thrift.REPLY {
    err = thrift.NewApplicationException(thrift.INVALID_MESSAGE_TYPE_EXCEPTION, "do_mid failed: invalid message type")
    return
  }
  result := MyNodeDoMidResult{}
  if err = result.Read(iprot); err != nil {
    return
  }
  if err = iprot.ReadMessageEnd(); err != nil {
    return
  }
  return
}


type MyNodeThreadsafeClient struct {
  *MyRootThreadsafeClient
}

func NewMyNodeThreadsafeClientFactory(t thrift.Transport, f thrift.ProtocolFactory) *MyNodeThreadsafeClient {
  return &MyNodeThreadsafeClient{MyRootThreadsafeClient: NewMyRootThreadsafeClientFactory(t, f)}}

func NewMyNodeThreadsafeClientProtocol(t thrift.Transport, iprot thrift.Protocol, oprot thrift.Protocol) *MyNodeThreadsafeClient {
  return &MyNodeThreadsafeClient{MyRootThreadsafeClient: NewMyRootThreadsafeClientProtocol(t, iprot, oprot)}
}

func (p *MyNodeThreadsafeClient) Threadsafe() {}

func (p *MyNodeThreadsafeClient) DoMid() (err error) {
  p.Mu.Lock()
  defer p.Mu.Unlock()
  if err = p.sendDoMid(); err != nil { return }
  return p.recvDoMid()
}

func (p *MyNodeThreadsafeClient) sendDoMid()(err error) {
  oprot := p.OutputProtocol
  if oprot == nil {
    oprot = p.ProtocolFactory.GetProtocol(p.Transport)
    p.OutputProtocol = oprot
  }
  p.SeqId++
  if err = oprot.WriteMessageBegin("do_mid", thrift.CALL, p.SeqId); err != nil {
      return
  }
  args := MyNodeDoMidArgs{
  }
  if err = args.Write(oprot); err != nil {
      return
  }
  if err = oprot.WriteMessageEnd(); err != nil {
      return
  }
  return oprot.Flush()
}


func (p *MyNodeThreadsafeClient) recvDoMid() (err error) {
  iprot := p.InputProtocol
  if iprot == nil {
    iprot = p.ProtocolFactory.GetProtocol(p.Transport)
    p.InputProtocol = iprot
  }
  method, mTypeId, seqId, err := iprot.ReadMessageBegin()
  if err != nil {
    return
  }
  if method != "do_mid" {
    err = thrift.NewApplicationException(thrift.WRONG_METHOD_NAME, "do_mid failed: wrong method name")
    return
  }
  if p.SeqId != seqId {
    err = thrift.NewApplicationException(thrift.BAD_SEQUENCE_ID, "do_mid failed: out of sequence response")
    return
  }
  if mTypeId == thrift.EXCEPTION {
    error8 := thrift.NewApplicationException(thrift.UNKNOWN_APPLICATION_EXCEPTION, "Unknown Exception")
    var error9 error
    error9, err = error8.Read(iprot)
    if err != nil {
      return
    }
    if err = iprot.ReadMessageEnd(); err != nil {
      return
    }
    err = error9
    return
  }
  if mTypeId != thrift.REPLY {
    err = thrift.NewApplicationException(thrift.INVALID_MESSAGE_TYPE_EXCEPTION, "do_mid failed: invalid message type")
    return
  }
  result := MyNodeDoMidResult{}
  if err = result.Read(iprot); err != nil {
    return
  }
  if err = iprot.ReadMessageEnd(); err != nil {
    return
  }
  return
}


type MyNodeProcessor struct {
  *MyRootProcessor
}

func NewMyNodeProcessor(handler MyNode) *MyNodeProcessor {
  self10 := &MyNodeProcessor{NewMyRootProcessor(handler)}
  self10.AddToProcessorMap("do_mid", &myNodeProcessorDoMid{handler:handler})
  return self10
}

type myNodeProcessorDoMid struct {
  handler MyNode
}

func (p *myNodeProcessorDoMid) Process(seqId int32, iprot, oprot thrift.Protocol) (success bool, err thrift.Exception) {
  args := MyNodeDoMidArgs{}
  if err = args.Read(iprot); err != nil {
    iprot.ReadMessageEnd()
    x := thrift.NewApplicationException(thrift.PROTOCOL_ERROR, err.Error())
    oprot.WriteMessageBegin("do_mid", thrift.EXCEPTION, seqId)
    x.Write(oprot)
    oprot.WriteMessageEnd()
    oprot.Flush()
    return false, err
  }

  iprot.ReadMessageEnd()
  result := MyNodeDoMidResult{}
  var err2 error
  if err2 = p.handler.DoMid(); err2 != nil {
    x := thrift.NewApplicationException(thrift.INTERNAL_ERROR, "Internal error processing do_mid: " + err2.Error())
    oprot.WriteMessageBegin("do_mid", thrift.EXCEPTION, seqId)
    x.Write(oprot)
    oprot.WriteMessageEnd()
    oprot.Flush()
    return true, err2
  }
  if err2 = oprot.WriteMessageBegin("do_mid", thrift.REPLY, seqId); err2 != nil {
    err = err2
  }
  if err2 = result.Write(oprot); err == nil && err2 != nil {
    err = err2
  }
  if err2 = oprot.WriteMessageEnd(); err == nil && err2 != nil {
    err = err2
  }
  if err2 = oprot.Flush(); err == nil && err2 != nil {
    err = err2
  }
  if err != nil {
    return
  }
  return true, err
}


// HELPER FUNCTIONS AND STRUCTURES

type MyNodeDoMidArgs struct {
}

func NewMyNodeDoMidArgs() *MyNodeDoMidArgs {
  return &MyNodeDoMidArgs{}
}

func (p *MyNodeDoMidArgs) Read(iprot thrift.Protocol) error {
  if _, err := iprot.ReadStructBegin(); err != nil {
    return thrift.PrependError(fmt.Sprintf("%T read error: ", p), err)
  }


  for {
    _, fieldTypeId, fieldId, err := iprot.ReadFieldBegin()
    if err != nil {
      return thrift.PrependError(fmt.Sprintf("%T field %d read error: ", p, fieldId), err)
    }
    if fieldTypeId == thrift.STOP { break; }
    if err := iprot.Skip(fieldTypeId); err != nil {
      return err
    }
    if err := iprot.ReadFieldEnd(); err != nil {
      return err
    }
  }
  if err := iprot.ReadStructEnd(); err != nil {
    return thrift.PrependError(fmt.Sprintf("%T read struct end error: ", p), err)
  }
  return nil
}

func (p *MyNodeDoMidArgs) Write(oprot thrift.Protocol) error {
  if err := oprot.WriteStructBegin("do_mid_args"); err != nil {
    return thrift.PrependError(fmt.Sprintf("%T write struct begin error: ", p), err) }
  if err := oprot.WriteFieldStop(); err != nil {
    return thrift.PrependError("write field stop error: ", err) }
  if err := oprot.WriteStructEnd(); err != nil {
    return thrift.PrependError("write struct stop error: ", err) }
  return nil
}

func (p *MyNodeDoMidArgs) String() string {
  if p == nil {
    return "<nil>"
  }
  return fmt.Sprintf("MyNodeDoMidArgs(%+v)", *p)
}

type MyNodeDoMidResult struct {
}

func NewMyNodeDoMidResult() *MyNodeDoMidResult {
  return &MyNodeDoMidResult{}
}

func (p *MyNodeDoMidResult) Read(iprot thrift.Protocol) error {
  if _, err := iprot.ReadStructBegin(); err != nil {
    return thrift.PrependError(fmt.Sprintf("%T read error: ", p), err)
  }


  for {
    _, fieldTypeId, fieldId, err := iprot.ReadFieldBegin()
    if err != nil {
      return thrift.PrependError(fmt.Sprintf("%T field %d read error: ", p, fieldId), err)
    }
    if fieldTypeId == thrift.STOP { break; }
    if err := iprot.Skip(fieldTypeId); err != nil {
      return err
    }
    if err := iprot.ReadFieldEnd(); err != nil {
      return err
    }
  }
  if err := iprot.ReadStructEnd(); err != nil {
    return thrift.PrependError(fmt.Sprintf("%T read struct end error: ", p), err)
  }
  return nil
}

func (p *MyNodeDoMidResult) Write(oprot thrift.Protocol) error {
  if err := oprot.WriteStructBegin("do_mid_result"); err != nil {
    return thrift.PrependError(fmt.Sprintf("%T write struct begin error: ", p), err) }
  if err := oprot.WriteFieldStop(); err != nil {
    return thrift.PrependError("write field stop error: ", err) }
  if err := oprot.WriteStructEnd(); err != nil {
    return thrift.PrependError("write struct stop error: ", err) }
  return nil
}

func (p *MyNodeDoMidResult) String() string {
  if p == nil {
    return "<nil>"
  }
  return fmt.Sprintf("MyNodeDoMidResult(%+v)", *p)
}


