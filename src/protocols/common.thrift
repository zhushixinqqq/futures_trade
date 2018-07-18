namespace cpp futures_trade.protocols
namespace php futures_trade_common

enum Errno {
  UNKNOWN = 0,
  SUCCESS = 1,

  ///////////////
  //sp_trade_info
  ///////////////
  ERR_SP_TRADE_INFO_START= 10000,
  ERR_SP_TRADE_INFO_ERR= 10001,
  ERR_SP_TRADE_INFO_ADD_ORDER_ERR= 10002,
  ERR_SP_TRADE_INFO_ACCOUNT_GET_STATUS= 10003,
  ERR_SP_TRADE_INFO_GET_FUND_IN_OUT = 10004,
  ERR_SP_TRADE_INFO_CHANGE_ORDER_ERR = 10005,
  ERR_SP_TRADE_INFO_DEL_ORDER_ERR = 10006,
  ERR_SP_TRADE_INFO_GET_ORDER_BY_NO_ERR = 10007,
  ERR_SP_TRADE_INFO_SET_ORDER_INACTIVE_ERR = 10008,
  ERR_SP_TRADE_INFO_GET_ACTIVE_ORDER_ERR = 10009,
  ERR_SP_TRADE_INFO_GET_TRADE_ERR = 10010,
  ERR_SP_TRADE_INFO_GET_POSITION_ERR = 10011,
  ERR_SP_TRADE_INFO_GET_PRICE_ERR = 10012,
  ERR_SP_TRADE_INFO_GET_ACC_INFO_ERR = 10013,
  ERR_SP_TRADE_INFO_GET_TICKER_ERR = 10014,
  ERR_SP_TRADE_INFO_CHANGE_PASSWD_ERR = 10015,
  ERR_SP_TRADE_INFO_GET_HISORDER_ERR = 10016,
  ERR_SP_TRADE_INFO_INDEX_INVALID = 10017,
  ERR_SP_TRADE_INFO_QUOTEID_INVALID = 10018,
  ERR_SP_TRADE_INFO_END= 10999,

  ///////////////
  //sp_proxy
  ///////////////
  ERR_SP_PROXY_START = 11000,

  ERR_SP_PROXY_ACCNO_LOGIN_ERR = 11001,
  ERR_SP_PROXY_CHANGEPASSWORD_ERR = 11002
  ERR_SP_PROXY_ADDORDER_ERR = 11003,
  ERR_SP_PROXY_DELETE_ERR = 11004,
  ERR_SP_PROXY_CHANGE_ERR = 11005,

  ERR_SP_PROXY_GETACTIVEORDER_ERR = 11006,
  ERR_SP_PROXY_GETACTIVEORDER_NULL = 11007,

  ERR_SP_PROXY_GETTRADE_ERR = 11008,
  ERR_SP_PROXY_GETTRADE_NULL = 11009,

  ERR_SP_PROXY_GETPOSITION_ERR = 11010,
  ERR_SP_PROXY_GETPOSITION_NULL = 11011,

  ERR_SP_PROXY_GETACCINFO_ERR = 11012,
  ERR_SP_PROXY_GETACCINFO_NULL = 11013,

  ERR_SP_PROXY_END = 11999,

  ///////////////
  //data_center
  ///////////////
  ERR_DATA_CENTER_START = 12000,
  ERR_DATA_CENTER_MYSQL_GET_ORDER_BY_NO_ERROR = 12001,
  ERR_DATA_CENTER_GET_ORDER_BY_NO_ERROR = 12002,
  ERR_DATA_CENTER_GET_POSITION_ERROR = 12003,
  ERR_DATA_CENTER_GET_ACC_INFO_ERROR = 12004,
  ERR_DATA_CENTER_GET_HIS_ORDER_ERROR = 12005,
  ERR_DATA_CENTER_GET_TRADE_ERROR = 12006,

  ERR_DATA_CENTER_END = 12999,
}

struct ErrInfo {
  1: required Errno err_no,
  2: optional string err_msg = "default err msg",
  3: optional string err_msg_en = "",
  4: optional string err_msg_trad = "",
}

enum AccessType {
  FUTURE_BACK = 0,
  CELL_PROXY = 1,
  PLAT_BACK = 2,
  PHP = 3,
}

/*
   参数说明
   access_type: AccessType
   access_name: 来源服务名，比如cell_proxy
   request_id: 全局唯一id，用来区分本次请求
*/
struct AccessInfo {
  1: required AccessType access_type;
  2: required string access_name;
  3: optional string request_id;
}

//订单条件类型
enum OrderCondType {
  COND_NONE = 0,
  COND_STOP = 1,
  COND_SCHEDTIME = 3,
  COND_OCOSTOP = 4,
  COND_TRAILSTOP = 6,
  COND_COMBO_OPEN = 8,
  COND_COMBO_CLOSE = 9,
  COND_STOP_PRC = 11,
  COND_OCOSTOP_PRC = 14,
  COND_TRAILSTOP_PRC = 16
}

//订单类型
enum OrderPriceType {
  ORD_LIMIT = 0,        //限价单
  ORD_AUCTION = 2,      //竞价单
  ORD_MARKET = 6        //市价单
}

//订单有效类型
enum VLDType {
  VLD_REST_OF_DAY = 0,
  VLD_FILL_AND_KILL = 1,
  VLD_FILL_OR_KILL = 2,
  VLD_UNTIL_EXPIRE = 3,
  VLD_SPEC_TIME = 4
}

enum OrderStatus {
  ORDSTAT_SENDING = 0,
  ORDSTAT_WORKING = 1,
  ORDSTAT_INACTIVE = 2,
  ORDSTAT_PENDING = 3,
  ORDSTAT_ADDING = 4,
  ORDSTAT_CHANGING = 5,
  ORDSTAT_DELETING = 6,
  ORDSTAT_INACTING = 7,
  ORDSTAT_PARTTRD_WRK = 8, // partial traded & working
  ORDSTAT_TRADED = 9,
  ORDSTAT_DELETED = 10,
  ORDSTAT_APPROVEWAIT = 18,
  ORDSTAT_TRADEDREP = 20, // traded & reported
  ORDSTAT_DELETEDREP = 21, // deleted & reported
  ORDSTAT_RESYNC_ABN = 24, // resync abnormal
  ORDSTAT_PARTTRD_DEL = 28, // partial traded & deleted
  ORDSTAT_PARTTRD_REP = 29, // partial traded & reported (deleted)
  ORDSTAT_ERROR = 100      // sp return error
}

struct Order{
  1: required double Price;          //价格
  2: required double StopLevel;      //止损价格
  3: required double UpLevel;        //上限水平
  4: required double UpPrice;        //上限价格
  5: required double DownLevel;      //下限水平
  6: required double DownPrice;      //下限价格
  7: required i64 ExtOrderNo;        //外部指示
  8: required i32 IntOrderNo;        //用户订单编号
  9: required i32 Qty;               //剩余数量
  10: required i32 TradedQty;        //已成交数量
  11: required i32 TotalQty;         //全部数量
  12: required i32 ValidTime;        //有效时间
  13: required i32 SchedTime;        //预订发送时间
  14: required i32 TimeStamp;        //服务器接收订单时间
  15: required i32 OrderOptions;     //T+1 1:Yes 0:No
  16: required string AccNo;         //用户帐号
  17: required string ProdCode;      //合约代号
  18: required string Initiator;     //下单用户
  19: required string Ref;           //参考
  20: required string Ref2;          //参考2
  21: required string GatewayCode;   //网关
  22: required string ClOrderId;     //用户自定义指令代号
  23: required byte BuySell;         //买卖方向 'B':Buy,'S':Sell
  24: required byte StopType;        //止损类型 0,'L':STOP_LOSS,'U':STOP_UP,'D':STOWN
  25: required byte OpenClose;       //开平仓 '\0':OC_DEFAULT,'O':OC_OPEN,'C':OC_CLOSE,'M':OC_MANDATORY_CLOSE
  26: required OrderCondType CondType;   //订单条件类型
  27: required OrderPriceType OrderType; //订单价格类型
  28: required VLDType ValidType;        //订单有效类型
  29: required OrderStatus Status;       //状态
  30: required byte DecInPrice;      //合约小数位
  31: required byte OrderAction;     //1：新增  2：修改 3：删除
  32: required i32 UpdateTime;
  33: required i32 UpdateSeqNo;
  34: optional double Fees;          // 费用
  35: optional double Profit;        // 盈亏
  36: optional string Remark;        // 错误信息
  37: optional string ProdName;      // 名称
  38: required double Deposit;       // 保证金
  39: required double EntrustPrice;  // 委托价格
  40: required double CurrentPrice;  // 现价
}

struct Position {
  1: required i32 Qty;                 //上日仓位
  2: required i32 DepQty;              //存储仓位
  3: required i32 LongQty;             //今日长仓
  4: required i32 ShortQty;            //今日短仓
  5: required double TotalAmt;         //上日成交
  6: required double DepTotalAmt;      //上日持仓总数(数量*价格)
  7: required double LongTotalAmt;     //今日长仓总数(数量*价格)
  8: required double ShortTotalAmt;    //今日短仓总数(数量*价格)
  9: required double PLBaseCcy;        //盈亏(基本货币)
  10: required double PL;              //盈亏
  11: required double ExchangeRate;    //汇率
  12: required string AccNo;           //用户
  13: required string ProdCode;        //合约代码
  14: required byte LongShort;         //上日持仓买卖方向 'B':Buy,'S':Sell
  15: required byte DecInPrice;        //小数点 tinyint
  16: optional string ProdName;        //合约名称
  17: required double MarketPrice;     //市价
}

struct TradeInfo {
  1: required i32 RecNo;
  2: required double Price;             //成交价格
  3: required i64 TradeNo;              //成交编号
  4: required i64 ExtOrderNo;           //外部指示
  5: required i32 IntOrderNo;           //用户订单编号
  6: required i32 Qty;                  //成交数量
  7: required i32 TradeDate;            //成交日期
  8: required i32 TradeTime;            //成交时间
  9: required string AccNo;             //用户
  10: required string ProdCode;         //合约代码
  11: required string Initiator;        //下单用户
  12: required string Ref;              //参考
  13: required string Ref2;             //参考2
  14: required string GatewayCode;      //网关
  15: required string ClOrderId;        //用户自定义指令代号
  16: required byte BuySell;            //买卖方向
  17: required byte OpenClose;          //开平仓 '\0':OC_DEFAULT,'O':OC_OPEN,'C':OC_CLOSE,'M':OC_MANDATORY_CLOSE
  18: required OrderStatus Status;      //状态
  19: required byte DecInPrice;         //小数位
  20: required double OrderPrice;
  21: required string TradeRef;
  22: required i32 TotalQty;
  23: required i32 RemainingQty;
  24: required i32 TradedQty;
  25: required double AvgTradedPrice;
  26: required double Deposit;       // 保证金
}

struct Market {
  1: required string MarketCode;
  2: required string MarketName;
}

struct Instrument {
  1: required double Margin;
  2: required double ContractSize;
  3: required string MarketCode;     //市场代码
  4: required string InstCode;       //产品系列代码
  5: required string InstName;       //英文名称
  6: required string InstName1;      //繁体名称
  7: required string InstName2;      //简体名称
  8: required string Ccy;            //产品系列的交易币种
  9: required byte DecInPrice;       //产品系列的小数位
  10: required byte InstType;        //产品系列的类型
}

struct Product {
  1: required string ProdCode;       //产品代码
  2: required byte ProdType;         //产品类型
  3: required string ProdName;       //产品英文名称
  4: required string Underlying;     //关联的期货合约
  5: required string InstCode;       //产品系列名称
  6: required i32 ExpiryDate;        //产品到期时间
  7: required byte CallPut;          //期权方向认购与认沽
  8: required i32 Strike;            //期权行使价
  9: required i32 LotSize;           //手数
  10: required string ProdName1;     //产品繁体名称
  11: required string ProdName2;     //产品简体名称
  12: required byte OptStyle;        //期权类型
  13: required i32 TickSize;         //产品价格最小变动位数
}

struct PriceInfo {
  1: required list<double> Bid;       //买入价
  2: required list<i32> BidQty;       //买入量
  3: required	list<i32> BidTicket;    //买指令数量
  4: required list<double> Ask;       //卖出价
  5: required	list<i32> AskQty;       //卖出量
  6: required list<i32> AskTicket;    //卖指令数量
  7: required list<double> Last;      //成交价
  8: required	list<i32> LastQty;      //成交数量
  9: required list<i32> LastTime;     //成交时间
  10: required double Equil;          //平衡价
  11: required double Open;           //开盘价
  12: required double High;           //最高价
  13: required double Low;            //最低价
  14: required double Close;          //收盘价
  15: required i32 CloseDate;         //收市日期
  16: required double TurnoverVol;    //总成交量
  17: required double TurnoverAmt;    //总成交额
  18: required i32 OpenInt;           //未平仓
  19: required string ProdCode;       //合约代码
  20: required string ProdName;       //合约名称
  21: required byte DecInPrice;       //合约小数位
  22: required i32 ExStateNo;         //港期市场状态
  23: required i32 TradeStateNo;      //市场状况
  24: required bool Suspend;          //股票-是否已停牌
  25: required i32 ExpiryYMD;         //产品到期日期
  26: required i32 ContractYMD;       //合约到期日期
  27: required i32 Timestamp;         //行情更新时间
}

struct Ticker {
  1: required double Price;           //价格
  2: required i32 Qty;                //成交量
  3: required i32 TickerTime;         //时间
  4: required i32 DealSrc;            //来源
  5: required string ProdCode;        //合约代码
  6: required byte DecInPrice;        //小数位
}

struct AccInfo {
  1: required double NAV;              // 资产净值
  2: required double BuyingPower;      // 购买力
  3: required double CashBal;          // 现金结余
  4: required double MarginCall;       // 追收金额
  5: required double CommodityPL;      // 商品盈亏
  6: required double LockupAmt;        // 冻结金额
  7: required double CreditLimit;      // 信貸限額
  8: required double MaxMargin;        // 最高保証金
  9: required double MaxLoanLimit;     // 最高借貸上限
  10: required double TradingLimit;    // 信用交易額
  11: required double RawMargin;       // 原始保證金
  12: required double IMargin;         // 基本保証金
  13: required double MMargin;         // 維持保証金
  14: required double TodayTrans;      // 交易金額
  15: required double LoanLimit;       // 證券可按總值
  16: required double TotalFee;        // 費用總額
  17: required double LoanToMR;
  18: required double LoanToMV;
  19: required string AccName;         // 戶口名稱
  20: required string BaseCcy;         // 基本貨幣
  21: required string MarginClass;     // 保証金類別
  22: required string TradeClass;      // 交易類別
  23: required string ClientId;        // 客戶
  24: required string  AEId;           // 經紀
  25: required byte AccType;           // 戶口類別
  26: required byte CtrlLevel;         // 控制級數
  27: required byte Active;            // 生效
  28: required byte MarginPeriod;      // 時段
  29: optional double HoldPositionProfit; //持仓总盈亏
  30: optional double TodayProfit;  //今日盈亏
  31: optional i32 PositonProfitFlag; //持仓盈亏是否正常 1 正常 0 不正常
  32: optional i32 TodayProfitFlag; //今日盈亏是否正常 1 正常 0 不正常
}

struct AccBal {
  1: required double CashBf;          //上日结余
  2: required double TodayCash;       //今日存取
  3: required double NotYetValue;     //未交收
  4: required double Unpresented;     //未兑现
  5: required double TodayOut;        //提取要求
  6: required string Ccy;             //货币
}

struct AddOrderReq {
  1: required i32 user_id;
  2: required AccessInfo access_info;
  3: required string AccNo;       // 用户账号
  4: required string ProdCode;   // 合约代码
  5: required string ClOrderId;  // 用户自定义指令代号 最大长度40，包括结尾符
  6: required double Price;       //限价单时必填
  7: required i32 Qty;            // 下单数量
  8: required byte BuySell;      // 买卖方向 'B': Buy, 'S':Sell
  9: required i32 OrderOptions;   // T+1 1:Yes 0:No
  10: required OrderCondType CondType;   //订单条件类型
  11: required OrderPriceType OrderType; //订单价格类型
  12: required VLDType ValidType;  //订单有效类型
  13: required byte DecInPrice;   //合约小数位
  14: required byte OrderAction;  //1：新增  2：修改 3：删除
  15: optional double StopLevel;   // 止损价格
  16: optional double UpLevel;     // 上限水平
  17: optional double UpPrice;     // 上限价格
  18: optional double DownLevel;   // 下限水平
  19: optional double DownPrice;   // 下限价格
  20: optional i64 ExOrderNo;      // 外部指示
  21: optional i32 ValidTime;      //订单有效时间
  22: optional i32 SchedTime;       //预订发送时间
  23: optional byte StopType;     // 止损类型
  24: required byte OpenClose;    // 开平仓
}

struct AddOrderResp {
  1: required ErrInfo err;
}

struct DeleteOrderReq {
  1: required i32 user_id;
  2: required string AccNo;         //用户帐号
  3: required AccessInfo access_info;
  4: required byte DeleteMode;      //1:DeleteOrderBy, 2:DeleteAllOrders
  5: optional i32 IntOrderNo;       //用户订单编号
  6: optional string ProdCode;      //合约代号
  7: optional string ClOrderId;     //用户自定义指令代号
}

struct DeleteOrderResp {
  1: required ErrInfo err;
}

struct GetOrderByNoReq {
  1: required i32 user_id;
  2: required string AccNo;         //用户帐号
  3: required AccessInfo access_info;
  4: required i32 IntOrderNo;       //用户订单编号
}

struct GetOrderByNoResp {
  1: required ErrInfo err;
  2: optional Order orderInfo;
}

struct GetHisOrderReq {
  1: required i32 user_id;
  2: required string AccNo;         //用户帐号
  3: required AccessInfo access_info;
  4: optional i32 start_index = 0;     //页数 从0开始
  5: optional i32 batch_num = 0;       //数量
}

struct GetHisOrderResp {
  1: required ErrInfo err;
  2: optional list<Order> orders;
  3: required bool has_more = false;
}

struct ChangeOrderReq {
  1: required i32 user_id;
  2: required string AccNo;         //用户帐号
  3: required AccessInfo access_info;
  4: required i32 IntOrderNo;       //用户订单编号
  5: required double OrgPrice;
  6: required i32 OrgQty;
  7: required double NewPrice;
  8: required i32 NewQty;
}

struct ChangeOrderResp {
  1: required ErrInfo err;
}

struct SetOrderInactiveReq {
  1: required i32 user_id;
  2: required string AccNo;         //用户帐号
  3: required AccessInfo access_info;
  4: required byte ActivateMod;     //1:Activate All, 2:Inactivate All,
                                    //3:Activate By No, 4:Inactivate By No
  5: optional i32 IntOrderNo;       //用户订单编号
}

struct SetOrderInactiveResp {
  1: required ErrInfo err;
}

struct GetActiveOrderReq {
  1: required i32 user_id;
  2: required string AccNo;         //用户帐号
  3: required AccessInfo access_info;
  4: optional i32 start_index = 0;     //页数 从0开始
  5: optional i32 batch_num = 0;       //数量
}

struct GetActiveOrderResp {
  1: required ErrInfo err;
  2: optional list<Order> ActiveOrders;
  3: required bool has_more = false;
}

struct GetPositionReq {
  1: required i32 user_id;
  2: required string AccNo;         //用户帐号
  3: required AccessInfo access_info;
  4: required byte Type;            // 0:GetAllPos 1:GetPosByProduct
  5: optional string ProdCode;      //合约代码
  6: optional i32 start_index = 0;     //页数 从0开始
  7: optional i32 batch_num = 0;       //数量
}

struct GetPositionResp {
  1: required ErrInfo err;
  2: optional list<Position> PositionList;
  3: required bool has_more = false;
}

struct GetTradeReq {
  1: required i32 user_id;
  2: required string AccNo;         //用户帐号
  3: required AccessInfo access_info;
  4: optional i32 start_index = 0;     //页数 从0开始
  5: optional i32 batch_num = 0;       //数量
}

struct GetTradeResp {
  1: required ErrInfo err;
  2: optional list<TradeInfo> TradeInfoList;
  3: required bool has_more = false;  //更多
}

struct GetPriceReq {
  1: required string ProdCode;      //合约代码
  2: optional AccessInfo access_info;
}

struct GetPriceResp {
  1: required ErrInfo err;
  2: optional PriceInfo price;
  3: optional Product product;
}

struct GetAccInfoReq {
  1: required i32 user_id;
  2: required string AccNo;         //用户帐号
  3: required AccessInfo access_info;
  4: required i32 NeedProfit; //是否需求今日盈亏和持仓盈亏
}

struct GetAccInfoResp {
  1: required ErrInfo err;
  2: optional AccInfo accInfo;
}

struct GetTickerReq {
  1: required string ProdCode;      //合约代码
  2: required i32 StartTime;        //开始时间
  3: optional i32 ReqNum;           //请求数量
  4: optional AccessInfo access_info;
}

struct GetTickerResp {
  1: required ErrInfo err;
  2: optional list<Ticker> tickers;
}

// add by caoyan on 20180423
struct ChangePasswordReq {
  1: required i32 user_id;
  2: required string AccNo;         //用户帐号
  3: required AccessInfo access_info;
  4: required string old_psw;
  5: required string new_psw;
}

struct ChangePasswordResp {
  1: required ErrInfo err;
}

struct GetUserAccountStatusReq {
  1: required i32 user_id;
  2: required AccessInfo access_info;
}

struct GetUserAccountStatusResp {
  1: required ErrInfo err;
  2: required i32 account_status; //0 未开户 1 审核中 2 审核不通过 3 开户成功未入金 4 入金未交易 5 入金已交易
  3: required i32 user_id;
  4: required string account_no;
}

struct FundInOutRecord {
  1:optional i32 description;  // 1 出金 2 入金
  2:optional string money;       // 金额
  3:optional i64 create_time;  // 时间戳
}

// 出入金记录请求
struct GetFundInOutRecordReq {
  1:required string AccNo;
  2:required i32 user_id;
  3:required AccessInfo access_info;
  4:optional i32 index;
  5:optional i32 batch_num;
}

struct GetFundInOutRecordResp {
  1: required ErrInfo err;
  2: optional list<FundInOutRecord> fund_in_out_list;
  3: required bool has_more = false;
}

struct FuturesQuoteFeeInfo {
  1: required double trade_cost; //交易费用
  2: optional double exchange_cost; //交易所费用
  3: optional double securities_cost; //证监会费用
  4: required double IMargin;         // 基本保証金
  5: required double MMargin;         // 維持保証金
  6: required string quote_id;
}

struct GetFuturesQuoteFeeInfoReq {
  1: required string quote_id;
  2: required AccessInfo access_info;
  3: required i32 user_id; //用户ID
  4: required string AccNo;  //用户帐号
}

struct GetFuturesQuoteFeeInfoResp {
  1: required FuturesQuoteFeeInfo quote_fee_info;//费用详情
  2: required ErrInfo err;
}
