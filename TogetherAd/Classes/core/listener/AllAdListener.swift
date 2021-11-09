//
//  AllAdListener.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/8.
//

import Foundation

public protocol AllAdListener {

    /**
     * 开始请求前回调
     */
    func onAdStartRequest(providerType: String, alias: String)

    /**
     * 单个提供商请求失败
     */
    func onAdFailed(providerType: String, alias: String, failedMsg: String?)
    /**
     * 请求到了广告
     */
    func onAdLoaded(providerType: String, alias: String)

}
