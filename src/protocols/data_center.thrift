namespace cpp futures_trade.protocols
namespace php futures_trade_common

include "common.thrift"

service DataCenterService {
  // 获取订单
  common.GetOrderByNoResp GetOrderByNo(1: required common.GetOrderByNoReq req);

  // 获取历史订单
  common.GetHisOrderResp GetHisOrder(1: required common.GetHisOrderReq req);

  // 获取交易订单
  common.GetTradeResp GetTrade(1: required common.GetTradeReq req);

  // 获取持仓
  common.GetPositionResp GetPosition(1: required common.GetPositionReq req);

  // 获取账户信息
  common.GetAccInfoResp GetAccInfo(1: required common.GetAccInfoReq req);
}


