//
//  CsjProviderFullVideo.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/13.
//

import Foundation
public class CsjProviderFullVideo: CsjProviderBanner, BUNativeExpressFullscreenVideoAdDelegate {
    private var mListener: FullVideoListener? = nil
    private var mAdProviderType: String? = nil
    private var mAlias: String? = nil
    private var mFullVideoAd: BUNativeExpressFullscreenVideoAd? = nil
    
    override func requestFullVideoAd(adProviderType: String, alias: String, listener: FullVideoListener) {
        mListener = listener
        mAdProviderType = adProviderType
        mAlias = alias
        
        callbackFullVideoStartRequest(adProviderType: adProviderType, alias: alias, listener: listener)
        
        mFullVideoAd = BUNativeExpressFullscreenVideoAd(slotID: TogetherAdCsj.idMapCsj[alias]!)
        mFullVideoAd!.delegate = self
        mFullVideoAd!.loadData()
    }
    
    override func showFullVideoAd(fromRootViewController viewController: UIViewController) -> Bool {
        return mFullVideoAd?.show(fromRootViewController: viewController) ?? false
    }
    
    public func nativeExpressFullscreenVideoAd(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd, didFailWithError error: Error?) {
        "nativeExpressFullscreenVideoAd 返回的错误码(error)表示广告加载失败的原因，所有错误码详情请见链接。https://www.csjplatform.com/support/doc/5de4cc6d78c8690012a90aa5?from=ad.oceanengine.com&id=5de4cc6d78c8690012a90aa5".loge()
        let e = error as NSError?
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            callbackFullVideoFailed(adProviderType: adProviderType, alias: alias, listener: listener, errorCode: e?.code, errorMsg: e?.userInfo.description)
        }
    }
    
    public func nativeExpressFullscreenVideoAdViewRenderFail(_ rewardedVideoAd: BUNativeExpressFullscreenVideoAd, error: Error?) {
        "nativeExpressFullscreenVideoAdViewRenderFail 渲染失败".loge()
        let e = error as NSError?
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            callbackFullVideoFailed(adProviderType: adProviderType, alias: alias, listener: listener, errorCode: e?.code, errorMsg: e?.userInfo.description)
        }
    }
    
    public func nativeExpressFullscreenVideoAdDidLoad(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd) {
        "nativeExpressFullscreenVideoAdDidLoad 广告素材物料加载成功".logi()
        if let adProviderType = mAdProviderType, let alias = mAlias, let listener = mListener {
            callbackFullVideoLoaded(adProviderType: adProviderType, alias: alias, listener: listener)
        }
    }
    
    public func nativeExpressFullscreenVideoAdDidDownLoadVideo(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd) {
        // /此回调方法后进行广告的展示，可保证播放流畅和展示流畅，用户体验更好。
        "nativeExpressFullscreenVideoAdDidDownLoadVideo 视频下载完成".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackFullVideoCached(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpressFullscreenVideoAdViewRenderSuccess(_ rewardedVideoAd: BUNativeExpressFullscreenVideoAd) {
        "nativeExpressFullscreenVideoAdViewRenderSuccess 渲染成功".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackFullVideoShow(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpressFullscreenVideoAdWillVisible(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd) {
        "nativeExpressFullscreenVideoAdWillVisible 模版全屏广告即将展示回调".logi()
    }
    
    public func nativeExpressFullscreenVideoAdDidVisible(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd) {
        "nativeExpressFullscreenVideoAdDidVisible 模版全屏广告已经展示回调".logi()
    }
    
    public func nativeExpressFullscreenVideoAdDidClick(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd) {
        "nativeExpressFullscreenVideoAdDidClick 点击回调".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackFullVideoClicked(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpressFullscreenVideoAdDidClickSkip(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd) {
        // 点击5s跳过会触发此回调，如果需要在用户点击跳过时做相关的逻辑处理，可在此回调中进行相关逻辑处理
        "nativeExpressFullscreenVideoAdDidClickSkip 跳过点击".logi()
    }
    
    public func nativeExpressFullscreenVideoAdWillClose(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd) {
        // 此回调方法可知用户进行了广告关闭操作，可在此回调方法中进行用户关闭广告时的相应的逻辑处理
        "nativeExpressFullscreenVideoAdWillClose 全屏视频将要关闭".logi()
    }
    
    public func nativeExpressFullscreenVideoAdDidClose(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd) {
        // 点击关闭按钮会触发此回调
        //在此回调方法中可进行广告的置空操作
        "nativeExpressFullscreenVideoAdDidClose 已关闭".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackFullVideoClosed(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpressFullscreenVideoAdDidPlayFinish(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd, didFailWithError error: Error?) {
        // 广告播放完成会触发此回调
        "nativeExpressFullscreenVideoAdDidPlayFinish 广告播放完成".logi()
        if let adProviderType = mAdProviderType, let listener = mListener {
            callbackFullVideoComplete(adProviderType: adProviderType, listener: listener)
        }
    }
    
    public func nativeExpressFullscreenVideoAdCallback(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd, with nativeExpressVideoAdType: BUNativeExpressFullScreenAdType) {
        // 此回调可知模版全屏视频的广告类型
        "nativeExpressFullscreenVideoAdCallback \(nativeExpressVideoAdType)".logi()
    }
    
    public func nativeExpressFullscreenVideoAdDidCloseOtherController(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd, interactionType: BUInteractionType) {
        // 此回调在广告跳转到其他控制器时，该控制器被关闭时调用interactionType：此参数可区分是打开的appstore/网页/视频广告详情页面
        "nativeExpressFullscreenVideoAdDidCloseOtherController".logi()
    }
}
