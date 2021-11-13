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
    private lazy var splashDelegate: SplashListener? =
    self.helper.delegate as? SplashListener
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public required init(alias: String, adTypeRatioMap: [String : Int]? = nil, delegate: SplashListener? = nil, rootViewController: UIViewController, frame: CGRect) {
        super.init(alias: alias, adTypeRatioMap: adTypeRatioMap, delegate: delegate, rootViewController: rootViewController, frame: frame)
    }
    
    override func loadBy(adProviderType: String, adProvider: BaseAdProvider) {
        if let rootViewController = rootViewController {
            subView = adProvider.createSplashAd(adProviderType: adProviderType, alias: self.helper.alias, rootViewController: rootViewController, frame: self.frame, listener: self)
        } else {
            self.helper.delegate?.onAdFailedAll(failedMsg: FailedAllMsg.rootViewControllerWeak.rawValue)
            removeSelf()
        }
    }
    
}

extension TogetherSplashView: SplashListener {
    public func onAdLoaded(providerType: String) {
        splashDelegate?.onAdLoaded(providerType: providerType)
        if let subView = subView {
            addSubview(subView)
        }
    }
    
    public func onAdClicked(providerType: String) {
        splashDelegate?.onAdClicked(providerType: providerType)
    }
    
    public func onAdExposure(providerType: String) {
        splashDelegate?.onAdExposure(providerType: providerType)
    }
    
    public func onAdDismissed(providerType: String) {
        splashDelegate?.onAdDismissed(providerType: providerType)
        removeSelf()
    }
    
    public func onAdStartRequest(providerType: String) {
        splashDelegate?.onAdStartRequest(providerType: providerType)
    }
    
    public func onAdFailed(providerType: String, failedMsg: String?) {
        self.load(adTypeRatioMap: self.helper.filterType(ratioMap: self.helper.currentTypeRatioMap, adProviderType: providerType))
        splashDelegate?.onAdFailed(providerType: providerType, failedMsg: failedMsg)
    }
    
    
}
