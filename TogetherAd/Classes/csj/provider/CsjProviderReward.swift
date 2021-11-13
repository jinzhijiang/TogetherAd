//
//  CsjProviderReward.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/13.
//

import Foundation
public class CsjProviderReward: CsjProviderFullVideo, BUNativeExpressRewardedVideoAdDelegate {
    private var mListener: RewardListener? = nil
    private var mAdProviderType: String? = nil
    private var mAlias: String? = nil
    private var mRewardAd: BUNativeExpressRewardedVideoAd? = nil
    
    override func requestRewardAd(adProviderType: String, alias: String, listener: RewardListener) {
        mListener = listener
        mAdProviderType = adProviderType
        mAlias = alias
        
        callbackRewardStartRequest(adProviderType: adProviderType, alias: alias, listener: listener)
        
        let model = BURewardedVideoModel()
        model.userId = CsjProvider.Reward.userID ?? ""
        model.rewardName = CsjProvider.Reward.rewardName ?? ""
        model.rewardAmount = CsjProvider.Reward.rewardAmount ?? -1
        model.extra = CsjProvider.Reward.mediaExtra
        mRewardAd = BUNativeExpressRewardedVideoAd(slotID: TogetherAdCsj.idMapCsj[alias]!, rewardedVideoModel: model)
        mRewardAd!.delegate = self
        mRewardAd!.loadData()
    }
    
    override func showRewardAd(fromRootViewController viewController: UIViewController) -> Bool {
        return mRewardAd?.show(fromRootViewController: viewController) ?? false
    }
    
    public func nativeExpressRewardedVideoAd(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd, didFailWithError error: Error?) {
        // 返回的错误码(error)表示广告加载失败的原因，所有错误码详情请见链接。https://www.csjplatform.com/support/doc/5de4cc6d78c8690012a90aa5?from=ad.oceanengine.com&id=5de4cc6d78c8690012a90aa5
        "nativeExpressRewardedVideoAd".loge()
        let e = error as NSError?
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            callbackRewardFailed(adProviderType: adProviderType, alias: alias, listener: listener, errorCode: e?.code, errorMsg: e?.userInfo.description)
        }
    }
    
    public func nativeExpressRewardedVideoAdViewRenderFail(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd, error: Error?) {
        // 渲染失败，网络原因或者硬件原因导致渲染失败,可以更换手机或者网络环境测试。建议升级到穿山甲平台最新版本
        "nativeExpressRewardedVideoAdViewRenderFail".loge()
        let e = error as NSError?
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            callbackRewardFailed(adProviderType: adProviderType, alias: alias, listener: listener, errorCode: e?.code, errorMsg: e?.userInfo.description)
        }
    }
    
    public func nativeExpressRewardedVideoAdDidLoad(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd) {
        // 广告素材物料加载成功
        "nativeExpressRewardedVideoAdDidLoad".logi()
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            callbackRewardLoaded(adProviderType: adProviderType, alias: alias, listener: listener)
        }
    }
    
    public func nativeExpressRewardedVideoAdDidDownLoadVideo(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd) {
        // 视频下载完成,建议在此回调方法中进行广告的展示操作，可保证播放流畅和展示流畅，用户体验更好。
        "nativeExpressRewardedVideoAdDidDownLoadVideo".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackRewardVideoCached(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpressRewardedVideoAdCallback(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd, with nativeExpressVideoType: BUNativeExpressRewardedVideoAdType) {
        // 此回调可知模版激励视频的广告类型
        "nativeExpressRewardedVideoAdCallback".logi()
    }
    
    public func nativeExpressRewardedVideoAdViewRenderSuccess(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd) {
        // 渲染成功回调。3100之后版本SDK，广告展示之后才会回调
        "nativeExpressRewardedVideoAdViewRenderSuccess".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackRewardShow(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpressRewardedVideoAdWillVisible(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd) {
        // 模版激励视频广告即将展示
        "nativeExpressRewardedVideoAdWillVisible".logi()
    }
    
    public func nativeExpressRewardedVideoAdDidVisible(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd) {
        // 模版激励视频广告已经展示
        "nativeExpressRewardedVideoAdDidVisible".logi()
    }
    
    public func nativeExpressRewardedVideoAdWillClose(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd) {
        // 模版激励视频广告即将关闭
        "nativeExpressRewardedVideoAdWillClose".logi()
    }
    
    public func nativeExpressRewardedVideoAdDidClose(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd) {
        // 用户关闭广告时会触发此回调，注意：任何广告的关闭操作必须用户主动触发;
        "nativeExpressRewardedVideoAdDidClose".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackRewardClosed(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpressRewardedVideoAdDidClick(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd) {
        // 点击回调方法
        "nativeExpressRewardedVideoAdDidClick".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackRewardClicked(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpressRewardedVideoAdDidClickSkip(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd) {
        // 跳过回调方法
        "nativeExpressRewardedVideoAdDidClickSkip".logi()
    }
    
    public func nativeExpressRewardedVideoAdDidPlayFinish(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd, didFailWithError error: Error?) {
        // 视频正常播放完成时可触发此回调方法，当广告播放发生异常时，不会进入此回调;
        "nativeExpressRewardedVideoAdDidPlayFinish".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackRewardVideoComplete(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpressRewardedVideoAdServerRewardDidSucceed(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd, verify: Bool) {
        //  异步请求的服务器验证成功回调，开发者需要在此回调中进行奖励发放。现在包括两个验证方法:1. C2C需要服务器验证2。S2S不需要服务器验证。nativeExpressRewardedVideoAdServerRewardDidFail:异步请求的服务器验证失败回调。可在此回调方法中打印error，定位具体失败的原因，或通过抓包定位具体原因，抓包地址：https://域名或者ip地址/api/ad/union/sdk/get_ads/ 提供返回的数据进行确认）到【留言反馈】-【技术类提问入口（技术类暂仅支持此入口的提问回复）】进行反馈，相关同学会为您处理
        // 不使用户服务端奖励验证的情况下nativeExpressRewardedVideoAdServerRewardDidSucceed回调只校验视频播放状态或者进度，视频播放90%或者因播放器异常导致出现播放失败，那么穿山甲都会回调nativeExpressRewardedVideoAdServerRewardDidSucceed，并且返回结果为true。
        // 使用服务端奖励验证的情况下nativeExpressRewardedVideoAdServerRewardDidSucceed回调返回的则是开发者服务端验证的结果。
        // 综上： nativeExpressRewardedVideoAdServerRewardDidSucceed 回调只是视频播放状态的一个结果或者是开发者返回的结果，不代表此次播放是否计费等广告业务指标。
        "nativeExpressRewardedVideoAdServerRewardDidSucceed".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            CsjProvider.Reward.rewardVerify = verify
            let model = rewardedVideoAd.rewardedVideoModel
            CsjProvider.Reward.rewardAmount = model.rewardAmount
            CsjProvider.Reward.rewardName = model.rewardName
            callbackRewardVerify(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpressRewardedVideoAdDidCloseOtherController(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd, interactionType: BUInteractionType) {
        // 此回调在广告跳转到其他控制器时，该控制器被关闭时调用interactionType：    此参数可区分是打开的appstore/网页/视频广告详情页面
        "nativeExpressRewardedVideoAdDidCloseOtherController".logi()
    }
}
