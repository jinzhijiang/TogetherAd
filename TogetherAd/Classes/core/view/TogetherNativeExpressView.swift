//
//  TogetherNativeView.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/15.
//

import Foundation
public class TogetherNativeExpressView: BaseTogetherView {
    
    private var subView: UIView? = nil
    private lazy var nativeDelegate: NativeExpressListener? =
    self.helper.delegate as? NativeExpressListener
    private var isRenderedNative = false
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public required init(alias: String, adTypeRatioMap: [String : Int]? = nil, delegate: NativeExpressListener? = nil, rootViewController: UIViewController, frame: CGRect) {
        super.init(alias: alias, adTypeRatioMap: adTypeRatioMap, delegate: delegate, rootViewController: rootViewController, frame: frame)
    }
    
    override func loadBy(adProviderType: String, adProvider: BaseAdProvider) {
        adProvider.requestNativeExpressAd(adProviderType: adProviderType, alias: self.helper.alias, size: self.frame.size, count: 1, listener: self)
    }
}

extension TogetherNativeExpressView: NativeExpressListener {
    public func onAdLoaded(providerType: String, adList: [Any]) {
        nativeDelegate?.onAdLoaded(providerType: providerType, adList: adList)
        if adList.count > 0, let rootViewController = rootViewController {
            self.helper.adProvider?.renderNativeExpress(ad: adList[0], rootViewController: rootViewController)
        }
    }
    
    public func onAdClicked(providerType: String, adObject: Any?) {
        nativeDelegate?.onAdClicked(providerType: providerType, adObject: adObject)
    }
    
    public func onAdShow(providerType: String, adObject: Any?) {
        nativeDelegate?.onAdShow(providerType: providerType, adObject: adObject)
    }
    
    public func onAdRenderSuccess(providerType: String, adObject: Any?) {
        if let adObject = adObject {
            self.frame.size = self.helper.adProvider?.getNativeExpressSize(ad: adObject) ?? CGSize(width: 0, height: 0)
        }
        if let subView = adObject {
            addSubview(subView as! UIView)
        }
        nativeDelegate?.onAdRenderSuccess(providerType: providerType, adObject: adObject)
    }
    
    public func onAdRenderFail(providerType: String, adObject: Any?) {
        nativeDelegate?.onAdRenderFail(providerType: providerType, adObject: adObject)
        removeSelf()
    }
    
    public func onAdClosed(providerType: String, adObject: Any?) {
        nativeDelegate?.onAdClosed(providerType: providerType, adObject: adObject)
    }
    
    public func onAdStartRequest(providerType: String) {
        nativeDelegate?.onAdStartRequest(providerType: providerType)
    }
    
    public func onAdFailed(providerType: String, failedMsg: String?) {
        self.load(adTypeRatioMap: self.helper.filterType(ratioMap: self.helper.currentTypeRatioMap, adProviderType: providerType))
        nativeDelegate?.onAdFailed(providerType: providerType, failedMsg: failedMsg)
    }
}
