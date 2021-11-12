//
//  CsjProviderBanner.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/12.
//

import Foundation

public class CsjProviderBanner: CsjProviderSplash, BUNativeExpressBannerViewDelegate {
    private var mListener: BannerListener? = nil
    private var mAdProviderType: String? = nil
    private var mAlias: String? = nil
    private var mBannerAd: BUNativeExpressBannerView? = nil
    
    public override func createBannerAd(adProviderType: String, alias: String, rootViewController: UIViewController, frame: CGRect, listener: BannerListener) -> UIView? {
        mListener = listener
        mAdProviderType = adProviderType
        mAlias = alias
        
        callbackBannerStartRequest(adProviderType: adProviderType, alias: alias, listener: listener)
        
        mBannerAd = BUNativeExpressBannerView(slotID: TogetherAdCsj.idMapCsj[alias]!, rootViewController: rootViewController, adSize: frame.size, interval: CsjProvider.Banner.slideIntervalTime)
        mBannerAd!.frame = frame
        mBannerAd!.delegate = self
        mBannerAd!.loadAdData()
        return mBannerAd
    }
    
    public func nativeExpressBannerAdView(_ bannerAdView: BUNativeExpressBannerView, didLoadFailWithError error: Error?) {
        "nativeExpressBannerAdView 加载失败".logi()
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            let e = error as NSError?
            callbackBannerFailed(adProviderType: adProviderType, alias: alias, listener: listener, errorCode: e?.code, errorMsg: e?.userInfo.description)
        }
    }
    
    public func nativeExpressBannerAdViewRenderFail(_ bannerAdView: BUNativeExpressBannerView, error: Error?) {
        "nativeExpressBannerAdViewRenderFail 渲染失败".logi()
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            let e = error as NSError?
            callbackBannerFailed(adProviderType: adProviderType, alias: alias, listener: listener, errorCode: e?.code, errorMsg: e?.userInfo.description)
        }
    }
    
    public func nativeExpressBannerAdViewDidLoad(_ bannerAdView: BUNativeExpressBannerView) {
        "nativeExpressBannerAdViewDidLoad".logi()
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            callbackBannerLoaded(adProviderType: adProviderType, alias: alias, listener: listener)
        }
    }
    
    public func nativeExpressBannerAdViewRenderSuccess(_ bannerAdView: BUNativeExpressBannerView) {
        // 在此回调方法中进行广告的展示，可保证播放流畅和展示流畅，用户体验更好。
        "nativeExpressBannerAdViewRenderSuccess".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackBannerRendered(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpressBannerAdViewDidCloseOtherController(_ bannerAdView: BUNativeExpressBannerView, interactionType: BUInteractionType) {
        // 此回调在广告跳转到其他控制器时，该控制器被关闭时调用
        "nativeExpressBannerAdViewDidCloseOtherController".logi()
        
    }
    
    public func nativeExpressBannerAdViewDidClick(_ bannerAdView: BUNativeExpressBannerView) {
        "nativeExpressBannerAdViewDidClick".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackBannerClicked(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpressBannerAdViewDidRemoved(_ bannerAdView: BUNativeExpressBannerView) {
        // 【重要】若开发者收到此回调，代表穿山甲会主动关闭掉广告，广告移除后需要开发者对界面进行适配
        "nativeExpressBannerAdViewDidRemoved".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackBannerClosed(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpressBannerAdViewWillBecomVisible(_ bannerAdView: BUNativeExpressBannerView) {
        "nativeExpressBannerAdViewWillBecomVisible 当显示新的广告时调用此方法".logi()
        
    }
    
    public func nativeExpressBannerAdView(_ bannerAdView: BUNativeExpressBannerView, dislikeWithReason filterwords: [BUDislikeWords]?) {
        //【重要】需要在点击叉以后 在这个回调中移除视图，否则，会出现用户点击叉无效的情况
        "nativeExpressBannerAdView 选择不喜欢".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackBannerClosed(adProviderType: adProviderType, listener: listener)
        }
    }
}
