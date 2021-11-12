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
    
    public required init(alias: String, adTypeRatioMap: [String : Int]? = nil, delegate: SplashListener? = nil, rootViewController: UIViewController, frame: CGRect) {
        super.init(alias: alias, adTypeRatioMap: adTypeRatioMap, delegate: delegate, rootViewController: rootViewController, frame: frame)
    }
    
    override func loadBy(adProviderType: String, adProvider: BaseAdProvider) {
        if let rootViewController = rootViewController {
            subView = adProvider.createSplashAd(adProviderType: adProviderType, alias: alias, rootViewController: rootViewController, frame: self.frame, listener: self)
        } else {
            self.delegate?.onAdFailedAll(failedMsg: FailedAllMsg.rootViewControllerWeak.rawValue)
        }
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
        (delegate as? SplashListener)?.onAdStartRequest(providerType: providerType)
    }
    
    public func onAdFailedAll(failedMsg: String?) {
        fatalError("这个是当前类的功能回调，内部不会被调用")
    }
    
    public func onAdFailed(providerType: String, failedMsg: String?) {
        self.load(adTypeRatioMap: self.filterType(ratioMap: self.currentTypeRatioMap, adProviderType: providerType))
        (delegate as? SplashListener)?.onAdFailed(providerType: providerType, failedMsg: failedMsg)
    }
    
    
}
