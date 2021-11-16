//
//  AdHelperNativeExpress.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/16.
//

import Foundation
public class AdHelperNativeExpress: BaseLoadShowHelper, NativeExpressListener {

    private lazy var nativeDelegate: NativeExpressListener? =
        self.delegate as? NativeExpressListener
    private let adSize: CGSize
    private let adCount: Int
    
    public init(alias: String, adTypeRatioMap: [String : Int]? = nil, adSize: CGSize, adCount: Int, delegate: NativeExpressListener? = nil) {
        self.adSize = adSize
        self.adCount = adCount
        super.init(alias: alias, adTypeRatioMap: adTypeRatioMap, delegate: delegate)
    }
    
    override func loadBy(adProviderType: String, adProvider: BaseAdProvider) {
        adProvider.requestNativeExpressAd(adProviderType: adProviderType, alias: alias, size: adSize, count: adCount, listener: self)
    }
    
    public func renderNative(ad: Any, rootViewController: UIViewController) {
        adProvider?.renderNativeExpress(ad: ad, rootViewController: rootViewController)
    }
    
    public func onAdLoaded(providerType: String, adList: [Any]) {
        nativeDelegate?.onAdLoaded(providerType: providerType, adList: adList)
    }
    
    public func onAdClicked(providerType: String, adObject: Any?) {
        nativeDelegate?.onAdClicked(providerType: providerType, adObject: adObject)
    }
    
    public func onAdShow(providerType: String, adObject: Any?) {
        nativeDelegate?.onAdShow(providerType: providerType, adObject: adObject)
    }
    
    public func onAdRenderSuccess(providerType: String, adObject: Any?) {
        nativeDelegate?.onAdRenderSuccess(providerType: providerType, adObject: adObject)
    }
    
    public func onAdRenderFail(providerType: String, adObject: Any?) {
        nativeDelegate?.onAdRenderFail(providerType: providerType, adObject: adObject)
    }
    
    public func onAdClosed(providerType: String, adObject: Any?) {
        nativeDelegate?.onAdClosed(providerType: providerType, adObject: adObject)
    }
    
    public func onAdStartRequest(providerType: String) {
        nativeDelegate?.onAdStartRequest(providerType: providerType)
    }
    
    public func onAdFailed(providerType: String, failedMsg: String?) {
        self.load(adTypeRatioMap: self.filterType(ratioMap: self.currentTypeRatioMap, adProviderType: providerType))
        nativeDelegate?.onAdFailed(providerType: providerType, failedMsg: failedMsg)
    }
}
