//
//  BaseHelper.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/13.
//

import Foundation

public class BaseHelper {
    internal let alias: String
    public let delegate: BaseListener?
    internal var adProvider: BaseAdProvider?
    internal var currentTypeRatioMap: [String:Int]
    
    enum FailedAllMsg: String {
        case rootViewControllerWeak = "rootViewController已被释放"
        case failedAll_noDispatch = "全部请求失败或没有分配任何广告"
        case timeOut = "请求超时"
    }
    
    public init(alias: String, adTypeRatioMap: [String:Int]? = nil, delegate: BaseListener? = nil) {
        self.alias = alias
        self.delegate = delegate
        self.currentTypeRatioMap = adTypeRatioMap ?? TogetherAd.shared.getPublicProviderRatio()
    }
    
    internal func loadCheck(adTypeRatioMap: [String:Int], failedAll:() -> (), load: (String, BaseAdProvider) -> ()) {
        let adProviderType = DispatchUtil.getAdProvider(alias: alias, ratioMap: adTypeRatioMap)
        
        guard let adProviderType = adProviderType else {
            self.delegate?.onAdFailedAll(failedMsg: FailedAllMsg.failedAll_noDispatch.rawValue)
            failedAll()
            return
        }
        
        adProvider = AdProviderLoader.loadAdProvider(providerType: adProviderType)
        
        guard let adProvider = adProvider else {
            "\(adProviderType) 未初始化，请先初始化改类型广告".loge()
            loadCheck(adTypeRatioMap: self.filterType(ratioMap: adTypeRatioMap, adProviderType: adProviderType), failedAll: failedAll, load: load)
            return
        }
        
        load(adProviderType, adProvider)
    }
    
    /**
     * 将传进来的 adProviderType 权重设置为 0，其他不变
     * 如果是不允许失败切换的时候，将所有广告提供商的权重都清空
     */
    internal func filterType(ratioMap: [String:Int], adProviderType: String) -> [String: Int] {
        var newRatioMap = [String:Int]()
        for (k, v) in ratioMap {
            newRatioMap[k] = v
        }
        newRatioMap[adProviderType] = 0
        
        // 不允许失败切换的时候，将所有广告提供商的权重都清空
        if !TogetherAd.shared.failedSwitchEnable {
            for (k, _) in newRatioMap {
                newRatioMap[k] = 0
            }
        }
        self.currentTypeRatioMap = newRatioMap
        return newRatioMap
    }
}
