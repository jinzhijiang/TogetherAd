//
//  BaseLoadShowHelper.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/13.
//

import Foundation
public class BaseLoadShowHelper: BaseHelper {

    internal var rootViewController: UIViewController? = nil
    
    public override init(alias: String, adTypeRatioMap: [String : Int]? = nil, delegate: BaseListener? = nil) {
        super.init(alias: alias, adTypeRatioMap: adTypeRatioMap, delegate: delegate)
    }
    
    public func load() {
        load(adTypeRatioMap: self.currentTypeRatioMap)
    }
    
    public func loadAndShow(fromRootViewController viewController: UIViewController) {
        load(adTypeRatioMap: self.currentTypeRatioMap)
        self.rootViewController = viewController
    }
    
    internal func load(adTypeRatioMap: [String:Int]) {
        loadCheck(adTypeRatioMap: adTypeRatioMap, failedAll: {
            
        }) {adProviderType, adProvider in
            self.loadBy(adProviderType: adProviderType, adProvider: adProvider)
        }
    }
    
    internal func loadBy(adProviderType: String, adProvider: BaseAdProvider) {
        
    }
    
    public func show(fromRootViewController viewController: UIViewController) -> Bool {
        return false
    }
    
}
