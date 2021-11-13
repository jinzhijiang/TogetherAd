//
//  AdProviderFuncDefine.swift
//  TogetherAd
//  广告提供器方法定义
//  Created by 徐佳吉 on 2021/11/12.
//

import Foundation

public class AdProviderFuncDefine: NSObject {
    
    /// 开屏广告仅请求
    public func createSplashAd(
        adProviderType: String,
        alias: String,//当前广告位的别名
        rootViewController: UIViewController,
        frame: CGRect,
        listener: SplashListener//回调
    ) -> UIView? {
        "没有实现开屏页创建".loge()
        return nil
    }
    
    ///  Banner 广告
    public func createBannerAd(
        adProviderType: String,
        alias: String,
        rootViewController: UIViewController,
        frame: CGRect,
        listener: BannerListener
    ) -> UIView? {
        "没有实现Banner创建".loge()
        return nil
    }
    
    /**
     * -----------------------------------请求全屏视频广告 -----------------------------------
     */
    func requestFullVideoAd(
        adProviderType: String,
        alias: String,
        listener: FullVideoListener
    ) {
        "没有实现请求全屏视频".loge()
    }
    
    func show(fromRootViewController viewController: UIViewController) -> Bool {
        "没有实现显示全屏视频".loge()
        return false
    }
}
