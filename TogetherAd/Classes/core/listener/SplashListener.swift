//
//  SplashListener.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/8.
//

import Foundation
public protocol SplashListener : BaseListener {

    /**
     * 请求到了广告
     */
    func onAdLoaded(providerType: String)

    /**
     * 广告被点击了
     */
    func onAdClicked(providerType: String)

    /**
     * 广告曝光了
     */
    func onAdExposure(providerType: String)

    /**
     * 广告消失了（ 点击跳过或者倒计时结束 ）
     */
    func onAdDismissed(providerType: String)

}

extension SplashListener {
    public func onAdLoaded(providerType: String) {}
    public func onAdClicked(providerType: String) {}
    public func onAdExposure(providerType: String) {}
    public func onAdDismissed(providerType: String) {}
}
