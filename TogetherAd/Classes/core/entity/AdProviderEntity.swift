//
//  AdProviderEntity.swift
//  TogetherAd
//
//  Created by 徐佳吉 on 2021/11/8.
//

import Foundation

public class AdProviderEntity<T: BaseAdProvider> {
    
    /// key 标示，唯一
    public let providerType: String

    /// Provider 类的路径
    public let classPath: T.Type

    /// Provider 的描述
    public let desc: String

    public required init(providerType: String, classPath: T.Type, desc: String) {
        self.providerType = providerType
        self.classPath = classPath
        self.desc = desc
    }
    
}
