//
//  LogExt.swift
//  Pods-TogetherAd_Example
//
//  Created by å¾ä½³å on 2021/11/9.
//

import Foundation

extension String {
    public func logv(tag: String = "TogetherAd-Vğ: ") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
    
    public func logd(tag: String = "TogetherAd-Dğ§: ") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
    
    public func logi(tag: String = "TogetherAd-Iâï¸: ") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
    
    public func logw(tag: String = "TogetherAd-Wâ ï¸: ") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
    
    public func loge(tag: String = "TogetherAd-Eğ: ") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
}
