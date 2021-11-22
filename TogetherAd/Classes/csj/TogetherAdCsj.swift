//
//  TogetherAdCsj.swift
//  TogetherAd
//
//  初始化穿山甲
//
//  Created by 徐佳吉 on 2021/11/9.
//

import Foundation
import AppTrackingTransparency

public class TogetherAdCsj {

    /// 必须设置，穿山甲的广告位ID
    public static var idMapCsj = [String: String]()

    /// 可选参数，需在初始化之前，设置用户画像的关键词列表 **不能超过为1000个字符**。须征得用户同意才可传入该参数
    public static var keywords: String? = nil {
        didSet {
            BUAdSDKManager.setUserKeywords(keywords)
        }
    }

    /// 可选参数，需在初始化之前，设置额外的用户信息 **不能超过为1000个字符**
    public static var data: String? = nil {
        didSet {
            BUAdSDKManager.setUserExtData(data)
        }
    }

    public static var IDFA: String? = nil {
        didSet {
            BUAdSDKManager.setCustomIDFA(IDFA)
        }
    }
    
    public static var isThemeNight = false {
        didSet {
            BUAdSDKManager.setThemeStatus(isThemeNight ? .night : .normal)
        }
    }
    
    /**
     * 自定义Provider + 广告位ID 一起初始化
     */
    public static func `init`<T: BaseAdProvider>(
        adProviderType: String,
        /// 穿山甲广告app id
        csjAdAppId: String,
        /// 是否是debug模式
        isDebug: Bool = false,
        /// 用来标识本次广告是否需要遵循儿童在线隐私保护条例 是否是儿童
        isCoppaChild: Bool = false,
        /// 用来标识本次广告是否遵循欧盟通用数据保护条例
        isGDPR: Bool = false,
        /// 是否是夜间模式
        isNight: Bool = false,
        /// Solve the problem when your WKWebview post message empty,default is BUOfflineTypeWebview
        offlineType: BUOfflineType = .webview,
        /// 穿山甲id映射关系
        csjIdMap: [String: String]? = nil,
        /// 穿山甲提供者的类
        providerClassPath: T.Type = CsjProvider.self as! T.Type) {
            TogetherAd.shared.addProvider(
                adProviderEntity:
                    AdProviderEntity<T>(
                        providerType: adProviderType,
                        classPath: providerClassPath,
                        desc: String(describing: providerClassPath)))
            for (k, v) in csjIdMap ?? [:] {
                idMapCsj[k] = v
            }
            BUAdSDKManager.setAppID(csjAdAppId)
            BUAdSDKManager.setLoglevel(isDebug ? .debug : .none)
            BUAdSDKManager.setCoppa(isCoppaChild ? 1 : 0)
            BUAdSDKManager.setGDPR(isGDPR ? 1 : 0)
            BUAdSDKManager.setOfflineType(offlineType)
            isThemeNight = isNight
            
            if #available(iOS 14, *) {
                ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                })
            } else {
                // Fallback on earlier versions
            }
    }
}
