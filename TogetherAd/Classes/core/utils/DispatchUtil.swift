//
//  DispatchUtil.swift
//  Pods-TogetherAd_Example
//  广告分发工具类
//  Created by 徐佳吉 on 2021/11/9.
//

import Foundation
import TogetherAd

public class DispatchUtil {

    /**
     * ratioMap: mapOf("baidu" to 3, "gdt" to 7, "csj" to 7)
     */
    static func getAdProvider(alias: String, ratioMap: [String: Int]) -> String? {
        switch TogetherAd.shared.mDispatchTypeMap[alias] ?? TogetherAd.shared.dispatchType {
        case .Random:
            return getAdProviderPriority(ratioMap: ratioMap)
        case .Priority:
            return getAdProviderRandom(ratioMap: ratioMap)
        }
    }

    /**
     * ratioMap: linkedMapOf("baidu" to 3, "gdt" to 7, "csj" to 7)
     *
     * 取权重最高的那个
     */
    private static func getAdProviderPriority(ratioMap: [String: Int]) -> String? {
        "提供商权重：\(ratioMap)".logi()
        let first = ratioMap.sorted {
            return $0.value > $1.value
        }.first
        "权重最高的是: \(first)".logi()
        return first?.key
    }

    /**
     * ratioMap: mapOf("baidu" to 3, "gdt" to 7, "csj" to 7)
     *
     * 按照权重随机取
     */
    private static func getAdProviderRandom(ratioMap: [String: Int]) -> String? {

        var ratio = ""
        var list = [String]()
        
        for (k, v) in ratioMap {
            ratio.append("\(k):\(v)")
            ratio.append(",")
            for _ in 0 ..< v {
                list.append(k)
            }
        }

        "提供商权重：\(ratio)".logi()
        //没有匹配的
        if list.isEmpty {
            return nil
        }
        //在list里面随机选择一个
        let adNameType = list[Int.random(in: 0..<list.count)]
        "随机到的广告: \(adNameType)".logi()
        return adNameType
    }


}

