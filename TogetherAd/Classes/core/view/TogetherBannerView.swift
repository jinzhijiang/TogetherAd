//
//  TogetherBannerView.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/12.
//

import Foundation
import UIKit

public class TogetherBannerView: BaseTogetherView {
    
    private var subView: UIView? = nil
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public required init(alias: String, adTypeRatioMap: [String : Int]? = nil, delegate: BannerListener? = nil, rootViewController: UIViewController, frame: CGRect) {
        super.init(alias: alias, adTypeRatioMap: adTypeRatioMap, delegate: delegate, rootViewController: rootViewController, frame: frame)
    }
    
    override func loadBy(adProviderType: String, adProvider: BaseAdProvider) {
        if let rootViewController = rootViewController {
            subView = adProvider.createBannerAd(adProviderType: adProviderType, alias: self.helper.alias, rootViewController: rootViewController, frame: self.frame, listener: self)
        } else {
            self.helper.delegate?.onAdFailedAll(failedMsg: FailedAllMsg.rootViewControllerWeak.rawValue)
            removeSelf()
        }
    }
    
}

extension TogetherBannerView: BannerListener {
    public func onAdLoaded(providerType: String) {
        (self.helper.delegate as? BannerListener)?.onAdLoaded(providerType: providerType)
    }
    
    public func onAdClicked(providerType: String) {
        (self.helper.delegate as? BannerListener)?.onAdClicked(providerType: providerType)
    }
    
    public func onAdRendered(providerType: String) {
        (self.helper.delegate as? BannerListener)?.onAdRendered(providerType: providerType)
        if let subView = subView {
            if subviews.count == 1 && subviews[0] == subView {
                "本来就添加了这个view广告，不需要再次添加".logi()
                return
            }
            subviews.forEach{$0.removeFromSuperview()}
            addSubview(subView)
        }
    }
    
    public func onAdClose(providerType: String) {
        (self.helper.delegate as? BannerListener)?.onAdClose(providerType: providerType)
        removeSelf()
    }
    
    public func onAdStartRequest(providerType: String) {
        (self.helper.delegate as? BannerListener)?.onAdStartRequest(providerType: providerType)
    }

    public func onAdFailed(providerType: String, failedMsg: String?) {
        self.load(adTypeRatioMap: self.helper.filterType(ratioMap: self.helper.currentTypeRatioMap, adProviderType: providerType))
        (self.helper.delegate as? BannerListener)?.onAdFailed(providerType: providerType, failedMsg: failedMsg)
    }
}
