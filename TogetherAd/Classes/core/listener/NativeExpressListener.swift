//
//  NativeExpressListener.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/8.
//

import Foundation
public protocol NativeExpressListener : BaseListener {

    /**
     * 请求到了广告
     */
    func onAdLoaded(providerType: String, adList: [Any])

    /**
     * 广告被点击了
     */
    func onAdClicked(providerType: String, adObject: Any?)

    /**
     * 广告展示了
     */
    func onAdShow(providerType: String, adObject: Any?)

    /**
     * 广告模板渲染成功
     */
    func onAdRenderSuccess(providerType: String, adObject: Any?)

    /**
     * 广告模板渲染失败了
     */
    func onAdRenderFail(providerType: String, adObject: Any?)

    /**
     * 广告模板被关闭了
     */
    func onAdClosed(providerType: String, adObject: Any?)
}

extension NativeExpressListener {
    public func onAdLoaded(providerType: String, adList: [Any]) {}
    public func onAdClicked(providerType: String, adObject: Any?) {}
    public func onAdShow(providerType: String, adObject: Any?) {}
    public func onAdRenderSuccess(providerType: String, adObject: Any?) {}
    public func onAdRenderFail(providerType: String, adObject: Any?) {}
    public func onAdClosed(providerType: String, adObject: Any?) {}
}
