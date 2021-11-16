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
     * -----------------------------------获取原生模板-----------------------------------
     */
    public func requestNativeExpressAd(
        adProviderType: String,
        alias: String,
        size: CGSize,
        count: Int,
        listener: NativeExpressListener
    ) {
        "没有实现Native广告的请求".loge()
    }
    
    /// 渲染native
    public func renderNativeExpress(ad: Any, rootViewController: UIViewController) {
        "没有实现渲染native广告".loge()
    }
    
    // 获取native大小
    public func getNativeExpressSize(ad: Any) -> CGSize {
        "没有实现获取大小".logi()
        return CGSize(width: 0, height: 0)
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
    
    func showFullVideoAd(fromRootViewController viewController: UIViewController) -> Bool {
        "没有实现显示全屏视频".loge()
        return false
    }
   
    /**
     * -----------------------------------请求激励广告 -----------------------------------
     */
    func requestRewardAd(
        adProviderType: String,
        alias: String,
        listener: RewardListener
    ) {
        "没有实现请求激励视频".loge()
    }
    
    //展示激励广告
    func showRewardAd(fromRootViewController viewController: UIViewController) -> Bool {
        "没有实现显示激励视频".loge()
        return false
    }

    /**
     * -----------------------------------插屏-----------------------------------
     */
    func requestInterAd(
             adProviderType: String,
             alias: String,
             listener: InterListener
    ) {
        "没有实现请求插屏广告".loge()
    }

    //展示插屏广告
    func showInterAd(fromRootViewController viewController: UIViewController) -> Bool {
        "没有实现显示插屏广告".loge()
        return false
    }
}
