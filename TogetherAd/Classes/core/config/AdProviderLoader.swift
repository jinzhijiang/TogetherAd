//
//  AdProviderLoader.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/9.
//

import Foundation
public class AdProviderLoader {

    public static func loadAdProvider(providerType: String) -> BaseAdProvider? {
        return TogetherAd.shared.getProvider(providerType: providerType)?.classPath.init()
    }
}
