namespace cpp formax_social.protocols
namespace php formax_sms_service

include "authentication_def.thrift"

enum SMSType {
  INVALID_TYPE = 0;

  // general type of short message. The SMS service will
  // first check the phone number's existence, if the number is not
  // registrated, then PHONE_NUM_IS_NOT_REGISTRATED will be returned
  // and no sms is sent, or send the message
  GENERAL_SMS = 1;

  // this type message is used to while you do phone number
  // registration. SMS service will firstly check whether the number
  // is already registrated, if so, PHONE_NUM_EXISTED
  // will be returned, or a sms will be sent.
  REGISTRATION_SMS_VERIFY_CODE = 2;

}



struct PhoneIdentifier {
  // country code is a must, default value is 86 countrycode of china
  // [CAUTION:]
  //  Sign plus is not allowed, ie. '+86' is invalide
  1: required string m_country_code = "86";

  // phone number, contains only phone number, country code should
  // not be include in it
  2: required string m_phone = "";
}


struct SMSMessage {
  1: required PhoneIdentifier m_phone_identifier;

  // m_text, the content of SMS.
  // NOTES:
  //  1. Cause we use SMS provider's service to send message, so the
  // content must be consistent with the format, which is registered
  // on SMS service provider, so generally, you just ignore this field.
  //  2. If you have to send message with your own format, [CAUTION]
  // be sure your format is registerred, then set this field with your
  // content and set the SMSType m_sms_type as GENERAL_SMS. [CAUTION,
  // CAUTION, CAUTION] Again, be very caution to use this type of message.
  2: required string m_text = "";

  // NOTES:
  //    Message type is very import. SMS server will use it to get
  3: required SMSType m_sms_type = SMSType.GENERAL_SMS;


  // used only for REGISTRATION_SMS_VERIFY_CODE type of message
  4: optional string m_verification_code = "";    // used when you need
                                // to send verification code
}

struct VerificationCodeVerifyRequest {
  1: required PhoneIdentifier m_phone_identifier;
  2: required string m_verification_code = "";
}

struct VerificationCodeGenerateRequest {
  1: required PhoneIdentifier m_phone_identifier;
}

struct VerificationCodeGenerateReturn {
  1: required string m_sms_verification_code = "";
  2: required authentication_def.Errno m_errno = authentication_def.SUCCESS;
}

service SMSService {
  authentication_def.Errno SendSMS(1: required SMSMessage msg);

  // Verfiy the short message verification code, return SUCCESS
  // if verify is ok, or return INVALID_VERIFICATION_CODE
  authentication_def.Errno VerifySMSVerificationCode(
    1: required VerificationCodeVerifyRequest request);

  // generate short message verification code, which will be
  // sent to the destination phone number in the backend
  // NOTEs:
  //  You might need to firstly check the phone number is not
  // registered in formax group account system, then do generate
  // verification code
  VerificationCodeGenerateReturn GenerateSMSVerificationCode(
    1: required VerificationCodeGenerateRequest request);
}
