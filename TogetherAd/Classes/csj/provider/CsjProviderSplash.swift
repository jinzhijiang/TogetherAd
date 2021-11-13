//
//  CsjProviderSplash.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/10.
//

import Foundation

public class CsjProviderSplash : BaseAdProvider, BUSplashAdDelegate {
    
    private var mListener: SplashListener? = nil
    private var mAdProviderType: String? = nil
    private var mAlias: String? = nil
    private var mSplashAd: BUSplashAdView? = nil
    
    public override func createSplashAd(adProviderType: String, alias: String, rootViewController: UIViewController, frame: CGRect, listener: SplashListener) -> UIView? {
        mListener = listener
        mAdProviderType = adProviderType
        mAlias = alias
        
        callbackSplashStartRequest(adProviderType: adProviderType, alias: alias, listener: listener)
        
        mSplashAd = BUSplashAdView(slotID: TogetherAdCsj.idMapCsj[alias]!, frame: frame)
        mSplashAd!.tolerateTimeout = CsjProvider.Splash.maxFetchDelay
        mSplashAd!.delegate = self
        mSplashAd!.rootViewController = rootViewController
        mSplashAd!.loadAdData()
        return mSplashAd
    }

    public func splashAd(_ splashAd: BUSplashAdView, didFailWithError error: Error?) {
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            let e = error as NSError?
            callbackSplashFailed(adProviderType: adProviderType, alias: alias, listener: listener, errorCode: e?.code, errorMsg: e?.userInfo.description)
        }
    }
    
    public func splashAdDidLoad(_ splashAd: BUSplashAdView) {
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            callbackSplashLoaded(adProviderType: adProviderType, alias: alias, listener: listener)
        }
    }
    
    public func splashAdWillVisible(_ splashAd: BUSplashAdView) {
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackSplashExposure(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func splashAdDidClick(_ splashAd: BUSplashAdView) {
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackSplashClicked(adProviderType: adProviderType, listener: listener)
        }
        
    }
    
    public func splashAdWillClose(_ splashAd: BUSplashAdView) {
       "splashAdWillClose".logi()
        
    }
    
    public func splashAdDidClose(_ splashAd: BUSplashAdView) {
        "splashAdDidClose".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackSplashDismiss(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func splashAdCountdown(toZero splashAd: BUSplashAdView) {
        "splashAdCountdown".logi()
    }

    public func splashAdDidClickSkip(_ splashAd: BUSplashAdView) {
        "splashAdDidClickSkip".logi()
    }
    
    public func splashAdDidCloseOtherController(_ splashAd: BUSplashAdView, interactionType: BUInteractionType) {
        "splashAdDidCloseOtherController".logi()
    }
}
