//
//  BannerListener.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/8.
//

import Foundation
public protocol BannerListener : BaseListener {

    /**
     * 请求到了广告
     */
    func onAdLoaded(providerType: String)

    /**
     * 广告被点击了
     */
    func onAdClicked(providerType: String)

    /**
     * 广告已渲染
     */
    func onAdRendered(providerType: String)

    /**
     * 广告被关闭了
     */
    func onAdClose(providerType: String)

}
