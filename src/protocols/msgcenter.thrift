namespace cpp msgcenter.protocols
namespace php msgcenter

enum Errno {
  SUCCESS                      = 0,
  FAILURE                      = 1,
  INSILENCE                    = 2,  // 被禁言
  INBLACKLIST                  = 3,  // 被拉黑
  NOTFOLLOW                    = 4,  // 没有关注关系
  CONTENTCENSORED              = 5,  // 内容敏感
}

enum NoticeType {
  ACCOUNT_MONEY                        = 1800000, // 账户资金
  FINANCIAL_ASSISTANT                  = 1800001, // 理财小助手
  STOCK_ASSISTANT                      = 1800002, // 股票小助手
  FOREX_ASSISTANT                      = 1800003, // 外汇小助手
  MASTER_ASSISTANT                     = 1800004, // 牛人圈小助手 改名为 社区互动
  LIFE_ASSISTANT                       = 1800005, // life小助手
  FORMAX_MEMBER                        = 1800006, // 金融圈会员
  FORMAX_ACTIVITY                      = 1800007, // 金融圈活动
  SYSTEM_NOTICE                        = 1800008, // 系统通知
  MASTER_OFFICAL                       = 1800009, // 牛人圈小助手
  AMERICAN_STOCK                       = 1800010, // 美股内参
  HOT_NEWS                             = 1800011, // 热门资讯
  LICAI_RESERVED1                      = 1800012, // 保留id，理财后台使用
  LICAI_RESERVED2                      = 1800013, // 保留id，理财后台使用

  LOAN_ACCOUNT_MONEY                   = 1800014, // 简洁版理财APP账户资金
  LOAN_ACTIVITY                        = 1800015, // 简洁版理财APP活动
  LOAN_SYSTEM                          = 1800016, // 简洁版理财APP系统通知
  LOAN_ASSISTANT                       = 1800017, // 简洁版理财小助手

  BOND_ACCOUNT_MONEY                   = 1800018, // 简洁版证券APP账户资金
  BOND_ACTIVITY                        = 1800019, // 简洁版证券APP活动
  BOND_SYSTEM                          = 1800020, // 简洁版证券APP系统通知
  BOND_FOREX_ASSISTANT                 = 1800021, // 简洁版证券APP外汇小助手
  BOND_STOCK_ASSISTANT                 = 1800022, // 简洁版证券APP股票小助手
  BOND_MASTER_ASSISTANT                = 1800023, // 简洁版证券APP社区小助手
  BOND_MASTER_OFFICAL                  = 1800024, // 简洁版证券APP牛人圈小助手
  BOND_HOT_NEWS                        = 1800025, // 简洁版证券APP热门资讯
  BOND_AMERICAN_STOCK                  = 1800026, // 简洁版证券APP港美股内参

  LIFEAPP_NOTICE                       = 1900000, // 独立版life app系统通知
  INSUREANCE_NOTICE                    = 1900001, // 保险app系统通知
}

enum ReportType {
  NONE                               = 0,   // 全部
  TYPE_1                             = 1,   // 低俗色情（位操作）
  TYPE_2                             = 2,   // 广告骚扰
  TYPE_3                             = 4,   // 谣言虚假
  TYPE_4                             = 8,   // 政治敏感
  TYPE_5                             = 16,  // 违法违禁
  TYPE_6                             = 32,  // 恶意刷屏
  TYPE_7                             = 64,  // 谩骂攻击
  TYPE_8                             = 128, // 其它
}

struct ErrInfo {
  1: required Errno err_no;
  2: optional string err_msg;
}

struct TerminalInfo {
  1: optional i32 market_place; // APP市场
  2: optional i32 version; // 版本
  3: optional i32 device_type; // 设备类型
  4: optional string device_key; // 唯一标示uuid
  5: optional string lang; // 终端语言
  6: optional i32 app_type; //APP类型，1:金融圈 2:股票圈 4:life
  7: optional i32 sys_version; //系统版本（两位版本）
  8: optional string idfa;  // iOS平台广告标示符
}

struct UserBaseInfo {
  1: required i64 uid;
  2: required string nickname; // 名称， 昵称
  3: optional string logo_url; // 头像
  4: optional string label_name; // 标签
  5: optional string label_url;  // 列表页标签图片
  6: optional string blue_label_url;  // 详情页标签图片
  7: optional string homepage_url;  // 牛人主页
}

struct ContentPicture {
  1: optional string pic_url;  // 消息包含的图片
  2: optional string pic_jump_schema;  // 图片跳转链接
}

// 对应app卡片样式和小图样式
struct StyleCardMsg {
  1: optional string title;
  2: optional string msg_content;  // 消息内容 支持 H5
  3: optional list<ContentPicture> msg_picture;  // 消息图片
  4: optional string msg_jump_schema;  // “查看详情”跳转链接
}

// 大图样式
struct StylePictureMsg {
  1: optional string title;
  2: optional list<ContentPicture> msg_picture;
  3: optional string msg_jump_schema;
}

// 纯文本
struct StyleContentMsg {
  1: optional string msg_content;
  2: optional string err_tips;  // 私信发送失败的提示信息
}

struct StyleShareInfo {
  1: required string title;
  2: required string msg;
  3: required string icon_url;
  4: required string jump_url;
}

struct PublishMsgNode {
  1: optional StyleCardMsg card_msg;
  2: optional StyleContentMsg content_msg;
  3: optional StylePictureMsg pic_msg;
}

struct MsgNode {
  1: required i64 msgid;  // 消息id  终端发送时不填写
  2: required i64 src_uid; // 发送方id   账户资金 理财小助手  牛人id
  3: required i64 des_uid; // 接收方id
  4: required i64 create_time;
  5: optional PublishMsgNode msg_zh;
  6: optional PublishMsgNode msg_en;
  7: optional PublishMsgNode msg_hk;
  8: optional i32 msg_level = 0;  // 通知强度：0：弱提醒，1：强提醒
  9: optional i32 msg_state = 0;  // 消息状态，0：发送成功，1：发送失败
}

struct MsgListNode {
  1: required UserBaseInfo user_base_info;
  2: optional MsgNode msg;                  // 最新一条消息
  3: optional i32 unread_total = 0;         // 未读消息数（强提醒 + 弱提醒）
  4: optional i32 unread_strong = 0;        // 未读强提醒消息数
  5: optional string extra;                 // 跳转 牛人圈消息需要
  6: optional bool is_block = false;        // 关闭消息提醒(官方号)
  7: optional i32 type ;                    // 1.私信 2.官方号
}

struct QueryMsgListReq {
  1: required i64 uid;
  101: TerminalInfo terminal_info;
}

struct QueryMsgCountReturn {
  1: required ErrInfo err_info;
  2: optional i32 unread_total = 0;  // 未读消息数（强提醒 + 弱提醒）
  3: optional i32 unread_strong = 0;  // 未读强提醒消息数
  4: optional i32 unread_dynamic = 0;  // 社区互动未读消息数（强提醒 + 弱提醒）
}

struct QueryMsgListReturn {
  1: required ErrInfo err_info;
  2: optional list<MsgListNode> msg_node_list;
}

struct QueryUserMsgReq {
  1: required i64 uid;
  2: required i64 src_uid;  // 发送方uid，拉取和谁的聊天记录
  3: optional i64 last_msgid = 0; // 0 最新的一条开始拉取
  4: optional i64 msg_num  = 15;
  5: optional bool is_new = 0;  // false：拉取老数据，true：拉取新数据
  101: TerminalInfo terminal_info;
}

struct QueryUserMsgReturn {
  1: required ErrInfo err_info;
  2: optional UserBaseInfo user_base_info;
  3: optional list<MsgListNode> msg_list;
  4: optional bool has_more = false;
  5: optional bool is_block = false;    //是否关闭消息提醒
}

struct SendUserMsgReq {
  1: required MsgNode msg;
  2: optional i64 temp_msgid;  // 客户端生成的临时消息id，用以区分发送结果是针对哪条消息
  101: optional TerminalInfo terminal_info;
}

struct SendUserMsgReturn {
  1: required ErrInfo err_info;
  2: optional i64 msgid;
  3: optional string desc;  // 发送结果提示信息
  4: optional i64 temp_msgid;  // 客户端生成的临时消息id
}

struct PushBody {
  1: optional string brief;  // 摘要
  2: optional string title;  // 标题
  3: optional string content; // 内容
  4: optional string extra_data; // 链接
  5: optional string lang = "zh"; // 语言
}

struct PushUserNoticeMsgReq {
  1: required list<i64> uid_list; // 接收方 uid
  2: required i64 type; // 发送方，类型详见 NoticeType
  3: optional string msg_key;  // 消息唯一标识 业务端生成，确保无重复
  4: optional i32 buss_type = 1; // 业务类型  1 理财 2 股票 3 外汇 4 牛人圈 5 life 6 保险
  5: optional PublishMsgNode msg_zh;
  6: optional PublishMsgNode msg_hk;
  7: optional PublishMsgNode msg_en;
  8: optional i32 msg_version = -1; // 消息对应app版本 -1 全部版本
  9: optional i32 msg_level = 0;  // 通知强度：0：弱提醒，1：强提醒 (带有push)
  10: optional i64 create_time; // 发送方消息创建的时间
  11: optional PushBody push_body; // 业务方自定义push内容
  12: optional PushBody push_body_en;
  13: optional PushBody push_body_hk;
  14: optional string buss_mark = "PLATFORM"; // push发送方标识
  15: optional i64 msg_src; // 消息来源，类型详见 NoticeSource
  16: optional i64 push_msg_type; //推送消息类型,  1 NOTICE_INFO 2 FOLLOW_INFO 3 COPY_INFO 
                                            //   4 BONUS_INFO 5 P2P_INFO 6 FORBAG_INFO 7 EXCHANGE_INFO
  17: optional string push_msg_src;  // 消息来源类型，和msg_src功能相同，
  101: optional bool sync_old_msg = false; // 同步到老的消息
}

struct PushUserNoticeMsgReturn {
  1: required ErrInfo err_info;
}

struct RefreshMsgListReq {
  1: required list<i64> uid_list;
}

struct RefreshMsgListReturn {
  1: required ErrInfo err_info;
}

struct Blacklist {
  1: required i64 uid;
  2: required i64 ban_end_time; // 禁言结束时间
  3: optional i32 level = 1; // 级别
}

struct UserBlacklist {
  1: required map<i64, Blacklist> blacklist_map;
}

struct OptBlackListReq {
  1: required i64 uid;
  2: required i64 des_uid;
  3: required i32 opt_type;  // 1 加入黑名单， 2 移出黑名单
  101: optional TerminalInfo terminal_info;
}

struct OptBlackListReturn {
  1: required ErrInfo err_info;
}

struct QueryBlackListReq {
  1: required i64 uid;
  101: optional TerminalInfo terminal_info;
}

struct QueryBlackListReturn {
  1: required ErrInfo err_info;
  2: optional list<UserBaseInfo> black_list;
}

struct IsInMyBlackListReq {
  1: required i64 me_uid;
  2: required i64 uid2;
  101: optional TerminalInfo terminal_info;
}

struct ReportUserReq {
  1: required i64 uid;            // 举报者uid
  2: required i64 des_uid;        // 被举报人uid
  3: required i32 report_reason;  // 举报原因，见ReportType
  4: optional string report_pic;  // 举报内容截图
  101: optional TerminalInfo terminal_info;
}

struct ReportUserReturn {
  1: required ErrInfo err_info;
  2: optional string desc;  // 举报结果提示信息
}

struct ReportedMsg {
  1: required i64 msgid;          // 被举报消息id，不同于消息id
  2: required i64 uid;            // 被举报人uid
  3: required string nickname;    // 被举报人昵称
  4: required i32 identity;       // 1：小白，2：牛人
  5: required i32 report_reason;  // 举报原因，见ReportType
  6: required string report_pic;  // 举报内容截图
  7: required i64 report_uid;     // 举报人uid
  8: required string report_user; // 举报人昵称
  9: required i32 reported_num;   // 被举报次数
  10: required i64 reported_time;  // 被举报时间
  11: required i32 status;         // 被举报人状态，1：正常，2：警告，3：禁言三天，4：永久禁言
  12: optional i32 violation_level; // 违规等级，1：无效举报，2：轻度，3：中度，4：重度
  13: optional string comment;    // 备注
  14: optional i32 process_status;  // 1： 待处理，2：已处理
}

struct GetReportedMsgReq {
  1: optional i64 uid;            // 被举报人uid
  2: optional string nickname;    // 被举报人昵称，支持模糊搜索
  3: optional i32 process_status = 1;  // 1： 待处理，2：已处理，0：全部
  4: optional i32 identity = 0;   // 1：小白，2：牛人，0：全部
  5: optional i32 report_reason = 0;  // 举报原因，见ReportType
  6: optional i32 status = 0; // 被举报人状态，1：正常，2：警告，3：禁言三天，4：永久禁言，0：全部
  7: optional i32 start_index = 0; // 分页索引
  8: optional i32 num = 20;       // 每页条数
}

struct GetReportedMsgReturn {
  1: required ErrInfo err_info;
  2: optional i64 total_count;
  3: optional list<ReportedMsg> msg_list;
}

struct ProcessReportedMsgReq {
  1: required i64 msgid;          // 被处理的消息
  2: required i64 uid;            // 被举报人uid
  3: required i64 report_uid;     // 举报人uid
  4: required i32 violation_level; // 违规等级，1：无效举报，2：轻度，3：中度，4：重度
  5: required string optor;       // 操作者名称
  6: optional string comment;     // 备注
}

struct ProcessReportedMsgReturn {
  1: required ErrInfo err_info;
  2: optional string desc;        // 操作结果提示语
}

struct ReportRecord {
  1: required i64 uid;            // 被举报者uid
  2: required string nickname;    // 被举报者昵称
  3: required i32 violation_level; // 违规等级，1：无效举报，2：轻度，3：中度，4：重度
  4: required i64 process_time;   // 处理时间
  5: required string optor;       // 操作者名称
  6: optional string comment;     // 备注
}

struct GetReportRecordReq {
  1: optional i64 uid;            // 被举报者uid
  2: optional string nickname;    // 被举报者昵称
  3: optional string optor;       // 操作者名称
  4: optional i32 start_index = 0;   // 分页索引
  5: optional i32 num = 20;       // 每页条数
}

struct GetReportRecordReturn {
  1: required ErrInfo err_info;
  2: optional i64 total_count;
  3: optional list<ReportRecord> record_list;
}

struct GetWatchingRuleReq {
}

struct GetWatchingRuleReturn {
  1: required ErrInfo err_info;
  2: optional i32 period = 10;    // 触发时间段，分钟
  3: optional i32 times = 3;      // 触发频次
  4: optional i32 status = 3;     // 违规处理，3：禁言三天，4：永久禁言
}

struct SetWatchingRuleReq {
  1: optional i32 period = 10;    // 触发时间段，分钟
  2: optional i32 times = 3;      // 触发频次
  3: optional i32 status = 3;     // 违规处理，3：禁言三天，4：永久禁言
}

struct SetWatchingRuleReturn {
  1: required ErrInfo err_info;
}

struct WatchedMsg {
  1: required i64 msgid;          // 消息id
  2: required i64 uid;            // 违规人uid
  3: required string nickname;    // 违规人昵称
  4: required i32 identity;       // 1：小白，2：牛人
  5: required i32 status;         // 用户状态，1：正常，2：警告，3：禁言三天，4：永久禁言
  6: required string content;     // 触发内容
  7: required i64 peer_uid;       // 私信对象uid
  8: required string peer_user;   // 私信对象
  9: required i64 add_time;       // 触发监控时间
  10: optional i64 start_time;     // 禁言开始时间
  11: optional i64 end_time;      // 禁言结束时间
}

struct GetWatchedMsgReq {
  1: optional i64 uid;            // 违规人uid
  2: optional string nickname;    // 违规人昵称
  3: optional i32 identity = 0;   // 1：小白，2：牛人，0：全部
  4: optional i32 start_index = 0;  // 分页索引
  5: optional i32 num = 20;       // 每页条数
}

struct GetWatchedMsgReturn {
  1: required ErrInfo err_info;
  2: optional i64 total_count;
  3: optional list<WatchedMsg> msg_list;
}

struct SilencedUser {
  1: required i64 uid;
  2: required string nickname;
  3: required i32 identity;         // 1：小白，2：牛人
  4: required i32 status;           // 用户状态，3：禁言三天，4：永久禁言
  5: required i32 source;           // 来源，1：人工，2：系统/自动，3：举报
  6: optional i64 start_time;       // 禁言开始时间
  7: optional i64 end_time;         // 禁言结束时间
}

struct GetSilencedUserReq {
  1: optional i64 uid;
  2: optional string nickname;
  3: optional i32 identity = 0;     // 1：小白，2：牛人，0：全部
  4: optional i32 status = 0;       // 用户状态，3：禁言三天，4：永久禁言，0：全部
  5: optional i32 start_index = 0;  // 分页索引
  6: optional i32 num = 20;         // 每页条数
}

struct GetSilencedUserReturn {
  1: required ErrInfo err_info;
  2: optional i64 total_count;
  3: optional list<SilencedUser> user_list;
}

struct OutSilencedUserReq {
  1: required i64 uid;              // 被解禁者uid
  2: required string optor;         // 操作者名称
  3: optional string comment;       // 备注
}

struct OutSilencedUserReturn {
  1: required ErrInfo err_info;
}

struct SilenceRecord {
  1: required i64 uid;            // 被禁言者uid
  2: required string nickname;    // 被禁言者昵称
  3: required i32 identity;       // 被禁言者身份，1：小白，2：牛人
  4: required i32 status;         // 用户状态，3：禁言三天，4：永久禁言
  5: required i32 source;         // 来源，1：人工，2：系统/自动，3：举报
  6: required i64 add_time;       // 操作时间
  7: required string optor;       // 操作者名称
  8: optional i64 start_time;     // 禁言开始时间
  9: optional i64 end_time;       // 禁言结束时间
  10: optional string comment;    // 备注
}

struct GetSilenceRecordReq {
  1: optional i64 uid;            // 被禁言者uid
  2: optional string nickname;    // 被禁言昵称
  3: optional string optor;       // 操作者名称
  4: optional i32 start_index = 0;   // 分页索引
  5: optional i32 num = 20;       // 每页条数
}

struct GetSilenceRecordReturn {
  1: required ErrInfo err_info;
  2: optional i64 total_count;
  3: optional list<SilenceRecord> record_list;
}

struct RelationFollowInfo {
  1: required i64 timestamp = 0;             //过期时间
}

struct IsFollowerReq {
  1: required i64 me_uid;
  2: required i64 uid2;
  3: required i64 follow_type; // bit 1b STOCK 10b FOREX
}

struct IsFollowerReturn {
  1: required ErrInfo err_info;
  2: required i64 follow; // 0: no follow 1: following
}

struct Follower {
  1: required i64 uid;
}

struct GetAllMyFollowersReq {
  1: required i64 uid = 0;
  2: required i64 follow_type = 3; // bit 1b: 股票 10b: 外汇 11b: 外汇&股票
}

struct GetAllMyFollowersReturn {
  1: required ErrInfo        err_info;
  2: optional list<Follower> stock_followers;       // enable when follow_type = 1 or 3
  3: optional list<Follower> forex_followers;       // enable when follow_type = 2 or 3
}

struct OAPushUserNoticeMsgReq {
  1: required i64 msgid;                   // 消息唯一标识，删除未发送消息时带上
  2: required i64 type;                    // 发送方，类型详见 NoticeType
  3: optional list<i64> uid_list;          // 接收方uid
  4: optional string uid_url;              // 接收方uid配置文件
  5: optional i32 msg_level = 0;           // 通知强度：0：弱提醒，1：强提醒 (带有push)
  6: optional i64 send_start_time = 0;     // 消息推送开始时间
  7: optional i64 send_end_time = 0;       // 消息推送结束时间
  8: optional PublishMsgNode msg_zh;       // 系统消息 - 中文
  9: optional PublishMsgNode msg_hk;       // 系统消息 - 繁体中文
  10: optional PublishMsgNode msg_en;      // 系统消息 - 英文
  11: optional PushBody push_body_zh;      // push消息 - 中文
  12: optional PushBody push_body_hk;      // push消息 - 繁体中文
  13: optional PushBody push_body_en;      // push消息 - 英文
  14: optional string buss_mark = "PLATFORM"; // push发送方标识
}

struct OADelTimeUnreachedMsgReq {
  1: required i64 msgid;
}

struct OAQueryUserMsgReq {
  1: optional i64 uid;                     // 用户uid
  2: optional i32 identity;                // 用户身份，0：全部，1：小白，2：牛人
  3: optional i64 start_time;              // 查询内容起始时间，不带默认查询一周内容
  4: optional i64 end_time;                // 查询内容截止时间
  5: optional string nickname;             // 用户昵称
  6: optional string content;              // 查询内容
  7: optional i32 start_index = 0;         // 分页索引
  8: optional i32 num = 20;                // 每页条数
}

struct OAUserMsg {
  1: required i64 msgid;                   // 消息id，消息唯一标识
  2: required i64 src_uid;                 // 发送方uid
  3: required i64 des_uid;                 // 接收方uid
  4: required i32 src_identity;            // 发送方身份，1：小白，2：牛人
  5: required i32 des_identity;            // 接收方身份
  6: required i64 create_time;             // 私信发送时间
  7: required i32 msg_status;              // 私信发送状态，详见Errno
  8: required string src_nickname;         // 发送方昵称
  9: required string des_nickname;         // 接收方昵称
  10: required string content;             // 私信内容
  11: optional list<string> censored_words; // 私信内容包含的敏感词
}

struct OAQueryUserMsgReturn {
  1: required ErrInfo err_info;
  2: optional i64 total_count;
  3: optional list<OAUserMsg> msg_list;
}

struct OAUserSentMsg {
  1: required i64 msgid;                  // 消息id
  2: required i64 uid;                    // 用户uid
  3: required i64 offical_id;             // 留言对象id，见NoticeType
  4: required i64 create_time;            // 留言时间
  5: required i32 status;                 // 留言状态，0：待处理，1：已处理
  6: required i32 type;                   // 消息类型，0：用户留言，1：官方回复
  7: required string nickname;            // 用户昵称
  8: required string des_name;            // 留言对象
  9: required string content;             // 留言内容
  10: optional string comment;            // 备注
}

struct OAQueryUserSentMsgReq {
  1: optional i64 uid;                     // 用户uid
  2: optional i64 offical_id;              // 留言对象，见NoticeType
  3: optional string nickname;             // 用户昵称
  4: optional string content;              // 留言内容
  5: optional i32 start_index = 0;         // 分页索引
  6: optional i32 num = 20;                // 每页条数
}

struct OAQueryUserMsgRecordReq {
  1: required i64 uid;                     // 用户uid
  2: required i64 offical_id;              // 留言对象，见NoticeType
  3: optional i32 start_index = 0;         // 分页索引
  4: optional i32 num = 20;                // 每页条数
}

struct OAQueryUserSentMsgReturn {
  1: required ErrInfo err_info;
  2: optional i64 total_count;
  3: optional list<OAUserSentMsg> msg_list;
}

struct OAAnswerUserMsgReq {
  1: required i64 msgid;                    // 最新一条用户留言id
  2: required i64 uid;                      // 用户uid
  3: required i64 offical_id;               // 留言对象
  4: required string content;               // 回复内容
  5: optional string comment;               // 备注
}

struct OAAnswerUserMsgReturn {
  1: required ErrInfo err_info;
}

struct DeleteConversationReq {
    1: required i64 uid;                    //用户uid
    2: required string msgid;                  //消息uid
    3: required i64 type;                   //1.私信  2.官方号
    4: required i64 opt;                    // 1.删除(屏蔽) 2.恢复(取消屏蔽)
    101: TerminalInfo terminal_info;         
}

struct DeleteConversationReturn {
    1: required ErrInfo err_info;
}

service MsgCenterService {

  // 业务端接口

  // 业务端发送通知接口
  PushUserNoticeMsgReturn PushUserNoticeMsg(1: required PushUserNoticeMsgReq req);
  // 同步数据库老消息接口
  PushUserNoticeMsgReturn SyncOldMsg(1: required PushUserNoticeMsgReq req);
  // 刷新消息列表
  RefreshMsgListReturn RefreshMsgList(1: required RefreshMsgListReq req);


  // app接口

  // 消息入口红点逻辑，查询未读消息数
  QueryMsgCountReturn QueryMsgCount(1: required QueryMsgListReq req);
  // 拉取消息列表
  QueryMsgListReturn QueryMsgList(1: required QueryMsgListReq req);
  // 取消息详情列表
  QueryUserMsgReturn QueryUserMsg(1: required QueryUserMsgReq req);
  // 发送消息
  SendUserMsgReturn SendUserMsg(1: required SendUserMsgReq req);
  // 黑名单
  OptBlackListReturn OptBlackList(1: required OptBlackListReq req);
  QueryBlackListReturn QueryBlackList(1: required QueryBlackListReq req);
  ErrInfo IsInMyBlackList(1: required IsInMyBlackListReq req);
  // relation
  IsFollowerReturn IsMyFollower(1: required IsFollowerReq req);
  GetAllMyFollowersReturn GetAllMyFollowers(1: required GetAllMyFollowersReq req);
  // 举报
  ReportUserReturn ReportUser(1: required ReportUserReq req);

  //app4.2.8屏蔽系统消息提醒和删除私信
  DeleteConversationReturn DeleteConversation(1: required DeleteConversationReq req); 

  // oa接口

  // 私信举报
  // 查询被举报的消息
  GetReportedMsgReturn GetReportedMsg(1: required GetReportedMsgReq req);
  // 处理被举报的消息
  ProcessReportedMsgReturn ProcessReportedMsg(1: required ProcessReportedMsgReq req);
  // 查询举报操作日志
  GetReportRecordReturn GetReportRecord(1: required GetReportRecordReq req);

  // 私信监控
  // 查询监控设置
  GetWatchingRuleReturn GetWatchingRule(1: required GetWatchingRuleReq req);
  // 设置监控规则
  SetWatchingRuleReturn SetWatchingRule(1: required SetWatchingRuleReq req);
  // 查询监控到的违规消息
  GetWatchedMsgReturn GetWatchedMsg(1: required GetWatchedMsgReq req);

  // 禁言管理
  // 查询被禁言的用户
  GetSilencedUserReturn GetSilencedUser(1: required GetSilencedUserReq req);
  // 解禁
  OutSilencedUserReturn OutSilencedUser(1: required OutSilencedUserReq req);
  // 查询禁言操作日志
  GetSilenceRecordReturn GetSilenceRecord(1: required GetSilenceRecordReq req);

  // oa消息管理
  PushUserNoticeMsgReturn OAPushUserNoticeMsg(1: required OAPushUserNoticeMsgReq req);
  PushUserNoticeMsgReturn OADelTimeUnreachedMsg(1: required OADelTimeUnreachedMsgReq req);

  // oa内容管理
  OAQueryUserMsgReturn OAQueryUserMsg(1: required OAQueryUserMsgReq req);

  // oa用户留言
  // 查询用户留言
  OAQueryUserSentMsgReturn OAQueryUserSentMsg(1: required OAQueryUserSentMsgReq req);
  // 查询对话记录
  OAQueryUserSentMsgReturn OAQueryUserMsgRecord(1: required OAQueryUserMsgRecordReq req);
  // 回复用户留言
  OAAnswerUserMsgReturn OAAnswerUserMsg(1: required OAAnswerUserMsgReq req);
}
