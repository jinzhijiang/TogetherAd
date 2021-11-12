//
//  LogExt.swift
//  Pods-TogetherAd_Example
//
//  Created by 徐佳吉 on 2021/11/9.
//

import Foundation

extension String {
    public func logv(tag: String = "TogetherAd-V🏝: ") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
    
    public func logd(tag: String = "TogetherAd-D🔧: ") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
    
    public func logi(tag: String = "TogetherAd-I☁️: ") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
    
    public func logw(tag: String = "TogetherAd-W⚠️: ") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
    
    public func loge(tag: String = "TogetherAd-E🐛: ") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
}
