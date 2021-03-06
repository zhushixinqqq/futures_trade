// Autogenerated by Thrift Compiler (0.9.2)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING

package sms_service

import (
	"bytes"
	"fmt"
	authentication_def "protocols/gen-go/authentication_def"

	"git.apache.org/thrift.git/lib/go/thrift"
)

// (needed to ensure safety because of naive import list construction.)
var _ = thrift.ZERO
var _ = fmt.Printf
var _ = bytes.Equal

var _ = authentication_def.GoUnusedProtection__

type SMSService interface {
	// Parameters:
	//  - Msg
	SendSMS(msg *SMSMessage) (r authentication_def.Errno, err error)
	// Parameters:
	//  - Request
	VerifySMSVerificationCode(request *VerificationCodeVerifyRequest) (r authentication_def.Errno, err error)
	// Parameters:
	//  - Request
	GenerateSMSVerificationCode(request *VerificationCodeGenerateRequest) (r *VerificationCodeGenerateReturn, err error)
}

type SMSServiceClient struct {
	Transport       thrift.TTransport
	ProtocolFactory thrift.TProtocolFactory
	InputProtocol   thrift.TProtocol
	OutputProtocol  thrift.TProtocol
	SeqId           int32
}

func NewSMSServiceClientFactory(t thrift.TTransport, f thrift.TProtocolFactory) *SMSServiceClient {
	return &SMSServiceClient{Transport: t,
		ProtocolFactory: f,
		InputProtocol:   f.GetProtocol(t),
		OutputProtocol:  f.GetProtocol(t),
		SeqId:           0,
	}
}

func NewSMSServiceClientProtocol(t thrift.TTransport, iprot thrift.TProtocol, oprot thrift.TProtocol) *SMSServiceClient {
	return &SMSServiceClient{Transport: t,
		ProtocolFactory: nil,
		InputProtocol:   iprot,
		OutputProtocol:  oprot,
		SeqId:           0,
	}
}

// Parameters:
//  - Msg
func (p *SMSServiceClient) SendSMS(msg *SMSMessage) (r authentication_def.Errno, err error) {
	if err = p.sendSendSMS(msg); err != nil {
		return
	}
	return p.recvSendSMS()
}

func (p *SMSServiceClient) sendSendSMS(msg *SMSMessage) (err error) {
	oprot := p.OutputProtocol
	if oprot == nil {
		oprot = p.ProtocolFactory.GetProtocol(p.Transport)
		p.OutputProtocol = oprot
	}
	p.SeqId++
	if err = oprot.WriteMessageBegin("SendSMS", thrift.CALL, p.SeqId); err != nil {
		return
	}
	args := SendSMSArgs{
		Msg: msg,
	}
	if err = args.Write(oprot); err != nil {
		return
	}
	if err = oprot.WriteMessageEnd(); err != nil {
		return
	}
	return oprot.Flush()
}

func (p *SMSServiceClient) recvSendSMS() (value authentication_def.Errno, err error) {
	iprot := p.InputProtocol
	if iprot == nil {
		iprot = p.ProtocolFactory.GetProtocol(p.Transport)
		p.InputProtocol = iprot
	}
	_, mTypeId, seqId, err := iprot.ReadMessageBegin()
	if err != nil {
		return
	}
	if mTypeId == thrift.EXCEPTION {
		error0 := thrift.NewTApplicationException(thrift.UNKNOWN_APPLICATION_EXCEPTION, "Unknown Exception")
		var error1 error
		error1, err = error0.Read(iprot)
		if err != nil {
			return
		}
		if err = iprot.ReadMessageEnd(); err != nil {
			return
		}
		err = error1
		return
	}
	if p.SeqId != seqId {
		err = thrift.NewTApplicationException(thrift.BAD_SEQUENCE_ID, "SendSMS failed: out of sequence response")
		return
	}
	result := SendSMSResult{}
	if err = result.Read(iprot); err != nil {
		return
	}
	if err = iprot.ReadMessageEnd(); err != nil {
		return
	}
	value = result.GetSuccess()
	return
}

// Parameters:
//  - Request
func (p *SMSServiceClient) VerifySMSVerificationCode(request *VerificationCodeVerifyRequest) (r authentication_def.Errno, err error) {
	if err = p.sendVerifySMSVerificationCode(request); err != nil {
		return
	}
	return p.recvVerifySMSVerificationCode()
}

func (p *SMSServiceClient) sendVerifySMSVerificationCode(request *VerificationCodeVerifyRequest) (err error) {
	oprot := p.OutputProtocol
	if oprot == nil {
		oprot = p.ProtocolFactory.GetProtocol(p.Transport)
		p.OutputProtocol = oprot
	}
	p.SeqId++
	if err = oprot.WriteMessageBegin("VerifySMSVerificationCode", thrift.CALL, p.SeqId); err != nil {
		return
	}
	args := VerifySMSVerificationCodeArgs{
		Request: request,
	}
	if err = args.Write(oprot); err != nil {
		return
	}
	if err = oprot.WriteMessageEnd(); err != nil {
		return
	}
	return oprot.Flush()
}

func (p *SMSServiceClient) recvVerifySMSVerificationCode() (value authentication_def.Errno, err error) {
	iprot := p.InputProtocol
	if iprot == nil {
		iprot = p.ProtocolFactory.GetProtocol(p.Transport)
		p.InputProtocol = iprot
	}
	_, mTypeId, seqId, err := iprot.ReadMessageBegin()
	if err != nil {
		return
	}
	if mTypeId == thrift.EXCEPTION {
		error2 := thrift.NewTApplicationException(thrift.UNKNOWN_APPLICATION_EXCEPTION, "Unknown Exception")
		var error3 error
		error3, err = error2.Read(iprot)
		if err != nil {
			return
		}
		if err = iprot.ReadMessageEnd(); err != nil {
			return
		}
		err = error3
		return
	}
	if p.SeqId != seqId {
		err = thrift.NewTApplicationException(thrift.BAD_SEQUENCE_ID, "VerifySMSVerificationCode failed: out of sequence response")
		return
	}
	result := VerifySMSVerificationCodeResult{}
	if err = result.Read(iprot); err != nil {
		return
	}
	if err = iprot.ReadMessageEnd(); err != nil {
		return
	}
	value = result.GetSuccess()
	return
}

// Parameters:
//  - Request
func (p *SMSServiceClient) GenerateSMSVerificationCode(request *VerificationCodeGenerateRequest) (r *VerificationCodeGenerateReturn, err error) {
	if err = p.sendGenerateSMSVerificationCode(request); err != nil {
		return
	}
	return p.recvGenerateSMSVerificationCode()
}

func (p *SMSServiceClient) sendGenerateSMSVerificationCode(request *VerificationCodeGenerateRequest) (err error) {
	oprot := p.OutputProtocol
	if oprot == nil {
		oprot = p.ProtocolFactory.GetProtocol(p.Transport)
		p.OutputProtocol = oprot
	}
	p.SeqId++
	if err = oprot.WriteMessageBegin("GenerateSMSVerificationCode", thrift.CALL, p.SeqId); err != nil {
		return
	}
	args := GenerateSMSVerificationCodeArgs{
		Request: request,
	}
	if err = args.Write(oprot); err != nil {
		return
	}
	if err = oprot.WriteMessageEnd(); err != nil {
		return
	}
	return oprot.Flush()
}

func (p *SMSServiceClient) recvGenerateSMSVerificationCode() (value *VerificationCodeGenerateReturn, err error) {
	iprot := p.InputProtocol
	if iprot == nil {
		iprot = p.ProtocolFactory.GetProtocol(p.Transport)
		p.InputProtocol = iprot
	}
	_, mTypeId, seqId, err := iprot.ReadMessageBegin()
	if err != nil {
		return
	}
	if mTypeId == thrift.EXCEPTION {
		error4 := thrift.NewTApplicationException(thrift.UNKNOWN_APPLICATION_EXCEPTION, "Unknown Exception")
		var error5 error
		error5, err = error4.Read(iprot)
		if err != nil {
			return
		}
		if err = iprot.ReadMessageEnd(); err != nil {
			return
		}
		err = error5
		return
	}
	if p.SeqId != seqId {
		err = thrift.NewTApplicationException(thrift.BAD_SEQUENCE_ID, "GenerateSMSVerificationCode failed: out of sequence response")
		return
	}
	result := GenerateSMSVerificationCodeResult{}
	if err = result.Read(iprot); err != nil {
		return
	}
	if err = iprot.ReadMessageEnd(); err != nil {
		return
	}
	value = result.GetSuccess()
	return
}

type SMSServiceProcessor struct {
	processorMap map[string]thrift.TProcessorFunction
	handler      SMSService
}

func (p *SMSServiceProcessor) AddToProcessorMap(key string, processor thrift.TProcessorFunction) {
	p.processorMap[key] = processor
}

func (p *SMSServiceProcessor) GetProcessorFunction(key string) (processor thrift.TProcessorFunction, ok bool) {
	processor, ok = p.processorMap[key]
	return processor, ok
}

func (p *SMSServiceProcessor) ProcessorMap() map[string]thrift.TProcessorFunction {
	return p.processorMap
}

func NewSMSServiceProcessor(handler SMSService) *SMSServiceProcessor {

	self6 := &SMSServiceProcessor{handler: handler, processorMap: make(map[string]thrift.TProcessorFunction)}
	self6.processorMap["SendSMS"] = &sMSServiceProcessorSendSMS{handler: handler}
	self6.processorMap["VerifySMSVerificationCode"] = &sMSServiceProcessorVerifySMSVerificationCode{handler: handler}
	self6.processorMap["GenerateSMSVerificationCode"] = &sMSServiceProcessorGenerateSMSVerificationCode{handler: handler}
	return self6
}

func (p *SMSServiceProcessor) Process(iprot, oprot thrift.TProtocol) (success bool, err thrift.TException) {
	name, _, seqId, err := iprot.ReadMessageBegin()
	if err != nil {
		return false, err
	}
	if processor, ok := p.GetProcessorFunction(name); ok {
		return processor.Process(seqId, iprot, oprot)
	}
	iprot.Skip(thrift.STRUCT)
	iprot.ReadMessageEnd()
	x7 := thrift.NewTApplicationException(thrift.UNKNOWN_METHOD, "Unknown function "+name)
	oprot.WriteMessageBegin(name, thrift.EXCEPTION, seqId)
	x7.Write(oprot)
	oprot.WriteMessageEnd()
	oprot.Flush()
	return false, x7

}

type sMSServiceProcessorSendSMS struct {
	handler SMSService
}

func (p *sMSServiceProcessorSendSMS) Process(seqId int32, iprot, oprot thrift.TProtocol) (success bool, err thrift.TException) {
	args := SendSMSArgs{}
	if err = args.Read(iprot); err != nil {
		iprot.ReadMessageEnd()
		x := thrift.NewTApplicationException(thrift.PROTOCOL_ERROR, err.Error())
		oprot.WriteMessageBegin("SendSMS", thrift.EXCEPTION, seqId)
		x.Write(oprot)
		oprot.WriteMessageEnd()
		oprot.Flush()
		return false, err
	}

	iprot.ReadMessageEnd()
	result := SendSMSResult{}
	var retval authentication_def.Errno
	var err2 error
	if retval, err2 = p.handler.SendSMS(args.Msg); err2 != nil {
		x := thrift.NewTApplicationException(thrift.INTERNAL_ERROR, "Internal error processing SendSMS: "+err2.Error())
		oprot.WriteMessageBegin("SendSMS", thrift.EXCEPTION, seqId)
		x.Write(oprot)
		oprot.WriteMessageEnd()
		oprot.Flush()
		return true, err2
	} else {
		result.Success = &retval
	}
	if err2 = oprot.WriteMessageBegin("SendSMS", thrift.REPLY, seqId); err2 != nil {
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

type sMSServiceProcessorVerifySMSVerificationCode struct {
	handler SMSService
}

func (p *sMSServiceProcessorVerifySMSVerificationCode) Process(seqId int32, iprot, oprot thrift.TProtocol) (success bool, err thrift.TException) {
	args := VerifySMSVerificationCodeArgs{}
	if err = args.Read(iprot); err != nil {
		iprot.ReadMessageEnd()
		x := thrift.NewTApplicationException(thrift.PROTOCOL_ERROR, err.Error())
		oprot.WriteMessageBegin("VerifySMSVerificationCode", thrift.EXCEPTION, seqId)
		x.Write(oprot)
		oprot.WriteMessageEnd()
		oprot.Flush()
		return false, err
	}

	iprot.ReadMessageEnd()
	result := VerifySMSVerificationCodeResult{}
	var retval authentication_def.Errno
	var err2 error
	if retval, err2 = p.handler.VerifySMSVerificationCode(args.Request); err2 != nil {
		x := thrift.NewTApplicationException(thrift.INTERNAL_ERROR, "Internal error processing VerifySMSVerificationCode: "+err2.Error())
		oprot.WriteMessageBegin("VerifySMSVerificationCode", thrift.EXCEPTION, seqId)
		x.Write(oprot)
		oprot.WriteMessageEnd()
		oprot.Flush()
		return true, err2
	} else {
		result.Success = &retval
	}
	if err2 = oprot.WriteMessageBegin("VerifySMSVerificationCode", thrift.REPLY, seqId); err2 != nil {
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

type sMSServiceProcessorGenerateSMSVerificationCode struct {
	handler SMSService
}

func (p *sMSServiceProcessorGenerateSMSVerificationCode) Process(seqId int32, iprot, oprot thrift.TProtocol) (success bool, err thrift.TException) {
	args := GenerateSMSVerificationCodeArgs{}
	if err = args.Read(iprot); err != nil {
		iprot.ReadMessageEnd()
		x := thrift.NewTApplicationException(thrift.PROTOCOL_ERROR, err.Error())
		oprot.WriteMessageBegin("GenerateSMSVerificationCode", thrift.EXCEPTION, seqId)
		x.Write(oprot)
		oprot.WriteMessageEnd()
		oprot.Flush()
		return false, err
	}

	iprot.ReadMessageEnd()
	result := GenerateSMSVerificationCodeResult{}
	var retval *VerificationCodeGenerateReturn
	var err2 error
	if retval, err2 = p.handler.GenerateSMSVerificationCode(args.Request); err2 != nil {
		x := thrift.NewTApplicationException(thrift.INTERNAL_ERROR, "Internal error processing GenerateSMSVerificationCode: "+err2.Error())
		oprot.WriteMessageBegin("GenerateSMSVerificationCode", thrift.EXCEPTION, seqId)
		x.Write(oprot)
		oprot.WriteMessageEnd()
		oprot.Flush()
		return true, err2
	} else {
		result.Success = retval
	}
	if err2 = oprot.WriteMessageBegin("GenerateSMSVerificationCode", thrift.REPLY, seqId); err2 != nil {
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

type SendSMSArgs struct {
	Msg *SMSMessage `thrift:"msg,1,required" json:"msg"`
}

func NewSendSMSArgs() *SendSMSArgs {
	return &SendSMSArgs{}
}

var SendSMSArgs_Msg_DEFAULT *SMSMessage

func (p *SendSMSArgs) GetMsg() *SMSMessage {
	if !p.IsSetMsg() {
		return SendSMSArgs_Msg_DEFAULT
	}
	return p.Msg
}
func (p *SendSMSArgs) IsSetMsg() bool {
	return p.Msg != nil
}

func (p *SendSMSArgs) Read(iprot thrift.TProtocol) error {
	if _, err := iprot.ReadStructBegin(); err != nil {
		return fmt.Errorf("%T read error: %s", p, err)
	}
	for {
		_, fieldTypeId, fieldId, err := iprot.ReadFieldBegin()
		if err != nil {
			return fmt.Errorf("%T field %d read error: %s", p, fieldId, err)
		}
		if fieldTypeId == thrift.STOP {
			break
		}
		switch fieldId {
		case 1:
			if err := p.ReadField1(iprot); err != nil {
				return err
			}
		default:
			if err := iprot.Skip(fieldTypeId); err != nil {
				return err
			}
		}
		if err := iprot.ReadFieldEnd(); err != nil {
			return err
		}
	}
	if err := iprot.ReadStructEnd(); err != nil {
		return fmt.Errorf("%T read struct end error: %s", p, err)
	}
	return nil
}

func (p *SendSMSArgs) ReadField1(iprot thrift.TProtocol) error {
	p.Msg = &SMSMessage{
		MSmsType: 1,
	}
	if err := p.Msg.Read(iprot); err != nil {
		return fmt.Errorf("%T error reading struct: %s", p.Msg, err)
	}
	return nil
}

func (p *SendSMSArgs) Write(oprot thrift.TProtocol) error {
	if err := oprot.WriteStructBegin("SendSMS_args"); err != nil {
		return fmt.Errorf("%T write struct begin error: %s", p, err)
	}
	if err := p.writeField1(oprot); err != nil {
		return err
	}
	if err := oprot.WriteFieldStop(); err != nil {
		return fmt.Errorf("write field stop error: %s", err)
	}
	if err := oprot.WriteStructEnd(); err != nil {
		return fmt.Errorf("write struct stop error: %s", err)
	}
	return nil
}

func (p *SendSMSArgs) writeField1(oprot thrift.TProtocol) (err error) {
	if err := oprot.WriteFieldBegin("msg", thrift.STRUCT, 1); err != nil {
		return fmt.Errorf("%T write field begin error 1:msg: %s", p, err)
	}
	if err := p.Msg.Write(oprot); err != nil {
		return fmt.Errorf("%T error writing struct: %s", p.Msg, err)
	}
	if err := oprot.WriteFieldEnd(); err != nil {
		return fmt.Errorf("%T write field end error 1:msg: %s", p, err)
	}
	return err
}

func (p *SendSMSArgs) String() string {
	if p == nil {
		return "<nil>"
	}
	return fmt.Sprintf("SendSMSArgs(%+v)", *p)
}

type SendSMSResult struct {
	Success *authentication_def.Errno `thrift:"success,0" json:"success"`
}

func NewSendSMSResult() *SendSMSResult {
	return &SendSMSResult{}
}

var SendSMSResult_Success_DEFAULT authentication_def.Errno

func (p *SendSMSResult) GetSuccess() authentication_def.Errno {
	if !p.IsSetSuccess() {
		return SendSMSResult_Success_DEFAULT
	}
	return *p.Success
}
func (p *SendSMSResult) IsSetSuccess() bool {
	return p.Success != nil
}

func (p *SendSMSResult) Read(iprot thrift.TProtocol) error {
	if _, err := iprot.ReadStructBegin(); err != nil {
		return fmt.Errorf("%T read error: %s", p, err)
	}
	for {
		_, fieldTypeId, fieldId, err := iprot.ReadFieldBegin()
		if err != nil {
			return fmt.Errorf("%T field %d read error: %s", p, fieldId, err)
		}
		if fieldTypeId == thrift.STOP {
			break
		}
		switch fieldId {
		case 0:
			if err := p.ReadField0(iprot); err != nil {
				return err
			}
		default:
			if err := iprot.Skip(fieldTypeId); err != nil {
				return err
			}
		}
		if err := iprot.ReadFieldEnd(); err != nil {
			return err
		}
	}
	if err := iprot.ReadStructEnd(); err != nil {
		return fmt.Errorf("%T read struct end error: %s", p, err)
	}
	return nil
}

func (p *SendSMSResult) ReadField0(iprot thrift.TProtocol) error {
	if v, err := iprot.ReadI32(); err != nil {
		return fmt.Errorf("error reading field 0: %s", err)
	} else {
		temp := authentication_def.Errno(v)
		p.Success = &temp
	}
	return nil
}

func (p *SendSMSResult) Write(oprot thrift.TProtocol) error {
	if err := oprot.WriteStructBegin("SendSMS_result"); err != nil {
		return fmt.Errorf("%T write struct begin error: %s", p, err)
	}
	if err := p.writeField0(oprot); err != nil {
		return err
	}
	if err := oprot.WriteFieldStop(); err != nil {
		return fmt.Errorf("write field stop error: %s", err)
	}
	if err := oprot.WriteStructEnd(); err != nil {
		return fmt.Errorf("write struct stop error: %s", err)
	}
	return nil
}

func (p *SendSMSResult) writeField0(oprot thrift.TProtocol) (err error) {
	if p.IsSetSuccess() {
		if err := oprot.WriteFieldBegin("success", thrift.I32, 0); err != nil {
			return fmt.Errorf("%T write field begin error 0:success: %s", p, err)
		}
		if err := oprot.WriteI32(int32(*p.Success)); err != nil {
			return fmt.Errorf("%T.success (0) field write error: %s", p, err)
		}
		if err := oprot.WriteFieldEnd(); err != nil {
			return fmt.Errorf("%T write field end error 0:success: %s", p, err)
		}
	}
	return err
}

func (p *SendSMSResult) String() string {
	if p == nil {
		return "<nil>"
	}
	return fmt.Sprintf("SendSMSResult(%+v)", *p)
}

type VerifySMSVerificationCodeArgs struct {
	Request *VerificationCodeVerifyRequest `thrift:"request,1,required" json:"request"`
}

func NewVerifySMSVerificationCodeArgs() *VerifySMSVerificationCodeArgs {
	return &VerifySMSVerificationCodeArgs{}
}

var VerifySMSVerificationCodeArgs_Request_DEFAULT *VerificationCodeVerifyRequest

func (p *VerifySMSVerificationCodeArgs) GetRequest() *VerificationCodeVerifyRequest {
	if !p.IsSetRequest() {
		return VerifySMSVerificationCodeArgs_Request_DEFAULT
	}
	return p.Request
}
func (p *VerifySMSVerificationCodeArgs) IsSetRequest() bool {
	return p.Request != nil
}

func (p *VerifySMSVerificationCodeArgs) Read(iprot thrift.TProtocol) error {
	if _, err := iprot.ReadStructBegin(); err != nil {
		return fmt.Errorf("%T read error: %s", p, err)
	}
	for {
		_, fieldTypeId, fieldId, err := iprot.ReadFieldBegin()
		if err != nil {
			return fmt.Errorf("%T field %d read error: %s", p, fieldId, err)
		}
		if fieldTypeId == thrift.STOP {
			break
		}
		switch fieldId {
		case 1:
			if err := p.ReadField1(iprot); err != nil {
				return err
			}
		default:
			if err := iprot.Skip(fieldTypeId); err != nil {
				return err
			}
		}
		if err := iprot.ReadFieldEnd(); err != nil {
			return err
		}
	}
	if err := iprot.ReadStructEnd(); err != nil {
		return fmt.Errorf("%T read struct end error: %s", p, err)
	}
	return nil
}

func (p *VerifySMSVerificationCodeArgs) ReadField1(iprot thrift.TProtocol) error {
	p.Request = &VerificationCodeVerifyRequest{}
	if err := p.Request.Read(iprot); err != nil {
		return fmt.Errorf("%T error reading struct: %s", p.Request, err)
	}
	return nil
}

func (p *VerifySMSVerificationCodeArgs) Write(oprot thrift.TProtocol) error {
	if err := oprot.WriteStructBegin("VerifySMSVerificationCode_args"); err != nil {
		return fmt.Errorf("%T write struct begin error: %s", p, err)
	}
	if err := p.writeField1(oprot); err != nil {
		return err
	}
	if err := oprot.WriteFieldStop(); err != nil {
		return fmt.Errorf("write field stop error: %s", err)
	}
	if err := oprot.WriteStructEnd(); err != nil {
		return fmt.Errorf("write struct stop error: %s", err)
	}
	return nil
}

func (p *VerifySMSVerificationCodeArgs) writeField1(oprot thrift.TProtocol) (err error) {
	if err := oprot.WriteFieldBegin("request", thrift.STRUCT, 1); err != nil {
		return fmt.Errorf("%T write field begin error 1:request: %s", p, err)
	}
	if err := p.Request.Write(oprot); err != nil {
		return fmt.Errorf("%T error writing struct: %s", p.Request, err)
	}
	if err := oprot.WriteFieldEnd(); err != nil {
		return fmt.Errorf("%T write field end error 1:request: %s", p, err)
	}
	return err
}

func (p *VerifySMSVerificationCodeArgs) String() string {
	if p == nil {
		return "<nil>"
	}
	return fmt.Sprintf("VerifySMSVerificationCodeArgs(%+v)", *p)
}

type VerifySMSVerificationCodeResult struct {
	Success *authentication_def.Errno `thrift:"success,0" json:"success"`
}

func NewVerifySMSVerificationCodeResult() *VerifySMSVerificationCodeResult {
	return &VerifySMSVerificationCodeResult{}
}

var VerifySMSVerificationCodeResult_Success_DEFAULT authentication_def.Errno

func (p *VerifySMSVerificationCodeResult) GetSuccess() authentication_def.Errno {
	if !p.IsSetSuccess() {
		return VerifySMSVerificationCodeResult_Success_DEFAULT
	}
	return *p.Success
}
func (p *VerifySMSVerificationCodeResult) IsSetSuccess() bool {
	return p.Success != nil
}

func (p *VerifySMSVerificationCodeResult) Read(iprot thrift.TProtocol) error {
	if _, err := iprot.ReadStructBegin(); err != nil {
		return fmt.Errorf("%T read error: %s", p, err)
	}
	for {
		_, fieldTypeId, fieldId, err := iprot.ReadFieldBegin()
		if err != nil {
			return fmt.Errorf("%T field %d read error: %s", p, fieldId, err)
		}
		if fieldTypeId == thrift.STOP {
			break
		}
		switch fieldId {
		case 0:
			if err := p.ReadField0(iprot); err != nil {
				return err
			}
		default:
			if err := iprot.Skip(fieldTypeId); err != nil {
				return err
			}
		}
		if err := iprot.ReadFieldEnd(); err != nil {
			return err
		}
	}
	if err := iprot.ReadStructEnd(); err != nil {
		return fmt.Errorf("%T read struct end error: %s", p, err)
	}
	return nil
}

func (p *VerifySMSVerificationCodeResult) ReadField0(iprot thrift.TProtocol) error {
	if v, err := iprot.ReadI32(); err != nil {
		return fmt.Errorf("error reading field 0: %s", err)
	} else {
		temp := authentication_def.Errno(v)
		p.Success = &temp
	}
	return nil
}

func (p *VerifySMSVerificationCodeResult) Write(oprot thrift.TProtocol) error {
	if err := oprot.WriteStructBegin("VerifySMSVerificationCode_result"); err != nil {
		return fmt.Errorf("%T write struct begin error: %s", p, err)
	}
	if err := p.writeField0(oprot); err != nil {
		return err
	}
	if err := oprot.WriteFieldStop(); err != nil {
		return fmt.Errorf("write field stop error: %s", err)
	}
	if err := oprot.WriteStructEnd(); err != nil {
		return fmt.Errorf("write struct stop error: %s", err)
	}
	return nil
}

func (p *VerifySMSVerificationCodeResult) writeField0(oprot thrift.TProtocol) (err error) {
	if p.IsSetSuccess() {
		if err := oprot.WriteFieldBegin("success", thrift.I32, 0); err != nil {
			return fmt.Errorf("%T write field begin error 0:success: %s", p, err)
		}
		if err := oprot.WriteI32(int32(*p.Success)); err != nil {
			return fmt.Errorf("%T.success (0) field write error: %s", p, err)
		}
		if err := oprot.WriteFieldEnd(); err != nil {
			return fmt.Errorf("%T write field end error 0:success: %s", p, err)
		}
	}
	return err
}

func (p *VerifySMSVerificationCodeResult) String() string {
	if p == nil {
		return "<nil>"
	}
	return fmt.Sprintf("VerifySMSVerificationCodeResult(%+v)", *p)
}

type GenerateSMSVerificationCodeArgs struct {
	Request *VerificationCodeGenerateRequest `thrift:"request,1,required" json:"request"`
}

func NewGenerateSMSVerificationCodeArgs() *GenerateSMSVerificationCodeArgs {
	return &GenerateSMSVerificationCodeArgs{}
}

var GenerateSMSVerificationCodeArgs_Request_DEFAULT *VerificationCodeGenerateRequest

func (p *GenerateSMSVerificationCodeArgs) GetRequest() *VerificationCodeGenerateRequest {
	if !p.IsSetRequest() {
		return GenerateSMSVerificationCodeArgs_Request_DEFAULT
	}
	return p.Request
}
func (p *GenerateSMSVerificationCodeArgs) IsSetRequest() bool {
	return p.Request != nil
}

func (p *GenerateSMSVerificationCodeArgs) Read(iprot thrift.TProtocol) error {
	if _, err := iprot.ReadStructBegin(); err != nil {
		return fmt.Errorf("%T read error: %s", p, err)
	}
	for {
		_, fieldTypeId, fieldId, err := iprot.ReadFieldBegin()
		if err != nil {
			return fmt.Errorf("%T field %d read error: %s", p, fieldId, err)
		}
		if fieldTypeId == thrift.STOP {
			break
		}
		switch fieldId {
		case 1:
			if err := p.ReadField1(iprot); err != nil {
				return err
			}
		default:
			if err := iprot.Skip(fieldTypeId); err != nil {
				return err
			}
		}
		if err := iprot.ReadFieldEnd(); err != nil {
			return err
		}
	}
	if err := iprot.ReadStructEnd(); err != nil {
		return fmt.Errorf("%T read struct end error: %s", p, err)
	}
	return nil
}

func (p *GenerateSMSVerificationCodeArgs) ReadField1(iprot thrift.TProtocol) error {
	p.Request = &VerificationCodeGenerateRequest{}
	if err := p.Request.Read(iprot); err != nil {
		return fmt.Errorf("%T error reading struct: %s", p.Request, err)
	}
	return nil
}

func (p *GenerateSMSVerificationCodeArgs) Write(oprot thrift.TProtocol) error {
	if err := oprot.WriteStructBegin("GenerateSMSVerificationCode_args"); err != nil {
		return fmt.Errorf("%T write struct begin error: %s", p, err)
	}
	if err := p.writeField1(oprot); err != nil {
		return err
	}
	if err := oprot.WriteFieldStop(); err != nil {
		return fmt.Errorf("write field stop error: %s", err)
	}
	if err := oprot.WriteStructEnd(); err != nil {
		return fmt.Errorf("write struct stop error: %s", err)
	}
	return nil
}

func (p *GenerateSMSVerificationCodeArgs) writeField1(oprot thrift.TProtocol) (err error) {
	if err := oprot.WriteFieldBegin("request", thrift.STRUCT, 1); err != nil {
		return fmt.Errorf("%T write field begin error 1:request: %s", p, err)
	}
	if err := p.Request.Write(oprot); err != nil {
		return fmt.Errorf("%T error writing struct: %s", p.Request, err)
	}
	if err := oprot.WriteFieldEnd(); err != nil {
		return fmt.Errorf("%T write field end error 1:request: %s", p, err)
	}
	return err
}

func (p *GenerateSMSVerificationCodeArgs) String() string {
	if p == nil {
		return "<nil>"
	}
	return fmt.Sprintf("GenerateSMSVerificationCodeArgs(%+v)", *p)
}

type GenerateSMSVerificationCodeResult struct {
	Success *VerificationCodeGenerateReturn `thrift:"success,0" json:"success"`
}

func NewGenerateSMSVerificationCodeResult() *GenerateSMSVerificationCodeResult {
	return &GenerateSMSVerificationCodeResult{}
}

var GenerateSMSVerificationCodeResult_Success_DEFAULT *VerificationCodeGenerateReturn

func (p *GenerateSMSVerificationCodeResult) GetSuccess() *VerificationCodeGenerateReturn {
	if !p.IsSetSuccess() {
		return GenerateSMSVerificationCodeResult_Success_DEFAULT
	}
	return p.Success
}
func (p *GenerateSMSVerificationCodeResult) IsSetSuccess() bool {
	return p.Success != nil
}

func (p *GenerateSMSVerificationCodeResult) Read(iprot thrift.TProtocol) error {
	if _, err := iprot.ReadStructBegin(); err != nil {
		return fmt.Errorf("%T read error: %s", p, err)
	}
	for {
		_, fieldTypeId, fieldId, err := iprot.ReadFieldBegin()
		if err != nil {
			return fmt.Errorf("%T field %d read error: %s", p, fieldId, err)
		}
		if fieldTypeId == thrift.STOP {
			break
		}
		switch fieldId {
		case 0:
			if err := p.ReadField0(iprot); err != nil {
				return err
			}
		default:
			if err := iprot.Skip(fieldTypeId); err != nil {
				return err
			}
		}
		if err := iprot.ReadFieldEnd(); err != nil {
			return err
		}
	}
	if err := iprot.ReadStructEnd(); err != nil {
		return fmt.Errorf("%T read struct end error: %s", p, err)
	}
	return nil
}

func (p *GenerateSMSVerificationCodeResult) ReadField0(iprot thrift.TProtocol) error {
	p.Success = &VerificationCodeGenerateReturn{
		MErrno: 0,
	}
	if err := p.Success.Read(iprot); err != nil {
		return fmt.Errorf("%T error reading struct: %s", p.Success, err)
	}
	return nil
}

func (p *GenerateSMSVerificationCodeResult) Write(oprot thrift.TProtocol) error {
	if err := oprot.WriteStructBegin("GenerateSMSVerificationCode_result"); err != nil {
		return fmt.Errorf("%T write struct begin error: %s", p, err)
	}
	if err := p.writeField0(oprot); err != nil {
		return err
	}
	if err := oprot.WriteFieldStop(); err != nil {
		return fmt.Errorf("write field stop error: %s", err)
	}
	if err := oprot.WriteStructEnd(); err != nil {
		return fmt.Errorf("write struct stop error: %s", err)
	}
	return nil
}

func (p *GenerateSMSVerificationCodeResult) writeField0(oprot thrift.TProtocol) (err error) {
	if p.IsSetSuccess() {
		if err := oprot.WriteFieldBegin("success", thrift.STRUCT, 0); err != nil {
			return fmt.Errorf("%T write field begin error 0:success: %s", p, err)
		}
		if err := p.Success.Write(oprot); err != nil {
			return fmt.Errorf("%T error writing struct: %s", p.Success, err)
		}
		if err := oprot.WriteFieldEnd(); err != nil {
			return fmt.Errorf("%T write field end error 0:success: %s", p, err)
		}
	}
	return err
}

func (p *GenerateSMSVerificationCodeResult) String() string {
	if p == nil {
		return "<nil>"
	}
	return fmt.Sprintf("GenerateSMSVerificationCodeResult(%+v)", *p)
}
