//
//  BaseTogetherView.swift
//  Pods-TogetherAd_Example
//
//  Created by 徐佳吉 on 2021/11/11.
//

import Foundation
import UIKit

public class BaseTogetherView: UIView {
    internal weak var rootViewController: UIViewController?
    internal var helper: BaseHelper
    
    enum FailedAllMsg: String {
        case rootViewControllerWeak = "rootViewController已被释放"
        case failedAll_noDispatch = "全部请求失败或没有分配任何广告"
        case timeOut = "请求超时"
    }
    
    public init(alias: String, adTypeRatioMap: [String:Int]? = nil, delegate: BaseListener? = nil, rootViewController: UIViewController, frame: CGRect) {
        self.rootViewController = rootViewController
        self.helper = BaseHelper(alias: alias, adTypeRatioMap: adTypeRatioMap, delegate: delegate)
        super.init(frame: frame)
        load(adTypeRatioMap: self.helper.currentTypeRatioMap)
    }
    
    internal func removeSelf() {
        self.subviews.forEach{$0.removeFromSuperview()}
        self.removeFromSuperview()
    }
    
    internal func load(adTypeRatioMap: [String:Int]) {
        self.helper.loadCheck(adTypeRatioMap: adTypeRatioMap, failedAll: {
            removeSelf()
        }) { adProviderType, adProvider in
            loadBy(adProviderType: adProviderType, adProvider: adProvider)
        }
    }
    
    internal func loadBy(adProviderType: String, adProvider: BaseAdProvider) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
