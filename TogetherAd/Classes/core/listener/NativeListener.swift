//
//  NativeListener.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/8.
//

import Foundation
public protocol NativeListener : BaseListener {

    /**
     * 请求到了广告
     */
    func onAdLoaded(providerType: String, adList: [Any])

}
