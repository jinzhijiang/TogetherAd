//
//  RewardListener.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/8.
//

import Foundation
public protocol RewardListener : BaseListener {

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
     * 广告曝光了（ 和 onAdShow 的区别是展示不一定曝光，曝光一定展示，需要展示一定的时间才会曝光，曝光的条件是提供商规定的 ）
     */
    func onAdExpose(providerType: String)

    /**
     * 视频广告播放完成
     */
    func onAdVideoComplete(providerType: String)

    /**
     * 视频缓存完成
     */
    func onAdVideoCached(providerType: String)

    /**
     * 奖励被验证
     */
    func onAdRewardVerify(providerType: String)

    /**
     * 广告被关闭了
     */
    func onAdClose(providerType: String)

}
