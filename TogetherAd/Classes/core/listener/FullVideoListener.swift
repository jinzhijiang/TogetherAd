//
//  FullVideoListener.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/8.
//

import Foundation
public protocol FullVideoListener : BaseListener {

    /**
     * 请求到了广告
     */
    func onAdLoaded(providerType: String)

    /**
     * 广告被点击了
     */
    func onAdClicked(providerType: String)

    /**
     * 广告展示了
     */
    func onAdShowed(providerType: String)

    /**
     * 视频缓存完成
     */
    func onAdVideoCached(providerType: String)

    /**
     * 视频播放完成
     */
    func onAdVideoComplete(providerType: String)

    /**
     * 广告被关闭了
     */
    func onAdClosed(providerType: String)

}

extension FullVideoListener {
    public func onAdLoaded(providerType: String) {}

    public func onAdClicked(providerType: String) {}

    public func onAdShowed(providerType: String) {}

    public func onAdVideoCached(providerType: String) {}

    public func onAdVideoComplete(providerType: String) {}

    public func onAdClosed(providerType: String) {}
}
