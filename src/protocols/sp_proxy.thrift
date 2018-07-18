namespace cpp futures_trade.protocols
namespace php futures_trade_common

include "common.thrift"

service SPProxyService {
  // 修改密码
  common.ChangePasswordResp ChangePassword(1: required common.ChangePasswordReq req);
  // 下单
  common.AddOrderResp AddOrder(1: required common.AddOrderReq req);

  // 删除订单
  common.DeleteOrderResp DeleteOrder(1: required common.DeleteOrderReq req);

  // 获取子账号某一笔未成交单
  common.GetOrderByNoResp GetOrderByNo(1: required common.GetOrderByNoReq req);

  // 修改订单
  common.ChangeOrderResp ChangeOrder(1: required common.ChangeOrderReq req);

  //未使用
  common.SetOrderInactiveResp SetOrderInactive(1: required common.SetOrderInactiveReq req);

  //获取子账号所有的未成交单
  common.GetActiveOrderResp GetActiveOrder(1: required common.GetActiveOrderReq req);

  // 获取子账号已成交单
  common.GetTradeResp GetTrade(1: required common.GetTradeReq req);

  // 获取持仓
  common.GetPositionResp GetPosition(1: required common.GetPositionReq req);

  // 未使用 --获取报价
  common.GetPriceResp GetPrice(1: required common.GetPriceReq req);

  // 获取账户信息
  common.GetAccInfoResp GetAccInfo(1: required common.GetAccInfoReq req);

  // 未使用 --获取ticker
  common.GetTickerResp GetTicker(1: required common.GetTickerReq req);
}


