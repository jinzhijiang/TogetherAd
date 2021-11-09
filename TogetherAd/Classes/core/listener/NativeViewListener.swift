//
//  NativeViewListener.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/8.
//

import Foundation
/**
 *  原生自渲染广告曝光和点击的监听
 */
public protocol NativeViewListener {

    /**
     * 广告曝光了
     */
    func onAdExposed(providerType: String)

    /**
     * 广告被点击了
     */
    func onAdClicked(providerType: String)

}
