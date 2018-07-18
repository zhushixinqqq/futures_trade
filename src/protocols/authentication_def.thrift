namespace cpp formax_social.protocols
namespace php formax_auth
#@namespace scala stock_copy_master.authentication_def

enum Errno{
  SUCCESS = 0,
  EMAIL_ALREADY_EXISTED = 1,    // Formax Group need email address
                                // to be unique, this indicates, the email addr
                                // already existed in our system
  PHONE_NUM_EXISTED = 2,        // phone number is already registered
  PHONE_EMAIL_EXISTED = 3,      // both phone and email are already registered
  NICK_NAME_EXISTED = 4,        // nick name is already registered
  NICK_EMAIL_EXISTED = 5,       // both nick name and email are already
                                // registered
  PHONE_NICK_EXISTED = 6,       // both phone and nick name are already
                                // registered
  EMAIL_NICK_PHONE_EXISTED = 7, // all nick name, phone and email are already
                                //  registered
  AUTHEN_SERVER_NOT_READY = 8,  // authentication server is not ready
  CANNOT_GENERATE_UID = 9,      // can't generate uid
  UPDATE_DATA_BASE_FAILED = 10, // update database failed
  THRIFT_RPC_EXCEPTION = 11,    // thrift rpc call exception
  INVALID_LOGIN_INFO = 12,      // invalid login info, currently there is three
                                // situations will cause this err:
                                //  1. both uid and email are empty
                                //  2. email is a must but not filled,
                                //  3. mt4 live id passed by client doesn't equal
                                // to the live id bind to the email stored in db.
  INVALID_SESSION = 13,
  INALID_AUTHEN_SERVER_PORT = 14,
  NOT_REGISTERED_EMAIL = 15,    // email is not registered in our system
  WRONG_PASSWD = 16,
  LOGIN_FAILED = 17,
  REGISTRATION_FAILED = 18,     // registration failed
  INVALID_BONUS_URLKEY = 19,    // invalid url key
  BONUS_URLKEY_EXPIRED = 20,    // url key is expired
  PHONE_NUM_IS_EMPTY = 21,      // phone number is not filled
  PHONE_NUM_IS_NOT_REGISTRATED = 22, // phone number is not registrated
  CANNOT_MODIFY_PHONE_NUM = 23, // can not modify existed phone number, which
                                // will be returned while you try to modify
                                // phone number
  CANNOT_MODIFY_EMAIL = 24,     // can not modify existed eamil, which will
                                // be returned while you try to modify email

  INVALID_USER_IDENTIFIER = 25, // Invalid user identifier, which will occured
                                // when none of uid,email,phone is not set

  INVALID_PHONE_NUM_FORMAT = 26,// invalid phone format. A valid format must
                                // comply to [country_code][one_space][phone_num]

  NOT_EXISTED_NICKNAME  = 27,   // the nick name is not existed. This error might
                                // be returned while query user basic info
                                // via nickname


  AUTHEN_SERVER_TAG_EXISTED = 28, // authentication server tags is
                                // already existed
  INVLIAD_EMAIL_FORMAT = 29,    // invalid email address format

  EMAIL_IS_EMPTY = 30,      // email is not filled

  USER_REGISTERING = 31,        // phone or email is registering
  // MT4 related error code, started from
  // 10000 to 19999
  CAN_NOT_CONNECT_TO_MT4_SERVER = 10000,
  NO_MT4ID_INFO = 10001,
  NO_BIND_LIVE_MT4ID = 10002,
  BIND_FAILED = 10003,        // bind mt4 id to uid failing

  // Forbag related error code, starting from
  // 20000 to 29999
  FORBAG_BROKER_USERID_EXISTED = 20000,     // the broker user id with the broker id
                                            // is already existed
  FORBAG_NO_BROKER_USER_INFO = 20001,       // there is no binding borker info
  FORBAG_INVALID_BIND_INFO = 20002,         // invalid forbag bind info, both uid and
                                            // email are invalid

  // P2P related error code, starting from
  // 30000 to 39999
  P2P_USERID_ALREADY_EXISTED = 30000,       // the p2p user id is already binded
  P2P_IDNUMBER_ALREADY_EXISTED = 30001,     // the id card number already existed
  P2P_FORMAX_UID_ALREADY_BINDED = 30002,    // the formax uid is already binded
  P2P_INVALID_BIND_INFO = 30003,            // invalid p2p bind info, both the email
                                            // and uid is wrong

  // Formax QuickFix related error code, starting
  // from 40000 to 49999


  DATABASE_ERROR = 50000,                   // database error

  // SMS service errors
  // 60000 to 69999
  SMS_CANNOT_REACH_SERVER = 60000,          // can not reach the sms server
  INVALID_SMS_VERIFICATION_CODE = 60001;    // Invalid short message verificaiton
                                // code, which might be returned while doing
                                // phone number registration
  SMS_INVALID_MESSAGE_TYPE = 60002;         // Invalid short message type, might
                                // be a non-supported SMSOption
  SMS_AUTHEN_FAILED = 60003;                // short message authentication failed
  SMS_SEND_FAILED = 60004;      // send short message failed
  SMS_INVALID_PHONE_NUM = 60005;// cann't regonize phone number


  AUTHEN_SERVER_TIMEOUT = 100000;      // authen server time out
  UNKNOWN = 9999999;
}

/*
 *
 * kAuthenErrorStr[]'s elements are error info in text
 * coresponding to the up errno
 */
const map<Errno, string> authen_error_str = {
  Errno.SUCCESS : "success";
  Errno.LOGIN_FAILED: "login failed";
  Errno.INVALID_SESSION: "invalid session";
  Errno.WRONG_PASSWD: "wrong password";
  Errno.EMAIL_ALREADY_EXISTED: "email address is already existed";
  Errno.NOT_REGISTERED_EMAIL: "email address is not registered";
  Errno.REGISTRATION_FAILED:  "failed to registration";
  Errno.AUTHEN_SERVER_NOT_READY: "authentication server is not ready";
  Errno.CANNOT_GENERATE_UID: "can't generate uid";
  Errno.UPDATE_DATA_BASE_FAILED: "update database failed";
  Errno.THRIFT_RPC_EXCEPTION: "thrift rpc call exception";
  Errno.INVALID_LOGIN_INFO: "invalid login info";
  Errno.PHONE_NUM_EXISTED: "phone number is already registerred";
  Errno.NICK_NAME_EXISTED: "nick name is already registerred";
  Errno.PHONE_NICK_EXISTED: "both phone and nick name are already registered";
  Errno.PHONE_EMAIL_EXISTED: "both phone and email are already registered";
  Errno.NICK_EMAIL_EXISTED: "both nick name and email are already registered";
  Errno.EMAIL_NICK_PHONE_EXISTED: "nick name, phone and email are already registered";

  Errno.INVALID_BONUS_URLKEY: "invalid bonus url key";
  Errno.BONUS_URLKEY_EXPIRED: "bonus url key is expired";
  Errno.PHONE_NUM_IS_EMPTY: "phobe number is empty";



  Errno.CAN_NOT_CONNECT_TO_MT4_SERVER: "can not connect to mt4 server";
  Errno.NO_MT4ID_INFO: "no mt4 id info in database";
  Errno.NO_BIND_LIVE_MT4ID: "there is no mt4 live id binding to dedicated user";
  Errno.BIND_FAILED: "bind mt4 id to uid failed";

  // forbag errno code description
  Errno.FORBAG_NO_BROKER_USER_INFO: "there is no binding broker info";
  Errno.FORBAG_BROKER_USERID_EXISTED: "the broker user id is already existed";


  Errno.UNKNOWN: "unknown error";
  Errno.INALID_AUTHEN_SERVER_PORT: "invalide authentication server port";
}


/*
 * returned while user log in succeed and send to server for validation
 * when query user infomation.
 ********
 * member variables:
 *    m_session_id:    128 bits uuid concatentated by email, uid
 */
struct SessionInfo{
1: required string  m_session_id="";
2: required i64     m_uid=-1;
}

/*
 * member variables:
 *  m_uid:        formax internal user identifier
 *  m_email:      register email address
 *  m_phone_num:  regiestered phone number
 *  m_nickname:   user nick name
 *  m_realname:   user real name
 *  m_location:   as self explained
 *  m_logo:       user header picture
 *  m_gender:     user gender: -1 represents invalid value
 *                             0 represents male
 *                             1 represents female
 *  m_intro:      user introduction info
 */
struct UserBasicInfo{
1: required i64     m_uid=-1;
2: required string  m_email_addr="";

// [CAUTION]
// when do registration, you must fill the field of m_phone_num
// in the exact format: country_code[space]phone_num(i.e.
// 86 18932812832), or the result is undefined
3: required string  m_phone_num="";
4: required string  m_nickname="";
5: optional string  m_realname="";
6: optional string  m_location="";
7: optional string  m_logo="";
8: optional byte    m_gender=-1;
9: optional string  m_intro;
}

/*
 * registration_affliated info defines the source of registration, which includes:
 * 1. the device type on which the registration is conducted;
 * 2. the sub-platform, on which the registration is conducted;
 * 3. the registration time when the account is registerred
 */
struct RegistrationAffliatedInfo {
1: required byte  m_source_type=0;        // 1 represents apple device
                                          // 2 represents android device
                                          // 3 represents web page
                                          // 4 represents h5 page

2: required byte  m_sub_platform=0;       // 1 represents copy master
                                          // 2 represents forbag
                                          // 3 represents p2p

3: optional string m_registration_time="";// registration time which will be
                                          // used when query this info

4: optional byte  m_registration_type=0;  // 1 represents registration via email
                                          // 2 represents registration via phone
                                          // used when query this info
5: optional i32  m_market_channel = 0;


// [CAUTION] use the following fields in sequence and mark it as used.
6: optional byte  m_ext0 = 0;             // extension field [not used]
7: optional byte  m_ext1 = 0;             // extension field [not used]
8: optional byte  m_ext2 = 0;             // extension field [not used]
9: optional byte  m_ext3 = 0;             // extension field [not used]
10: optional byte  m_ext4 = 0;            // extension field [not used]
11: optional string m_refid = "";         // refid,defaule "" is an illegal value
}


struct RegistrationInfo {
1: required string        m_md5_passwd;

// [CAUTION]
// when do registration, you must fill the field of m_phone_num
// of m_user_basic_info in the exact format:
//  country_code[space]phone_num(i.e. 86 18932812832), or
// the result is undefined
2: required UserBasicInfo m_user_basic_info;

3: optional RegistrationAffliatedInfo m_affliated_info;

4: optional string        m_sms_verification_code = "";  // the short message verfiy code
}


/*
 * client code use FormaxLoginInfo as parameter to login on Formax platform
 */
struct  FormaxLoginInfo{
1: optional i64     m_uid=-1;                      // formax internal identifier
2: optional string  m_mail_addr="";                // mail address as login user account
3: required string  m_md5_passwd="";               // password in plaintext
4: optional i64     m_time_stamp=0;
5: optional i64     m_session_timeout_duration=0;  // session expired after this duration time of inactivity

// [CAUTION]
// when do login with phone, you must fill the field of m_phone
// in the exact format: country_code[space]phone_num(i.e. 86 18932812832)
// or the result is undefined
// And make sure there is no space[s] at the begin or end of m_phone,
// or the result is undefined
6: optional string  m_phone="";                    // phone as login user identifier

// uid auto login key
7: optional string  m_auto_login_key = "";         // when do uid auto login, you need to fill this
                                                   // field with the key you fetched from our server
                                                   // via rpc GetUrlKeyString().
8: optional string  m_login_location = "";         // login location

// [CAUTION] use the following fields in sequence and mark it as used.
9: optional byte    m_ext0 =0;                     // extension field [not used]
10: optional byte    m_ext1 =0;                    // extension field [not used]
}

/*
 * used to store user login record
 * m_login_time and m_logout_time is in format:YYYY-MM-DD HH:MM:SS
 * m_login_time and m_logout_time is beijing time by default
 */
struct FormaxLoginRecord{
1: required string  m_session_id = "";             // session_id
2: required i64     m_uid = -1;                    // login user's uid
3: optional string  m_login_time = "";             // login time
4: optional string  m_login_location= "";          // login location
5: optional string  m_logout_time = "";            // logout time

// 1:normal logout
// 2:session expired
6: optional byte    m_logout_type = 0;             // default 0:no logout type info

// [CAUTION] use the following fields in sequence and mark it as used.
7: optional byte    m_ext0 = 0;                    // extension field [not used]
8: optional byte    m_ext1 = 0;                    // extension field [not used]
}

/*
 * used to fetch login result data
 */
struct FormaxLoginResult{
1: required SessionInfo   m_session_info;
2: required Errno         m_status_code;
3: required UserBasicInfo m_user_basic_info;
}

/*
 * NOTES:
 *   The struct of all the login info is same, why seperate them with
 * different name:
 *    This design is adapted to avoid recompile one of the subsystem such
 * as P2P, MT4 etc. while the other's interface is modified.
 */

/*
 * client code use MT4LoginInfo as parameter to do authentication on MT4 server
 *
 *  currently, only mt4 live account need to be authenticated
 */
struct  MT4LoginInfo{
1: required i64     m_mt4_live_id=-1;         // mt4 live id
2: optional i64     m_uid=-1;                 // formax internal user identifier
3: required string  m_mail_addr="";           // mail address as login user account
4: required string  m_passwd="";              // password should be plain text
}

/*
 * client code use MT4BindInfo as parameter to do binding, which bind Formax Group
 * internal UID with the mt4 account
 */
struct  MT4BindInfo{
1: optional i64     m_uid=-1;               // formax internal identifier
2: optional string  m_mail_addr="";         // mail address as login user account
3: required i64     m_live_login=0;         // mt4 live account
4: required i64     m_demo_login=0;         // mt4 demo account
}

struct MT4Info{
1: required i64 m_live_login=0;
2: required i64 m_demo_login=0;
}


/*
 * client code use P2PLoginInfo as parameter to do authentication on P2P server
 */
struct  P2PLoginInfo{
1: optional i64     m_uid=-1;                 // formax internal identifier
2: optional string  m_mail_addr="";           // mail address as login user account
3: required string  m_passwd="";              // password
}

/*
 * client code use P2PBindInfo as parameter to do binding, which bind Formax Group
 * internal UID with the p2p account
 */
struct  P2PBindInfo{
1: optional i64     m_uid=-1;               // formax internal identifier
2: optional string  m_mail_addr="";         // mail address as login user account
3: required string  m_p2p_uid="";           // p2p account
4: optional string  m_id_number="";         // id card number
}

struct P2PInfo{
1: required string m_p2p_uid="";
2: optional string m_id_number="";
}

/*
 * client code use ForbagLoginInfo as parameter to do authentication on Forbag server
 */
struct  ForbagLoginInfo{
1: optional i64     m_uid=-1;              // formax internal identifier
2: optional string  m_mail_addr="";        // mail address as login user account
3: required string  m_passwd="";           // passwbrd
}

/*
 * client code use ForbagBindInfo as parameter to do binding, which bind Formax Group
 * internal UID with the forbag account
 */
struct  ForbagBindInfo{
1: optional i64     m_uid=-1;               // formax internal identifier
2: optional string  m_mail_addr="";         // mail address as login user account
3: required string  m_broker_user_id="";    // broker user id
4: required i64     m_broker_id=0;          // broker id
}

struct  ForbagBrokerInfo{
1: required string  m_broker_user_id="";    // broker user id
2: required i64     m_broker_id=0;          // broker id
}

/*
 * client code use QuickFixLoginInfo as parameter to do authentication on QuickFix server
 */
struct  QuickFixLoginInfo{
1: optional i64     m_uid=-1;            // formax internal identifier
2: optional string  m_mail_addr="";      // mail address as login user account
3: required string  m_passwd="";         // passwbrd
}

/*
 * client code use ForbagBindInfo as parameter to do binding, which bind Formax Group
 * internal UID with the quickfix account
 */
struct  QuickFixBindInfo{
1: optional i64     m_uid=-1;               // formax internal identifier
2: optional string  m_mail_addr="";         // mail address as login user account
3: required string  m_account="";
}

/*
 * Authentication Server Info
 */
struct AuthenticationServerInfo {
1: required string ip="";
2: required i32    port=0;
3: optional i64    timestamp=0;
// flag used to identify wheather the authen server is alive
4: optional bool   flag = false;
5: optional string tags = '';
}

/*
 * used to store the record of user's last update event
 * m_lastupdate_time is in format:YYYY-MM-DD HH:MM:SS
 * m_lastupdate_time is beijing time by default
 */
struct UserLastUpdateInfo {
1: required i64 m_uid = -1;                   // user's uid
2: optional string m_lastupdate_field = "";   // last updated field,format: field1 | field2 | ...
3: optional string m_lastupdate_time = "";    // last update time
}




/*
 * struct contains starttime and endtime,used when query uids by updating period
 */

// [NOTES]:
// 1.starttime and endtime must be in format:'YYYY-MM-DD HH:MM:SS',
// or the result is not defined
// 2.starttime and endtime must be beijing time

struct UIDQueryRequest {
1: required string m_starttime = "";          // starttime
2: optional string m_endtime = "";            // endtime,if no input value,the current time is used by default
}

/*
 * return uids and querying status when do uids querying
 */
struct UIDQueryResponse {
1: required Errno m_status;
2: required list<i64> m_uids;
}

/*
 * return login record list and query status
 */
struct LoginRecordQueryResponse {
1: required Errno m_status;
2: required list<FormaxLoginRecord> m_login_records;
}

/*
 * return user last update info and query status
 */
struct UpdateInfoQueryResponse {
1: required Errno m_status;
2: required UserLastUpdateInfo m_lastupdate_info;
}

service AuthenticationBaseService{

  //basic interface for loging in/out
  FormaxLoginResult Login(1: required FormaxLoginInfo login_info);
  Errno Logout(1: required SessionInfo session_info);

  // validate session
  Errno ValidateSession(1: required SessionInfo session_info);

  //basic query interface
  UserBasicInfo QueryUserBasicInfoByUID( 1: required i64 uid);
  list<UserBasicInfo> BatchQueryUserBasicInfo( 1: required list<i64> uids);

  // query the registration affliated info
  RegistrationAffliatedInfo QueryUserRegAffliatedInfoByUID(1: required i64 uid);

  //////// subsystem authentication interfaces ////////////
  // MT4:
  //  mt4 related interface
  Errno MT4Authentication(1: required MT4LoginInfo login_info);
  Errno MT4BindAccount(1: required MT4BindInfo bind_info);

  // qurey the mt4 info binded with uid
  MT4Info MT4QueryBindInfo(1: required i64 uid);

  // Forbag:
  Errno ForbagAuthentication(1: required ForbagLoginInfo login_info);
  Errno ForbagBindAccount(1: required ForbagBindInfo bind_info);

  list<ForbagBrokerInfo> ForbagQueryBrokerInfoByUID(
    1: required i64 uid);

  // Formax QuickFix:
  Errno QuickFixAuthentication(1: required QuickFixLoginInfo login_info);
  Errno QuickFixBindAccount(1: required QuickFixBindInfo bind_info);

  // P2P:
  Errno P2PAuthenticationBy(1: required P2PLoginInfo login_info);
  Errno P2PBindAccount(1: required P2PBindInfo bind_info);

  // query the binding p2p info of uid
  P2PInfo P2PQueryBindInfo(1: required i64 uid);
  /////////////////////  end ////////////////////////////

  ///////////////// updating user info /////////////////////
  // interface for update user basic info
  // CAUTIONS, CAUTIONS:
  // if you need to do email or phone binding, then you must set the
  // m_uid field of UserBasicInfo, otherwise the result is undifined
  Errno UpdateUserBasicInfo(1: required UserBasicInfo userinfo);

  // reset password via formax internal indentify: uid
  // NOTES:
  //  1. if the oldpasswd is set to "reset" while called, then this will reset
  // user password with no password check
  //  2. if the oldpasswd is not set to "reset" while called, then the old
  // password will be checked before reset
  Errno ResetUserPasswordByUID(1: required i64 uid,
    2: required string oldpasswd, 3: required string newpasswd);

  // Ping
  Errno Ping();
  /////////////////////  end ////////////////////////////
}
