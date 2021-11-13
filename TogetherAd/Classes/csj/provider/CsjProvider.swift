//
//  CsjProvider.swift
//  TogetherAd
//
//  广告提供商：穿山甲
//
//  Created by 徐佳吉 on 2021/11/9.
//

import Foundation

public class CsjProvider: CsjProviderReward {
    
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
    
    /**
     * --------------------------- 全屏视频 ---------------------------
     */
    public class FullVideo {
        
    }
    
    /**
     * --------------------------- 激励 ---------------------------
     */
    public class Reward {
        //表来标识应用侧唯一用户；若非服务器回调模式或不需sdk透传,可设置为空字符串
        public static var userID: String? = nil
        
        //奖励的名称
        public static var rewardName: String? = nil

        //奖励的数量
        public static var rewardAmount: Int? = nil
        
        //用户透传的信息，可不传
        public static var mediaExtra: String? = nil

        //设置是否在视频播放页面展示下载bar
        public static var showDownLoadBar: Bool = true

        /**
         * onAdRewardVerify 回调中用于判断校验结果（ 后台校验中用到 ）
         */
        public static var rewardVerify: Bool = false

    }
}
