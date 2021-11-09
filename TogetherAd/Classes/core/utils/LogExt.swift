//
//  LogExt.swift
//  Pods-TogetherAd_Example
//
//  Created by 徐佳吉 on 2021/11/9.
//

import Foundation
import TogetherAd

extension String {
    func logv(tag: String = "TogetherAd") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
    
    func logd(tag: String = "TogetherAd") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
    
    func logi(tag: String = "TogetherAd") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
    
    func logw(tag: String = "TogetherAd") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
    
    func loge(tag: String = "TogetherAd") {
        if TogetherAd.shared.printLogEnable {
            print(tag, self)
        }
    }
}
