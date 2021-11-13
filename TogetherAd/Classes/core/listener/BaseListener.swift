//
//  BaseListener.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/8.
//

import Foundation

public protocol BaseListener {

    /**
     * 开始请求前回调
     */
    func onAdStartRequest(providerType: String)

    /**
     * 所有的提供商都请求失败，或请求超时，或没有分配任何广告商比例
     */
    func onAdFailedAll(failedMsg: String?)

    /**
     * 单个提供商请求失败
     */
    func onAdFailed(providerType: String, failedMsg: String?)

}

extension BaseListener {
    public func onAdStartRequest(providerType: String) {}

    public func onAdFailedAll(failedMsg: String?) {}

    public func onAdFailed(providerType: String, failedMsg: String?) {}
}
