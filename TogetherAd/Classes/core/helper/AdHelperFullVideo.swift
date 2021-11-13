//
//  AdHelperFullVideo.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/13.
//

import Foundation
public class AdHelperFullVideo: BaseLoadShowHelper, FullVideoListener {
    
    private lazy var fullVideoDelegate: FullVideoListener? =
        self.delegate as? FullVideoListener
    
    public required init(alias: String, adTypeRatioMap: [String : Int]? = nil, delegate: FullVideoListener? = nil) {
        super.init(alias: alias, adTypeRatioMap: adTypeRatioMap, delegate: delegate)
    }
    
    override func loadBy(adProviderType: String, adProvider: BaseAdProvider) {
        adProvider.requestFullVideoAd(adProviderType: adProviderType, alias: self.alias, listener: self)
    }
    
    public override func show(fromRootViewController viewController: UIViewController) -> Bool {
        return adProvider?.show(fromRootViewController: viewController) ?? false
    }
    
    public func onAdLoaded(providerType: String) {
        fullVideoDelegate?.onAdLoaded(providerType: providerType)
    }
    
    public func onAdVideoCached(providerType: String) {
        fullVideoDelegate?.onAdVideoCached(providerType: providerType)
        if let rootViewController = self.rootViewController {
            let isShow = show(fromRootViewController: rootViewController)
            "加载完成立即显示：\(isShow)".logi()
        }
    }
    
    public func onAdShow(providerType: String) {
        fullVideoDelegate?.onAdShow(providerType: providerType)
    }
    
    public func onAdClose(providerType: String) {
        fullVideoDelegate?.onAdClose(providerType: providerType)
    }
    
    public func onAdClicked(providerType: String) {
        fullVideoDelegate?.onAdClose(providerType: providerType)
    }
    
    public func onAdStartRequest(providerType: String) {
        fullVideoDelegate?.onAdStartRequest(providerType: providerType)
    }
    
    public func onAdVideoComplete(providerType: String) {
        fullVideoDelegate?.onAdVideoComplete(providerType: providerType)
    }
    
    public func onAdFailed(providerType: String, failedMsg: String?) {
        self.load(adTypeRatioMap: self.filterType(ratioMap: self.currentTypeRatioMap, adProviderType: providerType))
        fullVideoDelegate?.onAdFailed(providerType: providerType, failedMsg: failedMsg)
    }
}
