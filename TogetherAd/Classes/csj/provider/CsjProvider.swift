//
//  CsjProvider.swift
//  TogetherAd
//
//  广告提供商：穿山甲
//
//  Created by 徐佳吉 on 2021/11/9.
//

import Foundation

public class CsjProvider: CsjProviderFullVideo {
    
    public required init() {
        super.init()
    }
    
    
    /**
     * --------------------------- 开屏 ---------------------------
     */
    public class Splash {

        //是否模板类型广告请求
        public static var isExpress = false

        //超时时间
        public static var maxFetchDelay: Double = 4000

//        //自定义按钮
//        public static var customSkipView: BaseSplashSkipView? = null

//        var splashButtonType = TTAdConstant.SPLASH_BUTTON_TYPE_FULL_SCREEN
    }
    
    
    /**
     * --------------------------- 横幅Banner ---------------------------
     */
    public class Banner {
        /// 轮播间隔时间为30s～120s之间，最短轮播时间为2.5s
        public static var slideIntervalTime = 30
    }
    
}
