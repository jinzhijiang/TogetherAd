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
    func onAdShow(providerType: String)

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
    func onAdClose(providerType: String)

}