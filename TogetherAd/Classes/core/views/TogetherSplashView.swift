//
//  TogetherSplashView.swift.swift
//  Pods-TogetherAd_Example
//
//  Created by 徐佳吉 on 2021/11/11.
//

import Foundation
import UIKit

public class TogetherSplashView: BaseTogetherView {
    
    private var subView: UIView? = nil
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public required init(alias: String, adTypeRatioMap: [String : Int], delegate: SplashListener? = nil, rootViewController: UIViewController, frame: CGRect) {
        super.init(alias: alias, adTypeRatioMap: adTypeRatioMap, delegate: delegate, rootViewController: rootViewController, frame: frame)
    }
    
    
    override func loadBy(adProviderType: String, adProvider: BaseAdProvider) {
        subView = adProvider.createSplashAd(adProviderType: adProviderType, alias: alias, rootViewController: rootViewController, listener: self)
    }
    
}

extension TogetherSplashView: SplashListener {
    public func onAdLoaded(providerType: String) {
        (delegate as? SplashListener)?.onAdLoaded(providerType: providerType)
        if let subView = subView {
            addSubview(subView)
        }
    }
    
    public func onAdClicked(providerType: String) {
        (delegate as? SplashListener)?.onAdClicked(providerType: providerType)
    }
    
    public func onAdExposure(providerType: String) {
        (delegate as? SplashListener)?.onAdExposure(providerType: providerType)
    }
    
    public func onAdDismissed(providerType: String) {
        (delegate as? SplashListener)?.onAdDismissed(providerType: providerType)
    }
    
    public func onAdStartRequest(providerType: String) {
        
    }
    
    public func onAdFailedAll(failedMsg: String?) {
        
    }
    
    public func onAdFailed(providerType: String, failedMsg: String?) {
        (delegate as? SplashListener)?.onAdFailed(providerType: providerType, failedMsg: failedMsg)
    }
    
    
}
