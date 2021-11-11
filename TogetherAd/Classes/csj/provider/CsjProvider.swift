//
//  CsjProvider.swift
//  TogetherAd
//
//  广告提供商：穿山甲
//
//  Created by 徐佳吉 on 2021/11/9.
//

import Foundation

public class CsjProvider: CsjProviderSplash {
    
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

        //图片的宽高
        static internal var imageAcceptedSizeWidth: CGFloat = 1080

        static internal var imageAcceptedSizeHeight: CGFloat = 1920

        public static func setImageAcceptedSize(width: CGFloat, height: CGFloat) {
            imageAcceptedSizeWidth = width
            imageAcceptedSizeHeight = height
        }

//        var splashButtonType = TTAdConstant.SPLASH_BUTTON_TYPE_FULL_SCREEN
    }
    
    
}
