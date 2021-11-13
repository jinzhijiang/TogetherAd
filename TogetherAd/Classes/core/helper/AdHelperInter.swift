//
//  AdHelperInter.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/13.
//

import Foundation
public class AdHelperInter: BaseLoadShowHelper, InterListener {

    private lazy var interDelegate: InterListener? =
        self.delegate as? InterListener
    
    public required init(alias: String, adTypeRatioMap: [String : Int]? = nil, delegate: InterListener? = nil) {
        super.init(alias: alias, adTypeRatioMap: adTypeRatioMap, delegate: delegate)
    }
    
    override func loadBy(adProviderType: String, adProvider: BaseAdProvider) {
        adProvider.requestInterAd(adProviderType: adProviderType, alias: self.alias, listener: self)
    }
    
    public override func show(fromRootViewController viewController: UIViewController) -> Bool {
        return adProvider?.showInterAd(fromRootViewController: viewController) ?? false
    }
    
    public func onAdRendered(providerType: String) {
        interDelegate?.onAdRendered(providerType: providerType)
        if let rootViewController = self.rootViewController {
            let isShow = show(fromRootViewController: rootViewController)
            "加载完成立即显示：\(isShow)".logi()
        }
    }
    
    public func onAdShowed(providerType: String) {
        interDelegate?.onAdShowed(providerType: providerType)
    }
    
    public func onAdLoaded(providerType: String) {
        interDelegate?.onAdLoaded(providerType: providerType)
    }
    
    public func onAdClose(providerType: String) {
        interDelegate?.onAdClose(providerType: providerType)
    }
    
    public func onAdClicked(providerType: String) {
        interDelegate?.onAdClose(providerType: providerType)
    }
    
    public func onAdStartRequest(providerType: String) {
        interDelegate?.onAdStartRequest(providerType: providerType)
    }
    
    public func onAdFailed(providerType: String, failedMsg: String?) {
        self.load(adTypeRatioMap: self.filterType(ratioMap: self.currentTypeRatioMap, adProviderType: providerType))
        interDelegate?.onAdFailed(providerType: providerType, failedMsg: failedMsg)
    }
}
