//
//  BaseAdProvider.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/8.
//

import Foundation

public class BaseAdProvider {

    internal var tag: String = ""
    
    public required init() {
        tag = String(describing: self)
    }

    /**
     * --------------------------- 开屏 ---------------------------
     */
    internal func callbackSplashStartRequest(adProviderType: String, alias: String, listener: SplashListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 开始请".logi()
            listener.onAdStartRequest(providerType: adProviderType)
            TogetherAd.shared.allAdListener?.onAdStartRequest(providerType: adProviderType, alias: alias)
        }
    }

    internal func callbackSplashLoaded(adProviderType: String, alias: String, listener: SplashListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 请求成功了".logi()
            listener.onAdLoaded(providerType: adProviderType)
            TogetherAd.shared.allAdListener?.onAdLoaded(providerType: adProviderType, alias: alias)
        }
    }

    internal func callbackSplashClicked(adProviderType: String, listener: SplashListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 点击了".logi()
            listener.onAdClicked(providerType: adProviderType)
        }
    }

    internal func callbackSplashExposure(adProviderType: String, listener: SplashListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 曝光了".logi()
            listener.onAdExposure(providerType: adProviderType)
        }
    }

    internal func callbackSplashFailed(adProviderType: String, alias: String, listener: SplashListener, errorCode: Int?, errorMsg: String?) {
        DispatchQueue.main.async {
            "\(adProviderType): 请求失败了：\(errorCode), \(errorMsg)".logi()
                 listener.onAdFailed(providerType: adProviderType, failedMsg: errorMsg)
            TogetherAd.shared.allAdListener?.onAdFailed(providerType: adProviderType, alias: alias, failedMsg: errorMsg)
        }
    }

    internal func callbackSplashDismiss(adProviderType: String, listener: SplashListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 消失了".logi()
            listener.onAdDismissed(providerType: adProviderType)
        }
    }

    /**
     * --------------------------- 原生信息流 ---------------------------
     */
    internal func callbackNativeStartRequest(adProviderType: String, alias: String, listener: NativeListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 开始请求".logi()
            listener.onAdStartRequest(providerType: adProviderType)
            TogetherAd.shared.allAdListener?.onAdStartRequest(providerType: adProviderType, alias: alias)
        }
    }

    internal func callbackNativeLoaded(adProviderType: String, alias: String, listener: NativeListener, adList: [Any]) {
        DispatchQueue.main.async {
            "\(adProviderType): 请求成功了, 请求到\(adList.count)个广告".logi()
            listener.onAdLoaded(providerType: adProviderType, adList: adList)
            TogetherAd.shared.allAdListener?.onAdLoaded(providerType: adProviderType, alias: alias)
        }
    }

    internal func callbackNativeFailed(adProviderType: String, alias: String, listener: NativeListener, errorCode: Int?, errorMsg: String?) {
        DispatchQueue.main.async {
            "\(adProviderType): 请求失败了：\(errorCode) \(errorMsg)".logi()
                 listener.onAdFailed(providerType: adProviderType, failedMsg: errorMsg)
            TogetherAd.shared.allAdListener?.onAdFailed(providerType: adProviderType, alias: alias, failedMsg: errorMsg)
        }
    }

    /**
     * --------------------------- 原生信息流模板 ---------------------------
     */
    internal func callbackNativeExpressStartRequest(adProviderType: String, alias: String, listener: NativeExpressListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 开始请求".logi()
            listener.onAdStartRequest(providerType: adProviderType)
            TogetherAd.shared.allAdListener?.onAdStartRequest(providerType: adProviderType, alias: alias)
        }
    }

    internal func callbackNativeExpressLoaded(adProviderType: String, alias: String, listener: NativeExpressListener, adList: [Any]) {
        DispatchQueue.main.async {
            "\(adProviderType): 请求成功了, 请求到\(adList.count)个广告".logi()
            listener.onAdLoaded(providerType: adProviderType, adList: adList)
            TogetherAd.shared.allAdListener?.onAdLoaded(providerType: adProviderType, alias: alias)
        }
    }

    internal func callbackNativeExpressFailed(adProviderType: String, alias: String, listener: NativeExpressListener, errorCode: Int?, errorMsg: String?) {
        DispatchQueue.main.async {
            "\(adProviderType): 请求失败了：\(errorCode) \(errorMsg)".logi()
            listener.onAdFailed(providerType: adProviderType, failedMsg: errorMsg)
            TogetherAd.shared.allAdListener?.onAdFailed(providerType: adProviderType, alias: alias, failedMsg: errorMsg)
        }
    }

    internal func callbackNativeExpressClicked(adProviderType: String, adObject: Any?, listener: NativeExpressListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 点击了".logi()
            listener.onAdClicked(providerType: adProviderType, adObject: adObject)
        }
    }

    internal func callbackNativeExpressShow(adProviderType: String, adObject: Any?, listener: NativeExpressListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 展示了".logi()
            listener.onAdShow(providerType: adProviderType, adObject: adObject)
        }
    }

    internal func callbackNativeExpressRenderSuccess(adProviderType: String, adObject: Any?, listener: NativeExpressListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 渲染成功".logi()
            listener.onAdRenderSuccess(providerType: adProviderType, adObject: adObject)
        }
    }

    internal func callbackNativeExpressRenderFail(adProviderType: String, adObject: Any?, listener: NativeExpressListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 渲染失败了".logi()
            listener.onAdRenderFail(providerType: adProviderType, adObject: adObject)
        }
    }

    internal func callbackNativeExpressClosed(adProviderType: String, adObject: Any?, listener: NativeExpressListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 关闭了".logi()
            listener.onAdClosed(providerType: adProviderType, adObject: adObject)
        }
    }

    /**
     * --------------------------- 激励广告 ---------------------------
     */
    internal func callbackRewardStartRequest(adProviderType: String, alias: String, listener: RewardListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 开始请求".logi()
            listener.onAdStartRequest(providerType: adProviderType)
            TogetherAd.shared.allAdListener?.onAdStartRequest(providerType: adProviderType, alias: alias)
        }
    }

    internal func callbackRewardLoaded(adProviderType: String, alias: String, listener: RewardListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 请求成功了".logi()
            listener.onAdLoaded(providerType: adProviderType)
            TogetherAd.shared.allAdListener?.onAdLoaded(providerType: adProviderType, alias: alias)
        }
    }

    internal func callbackRewardFailed(adProviderType: String, alias: String, listener: RewardListener, errorCode: Int?, errorMsg: String?) {
        DispatchQueue.main.async {
            "\(adProviderType): 请求失败了：\(errorCode) \(errorMsg)".logi()
            listener.onAdFailed(providerType: adProviderType, failedMsg: errorMsg)
            TogetherAd.shared.allAdListener?.onAdFailed(providerType: adProviderType, alias: alias, failedMsg: errorMsg)
        }
    }

    internal func callbackRewardClicked(adProviderType: String, listener: RewardListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 点击了".logi()
            listener.onAdClicked(providerType: adProviderType)
        }
    }

    internal func callbackRewardShow(adProviderType: String, listener: RewardListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 展示了".logi()
            listener.onAdShow(providerType: adProviderType)
        }
    }

    internal func callbackRewardExpose(adProviderType: String, listener: RewardListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 曝光了".logi()
            listener.onAdExpose(providerType: adProviderType)
        }
    }

    internal func callbackRewardVideoComplete(adProviderType: String, listener: RewardListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 播放完成".logi()
            listener.onAdVideoComplete(providerType: adProviderType)
        }
    }

    internal func callbackRewardVideoCached(adProviderType: String, listener: RewardListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 视频已缓存".logi()
            listener.onAdVideoCached(providerType: adProviderType)
        }
    }

    internal func callbackRewardVerify(adProviderType: String, listener: RewardListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 激励验证".logi()
            listener.onAdRewardVerify(providerType: adProviderType)
        }
    }

    internal func callbackRewardClosed(adProviderType: String, listener: RewardListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 关闭了".logi()
            listener.onAdClose(providerType: adProviderType)
        }
    }

    /**
     * --------------------------- 全屏视频广告 ---------------------------
     */
    internal func callbackFullVideoStartRequest(adProviderType: String, alias: String, listener: FullVideoListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 开始请求".logi()
            listener.onAdStartRequest(providerType: adProviderType)
            TogetherAd.shared.allAdListener?.onAdStartRequest(providerType: adProviderType, alias: alias)
        }
    }

    internal func callbackFullVideoLoaded(adProviderType: String, alias: String, listener: FullVideoListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 请求成功了".logi()
            listener.onAdLoaded(providerType: adProviderType)
            TogetherAd.shared.allAdListener?.onAdLoaded(providerType: adProviderType, alias: alias)
        }
    }

    internal func callbackFullVideoFailed(adProviderType: String, alias: String, listener: FullVideoListener, errorCode: Int?, errorMsg: String?) {
        DispatchQueue.main.async {
            "\(adProviderType): 请求失败了：\(errorCode) \(errorMsg)".logi()
            listener.onAdFailed(providerType: adProviderType, failedMsg: errorMsg)
            TogetherAd.shared.allAdListener?.onAdFailed(providerType: adProviderType, alias: alias, failedMsg: errorMsg)
        }
    }

    internal func callbackFullVideoClicked(adProviderType: String, listener: FullVideoListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 点击了".logi()
            listener.onAdClicked(providerType: adProviderType)
        }
    }

    internal func callbackFullVideoShow(adProviderType: String, listener: FullVideoListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 展示了".logi()
            listener.onAdShow(providerType: adProviderType)
        }
    }

    internal func callbackFullVideoCached(adProviderType: String, listener: FullVideoListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 视频已缓存".logi()
            listener.onAdVideoCached(providerType: adProviderType)
        }
    }

    internal func callbackFullVideoClosed(adProviderType: String, listener: FullVideoListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 关闭了".logi()
            listener.onAdClose(providerType: adProviderType)
        }
    }

    internal func callbackFullVideoComplete(adProviderType: String, listener: FullVideoListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 视频播放完成了".logi()
            listener.onAdVideoComplete(providerType: adProviderType)
        }
    }

    /**
     * --------------------------- Banner 横幅广告 ---------------------------
     */
    internal func callbackBannerStartRequest(adProviderType: String, alias: String, listener: BannerListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 开始请求".logi()
            listener.onAdStartRequest(providerType: adProviderType)
            TogetherAd.shared.allAdListener?.onAdStartRequest(providerType: adProviderType, alias: alias)
        }
    }

    internal func callbackBannerLoaded(adProviderType: String, alias: String, listener: BannerListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 请求成功了".logi()
            listener.onAdLoaded(providerType: adProviderType)
            TogetherAd.shared.allAdListener?.onAdLoaded(providerType: adProviderType, alias: alias)
        }
    }

    internal func callbackBannerFailed(adProviderType: String, alias: String, listener: BannerListener, errorCode: Int?, errorMsg: String?) {
        DispatchQueue.main.async {
            "\(adProviderType): 请求失败了：\(errorCode) \(errorMsg)".logi()
            listener.onAdFailed(providerType: adProviderType, failedMsg: errorMsg)
            TogetherAd.shared.allAdListener?.onAdFailed(providerType: adProviderType, alias: alias, failedMsg: errorMsg)
        }
    }

    internal func callbackBannerClosed(adProviderType: String, listener: BannerListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 关闭了".logi()
            listener.onAdClose(providerType: adProviderType)
        }
    }

    internal func callbackBannerExpose(adProviderType: String, listener: BannerListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 曝光了".logi()
            listener.onAdExpose(providerType: adProviderType)
        }
    }

    internal func callbackBannerClicked(adProviderType: String, listener: BannerListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 点击了".logi()
            listener.onAdClicked(providerType: adProviderType)
        }
    }

    /**
     * --------------------------- Interaction 插屏广告 ---------------------------
     */
    internal func callbackInterStartRequest(adProviderType: String, alias: String, listener: InterListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 开始请求".logi()
            listener.onAdStartRequest(providerType: adProviderType)
            TogetherAd.shared.allAdListener?.onAdStartRequest(providerType: adProviderType, alias: alias)
        }
    }

    internal func callbackInterLoaded(adProviderType: String, alias: String, listener: InterListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 请求成功了".logi()
            listener.onAdLoaded(providerType: adProviderType)
            TogetherAd.shared.allAdListener?.onAdLoaded(providerType: adProviderType, alias: alias)
        }
    }

    internal func callbackInterFailed(adProviderType: String, alias: String, listener: InterListener, errorCode: Int?, errorMsg: String?) {
        DispatchQueue.main.async {
            "\(adProviderType): 请求失败了：\(errorCode) \(errorMsg)".logi()
            listener.onAdFailed(providerType: adProviderType, failedMsg: errorMsg)
            TogetherAd.shared.allAdListener?.onAdFailed(providerType: adProviderType, alias: alias, failedMsg: errorMsg)
        }
    }

    internal func callbackInterClosed(adProviderType: String, listener: InterListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 关闭了".logi()
            listener.onAdClose(providerType: adProviderType)
        }
    }

    internal func callbackInterExpose(adProviderType: String, listener: InterListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 曝光了".logi()
            listener.onAdExpose(providerType: adProviderType)
        }
    }

    internal func callbackInterClicked(adProviderType: String, listener: InterListener) {
        DispatchQueue.main.async {
            "\(adProviderType): 点击了".logi()
            listener.onAdClicked(providerType: adProviderType)
        }
    }

}
