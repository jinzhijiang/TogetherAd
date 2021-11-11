//
//  BaseTogetherView.swift
//  Pods-TogetherAd_Example
//
//  Created by 徐佳吉 on 2021/11/11.
//

import Foundation
import UIKit

public class BaseTogetherView: UIView {
    internal let alias: String
    public let delegate: BaseListener?
    private var adProvider: BaseAdProvider?
    internal weak var rootViewController: UIViewController?
    
    enum FailedAllMsg: String {
        case failedAll_noDispatch = "全部请求失败或没有分配任何广告"
        case timeOut = "请求超时"
    }
    
    public init(alias: String, adTypeRatioMap: [String:Int], delegate: BaseListener? = nil, rootViewController: UIViewController, frame: CGRect) {
        self.alias = alias
        self.delegate = delegate
        self.rootViewController = rootViewController
        super.init(frame: frame)
        load(adTypeRatioMap: adTypeRatioMap)
    }
    
    private func load(adTypeRatioMap: [String:Int]) {
        let adProviderType = DispatchUtil.getAdProvider(alias: alias, ratioMap: adTypeRatioMap)
        
        guard let adProviderType = adProviderType else {
            self.delegate?.onAdFailedAll(failedMsg: FailedAllMsg.failedAll_noDispatch.rawValue)
            return
        }
        
        adProvider = AdProviderLoader.loadAdProvider(providerType: adProviderType)
        
        guard let adProvider = adProvider else {
            "\(adProviderType) 未初始化，请先初始化改类型广告".loge()
            load(adTypeRatioMap: self.filterType(ratioMap: adTypeRatioMap, adProviderType: adProviderType))
            return
        }
        
        self.loadBy(adProviderType: adProviderType, adProvider: adProvider)
    }
    
    internal func loadBy(adProviderType: String, adProvider: BaseAdProvider) {
        
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
        return newRatioMap
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
