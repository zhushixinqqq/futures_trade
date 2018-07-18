namespace cpp futures_trade.protocols
namespace php futures_trade_common

include "common.thrift"

service SPTradeInfoService {
  // 下单
  common.AddOrderResp AddOrder(1: required common.AddOrderReq req);

  // 删除订单
  common.DeleteOrderResp DeleteOrder(1: required common.DeleteOrderReq req);

  // 获取订单
  common.GetOrderByNoResp GetOrderByNo(1: required common.GetOrderByNoReq req);

  // 修改订单
  common.ChangeOrderResp ChangeOrder(1: required common.ChangeOrderReq req);

  // Inactive Order
  common.SetOrderInactiveResp SetOrderInactive(1: required common.SetOrderInactiveReq req);

  // GetActiveOrder
  common.GetActiveOrderResp GetActiveOrder(1: required common.GetActiveOrderReq req);

  // 获取交易订单
  common.GetTradeResp GetTrade(1: required common.GetTradeReq req);

  // 获取持仓
  common.GetPositionResp GetPosition(1: required common.GetPositionReq req);

  // 获取报价
  common.GetPriceResp GetPrice(1: required common.GetPriceReq req);

  // 获取账户信息
  common.GetAccInfoResp GetAccInfo(1: required common.GetAccInfoReq req);

  // 获取ticker
  common.GetTickerResp GetTicker(1: required common.GetTickerReq req);

  // 获取历史订单
  common.GetHisOrderResp GetHisOrder(1: required common.GetHisOrderReq req);

  //获取用户开户状态
  common.GetUserAccountStatusResp GetUserAccountStatus(1: required common.GetUserAccountStatusReq req);

  // 修改用户密码
  common.ChangePasswordResp ChangePassword(1: required common.ChangePasswordReq req);

  // 出入金记录
  common.GetFundInOutRecordResp GetFundInOutRecord(1: required common.GetFundInOutRecordReq req);

  //佣金费率表
  common.GetFuturesQuoteFeeInfoResp GetFuturesQuoteFeeInfo(1: required common.GetFuturesQuoteFeeInfoReq req);
}


