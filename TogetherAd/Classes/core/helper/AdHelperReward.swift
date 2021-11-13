//
//  AdHelperReward.swift.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/13.
//

import Foundation
public class AdHelperReward: BaseLoadShowHelper, RewardListener {
    
    private lazy var rewardDelegate: RewardListener? =
        self.delegate as? RewardListener
    
    public required init(alias: String, adTypeRatioMap: [String : Int]? = nil, delegate: RewardListener? = nil) {
        super.init(alias: alias, adTypeRatioMap: adTypeRatioMap, delegate: delegate)
    }
    
    override func loadBy(adProviderType: String, adProvider: BaseAdProvider) {
        adProvider.requestRewardAd(adProviderType: adProviderType, alias: self.alias, listener: self)
    }
    
    public override func show(fromRootViewController viewController: UIViewController) -> Bool {
        return adProvider?.showRewardAd(fromRootViewController: viewController) ?? false
    }
    
    public func onAdRewardVerify(providerType: String) {}
    
    public func onAdLoaded(providerType: String) {
        rewardDelegate?.onAdLoaded(providerType: providerType)
    }
    
    public func onAdVideoCached(providerType: String) {
        rewardDelegate?.onAdVideoCached(providerType: providerType)
        if let rootViewController = self.rootViewController {
            let isShow = show(fromRootViewController: rootViewController)
            "加载完成立即显示：\(isShow)".logi()
        }
    }
    
    public func onAdShow(providerType: String) {
        rewardDelegate?.onAdShow(providerType: providerType)
    }
    
    public func onAdClose(providerType: String) {
        rewardDelegate?.onAdClose(providerType: providerType)
    }
    
    public func onAdClicked(providerType: String) {
        rewardDelegate?.onAdClicked(providerType: providerType)
    }
    
    public func onAdStartRequest(providerType: String) {
        rewardDelegate?.onAdStartRequest(providerType: providerType)
    }
    
    public func onAdVideoComplete(providerType: String) {
        rewardDelegate?.onAdVideoComplete(providerType: providerType)
    }
    
    public func onAdFailed(providerType: String, failedMsg: String?) {
        self.load(adTypeRatioMap: self.filterType(ratioMap: self.currentTypeRatioMap, adProviderType: providerType))
        rewardDelegate?.onAdFailed(providerType: providerType, failedMsg: failedMsg)
    }
}
