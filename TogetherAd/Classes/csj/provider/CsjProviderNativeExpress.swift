//
//  CsjProviderNative.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/15.
//

import Foundation
public class CsjProviderNativeExpress: CsjProviderInter, BUNativeExpressAdViewDelegate {
    private var mListener: NativeExpressListener? = nil
    private var mAdProviderType: String? = nil
    private var mAlias: String? = nil
    private var mManager: BUNativeExpressAdManager? = nil
    
    public override func requestNativeExpressAd(adProviderType: String, alias: String, size: CGSize, count: Int, listener: NativeExpressListener) {
        mListener = listener
        mAdProviderType = adProviderType
        mAlias = alias
        
        callbackNativeExpressStartRequest(adProviderType: adProviderType, alias: alias, listener: listener)
        
        let slot = BUAdSlot()
        slot.id = TogetherAdCsj.idMapCsj[alias]!
        slot.adType = .feed
        slot.supportRenderControl = true
        slot.imgSize = BUSize(by: .feed228_150)
        slot.position = .feed
        
        mManager = BUNativeExpressAdManager(slot: slot, adSize: size)
        
        mManager!.delegate = self
        mManager!.loadAdData(withCount: count)
    }
    
    public func nativeExpressAdFail(toLoad nativeExpressAdManager: BUNativeExpressAdManager, error: Error?) {
        // 返回的错误码(error)表示广告加载失败的原因，所有错误码详情请见链接。Link
        "nativeExpressAdFail".loge()
        let e = error as NSError?
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            callbackNativeExpressFailed(adProviderType: adProviderType, alias: alias, listener: listener, errorCode: e?.code, errorMsg: e?.userInfo.description)
        }
    }
    
    public func nativeExpressAdViewRenderFail(_ nativeExpressAdView: BUNativeExpressAdView, error: Error?) {
        // 渲染失败，网络原因或者硬件原因导致渲染失败,可以更换手机或者网络环境测试。建议升级到穿山甲平台最新版本
        "nativeExpressAdViewRenderFail".loge()
        let e = error as NSError?
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackNativeExpressRenderFail(adProviderType: adProviderType, adObject: nativeExpressAdView, errorCode: e?.code, errorMsg: e?.userInfo.description ,listener: listener)
        }
    }
    
    public func nativeExpressAdSuccess(toLoad nativeExpressAdManager: BUNativeExpressAdManager, views: [BUNativeExpressAdView]) {
        // 广告视图加载成功
        "nativeExpressAdSuccess".logi()
        if views.isEmpty {
            if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
                callbackNativeExpressFailed(adProviderType: adProviderType, alias: alias, listener: listener, errorCode: -1, errorMsg: "请求成功，但是返回的view集合为空")
            }
            return
        }
        
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            callbackNativeExpressLoaded(adProviderType: adProviderType, alias: alias, listener: listener, adList: views)
        }
    }
    
    public func nativeExpressAdViewRenderSuccess(_ nativeExpressAdView: BUNativeExpressAdView) {
        // 渲染成功
        "nativeExpressAdViewRenderSuccess".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackNativeExpressRenderSuccess(adProviderType: adProviderType, adObject: nativeExpressAdView, listener: listener)
        }
    }
    
    public func nativeExpressAdViewDidClick(_ nativeExpressAdView: BUNativeExpressAdView) {
        // 被点击
        "nativeExpressAdViewDidClick".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackNativeExpressClicked(adProviderType: adProviderType, adObject: nativeExpressAdView, listener: listener)
        }
    }
    
    public func nativeExpressAdViewWillShow(_ nativeExpressAdView: BUNativeExpressAdView) {
        "nativeExpressAdViewWillShow".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackNativeExpressShow(adProviderType: adProviderType, adObject: nativeExpressAdView, listener: listener)
        }
    }
    
    public func nativeExpressAdViewDidRemoved(_ nativeExpressAdView: BUNativeExpressAdView) {
        "nativeExpressAdViewDidRemoved".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackNativeExpressClosed(adProviderType: adProviderType, adObject: nativeExpressAdView, listener: listener)
        }
    }
    
    public override func renderNativeExpress(ad: Any, rootViewController: UIViewController) {
        guard ad is BUNativeExpressAdView else {
            "这个渲染的广告类型不是 BUNativeExpressAdView".loge()
            return
        }
        
        let ad = ad as! BUNativeExpressAdView
        ad.rootViewController = rootViewController
        ad.render()
    }
    
    public override func getNativeExpressSize(ad: Any) -> CGSize {
        guard ad is BUNativeExpressAdView else {
            "这个渲染的广告类型不是 BUNativeExpressAdView".loge()
            return CGSize(width: 0, height: 0)
        }
        let ad = ad as! BUNativeExpressAdView
        return ad.frame.size
    }
}
