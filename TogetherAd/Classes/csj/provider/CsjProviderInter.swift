//
//  CsjProviderInter.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/13.
//

import Foundation
public class CsjProviderInter: CsjProviderReward, BUNativeExpresInterstitialAdDelegate {
    private var mListener: InterListener? = nil
    private var mAdProviderType: String? = nil
    private var mAlias: String? = nil
    private var mInterstitialAd: BUNativeExpressInterstitialAd? = nil
    
    /// 插屏在请求过程中，需要按照所选比例的实际尺寸请求，比如 1:1 的比例可以请求 600*600，2:3
    override func requestInterAd(adProviderType: String, alias: String, listener: InterListener) {
        mListener = listener
        mAdProviderType = adProviderType
        mAlias = alias
        
        callbackInterStartRequest(adProviderType: adProviderType, alias: alias, listener: listener)
        
        mInterstitialAd = BUNativeExpressInterstitialAd(slotID: TogetherAdCsj.idMapCsj[alias]!, adSize: CGSize(width: CsjProvider.Inter.width, height: CsjProvider.Inter.height))
        mInterstitialAd!.delegate = self
        mInterstitialAd!.loadData()
    }
    
    override func showInterAd(fromRootViewController viewController: UIViewController) -> Bool {
        return mInterstitialAd?.show(fromRootViewController: viewController) ?? false
    }
    
    public func nativeExpresInterstitialAdDidLoad(_ interstitialAd: BUNativeExpressInterstitialAd) {
        // 广告物料加载成功
        "nativeExpresInterstitialAdDidLoad".logi()
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            callbackInterLoaded(adProviderType: adProviderType, alias: alias, listener: listener)
        }
    }
    
    public func nativeExpresInterstitialAd(_ interstitialAd: BUNativeExpressInterstitialAd, didFailWithError error: Error?) {
        // 返回的错误码(error)表示广告加载失败的原因，所有错误码详情请见链接。Linkhttps://ad.oceanengine.com/union/media/doc?id=5de4cc6d78c8690012a90aa5)
        "nativeExpresInterstitialAd".loge()
        let e = error as NSError?
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            callbackInterFailed(adProviderType: adProviderType, alias: alias, listener: listener, errorCode: e?.code, errorMsg: e?.userInfo.description)
        }
    }
    
    public func nativeExpresInterstitialAdRenderSuccess(_ interstitialAd: BUNativeExpressInterstitialAd) {
        // 渲染成功回调
        "nativeExpresInterstitialAdRenderSuccess".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackInterRendered(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpresInterstitialAdRenderFail(_ interstitialAd: BUNativeExpressInterstitialAd, error: Error?) {
        // 渲染失败，网络原因或者硬件原因导致渲染失败,可以更换手机或者网络环境测试。建议升级到穿山甲平台最新版本
        "nativeExpresInterstitialAdRenderFail".loge()
        let e = error as NSError?
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            callbackInterFailed(adProviderType: adProviderType, alias: alias, listener: listener, errorCode: e?.code, errorMsg: e?.userInfo.description)
        }
    }
    
    public func nativeExpresInterstitialAdWillVisible(_ interstitialAd: BUNativeExpressInterstitialAd) {
        // 模版插屏广告即将展示
        "nativeExpresInterstitialAdWillVisible".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackInterShowed(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpresInterstitialAdDidClick(_ interstitialAd: BUNativeExpressInterstitialAd) {
        // 点击回调
        "nativeExpresInterstitialAdDidClick".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackInterClicked(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpresInterstitialAdWillClose(_ interstitialAd: BUNativeExpressInterstitialAd) {
        // 广告即将关闭回调
        "nativeExpresInterstitialAdWillClose".logi()
    }
    
    public func nativeExpresInterstitialAdDidClose(_ interstitialAd: BUNativeExpressInterstitialAd) {
        // 关闭回调
        "nativeExpresInterstitialAdDidClose".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackInterClosed(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpresInterstitialAdDidCloseOtherController(_ interstitialAd: BUNativeExpressInterstitialAd, interactionType: BUInteractionType) {
        // 此回调在广告跳转到其他控制器时，该控制器被关闭时调用interactionType：此参数可区分是打开的appstore/网页/详情页面等等
        "nativeExpresInterstitialAdDidCloseOtherController".logi()
    }
}
