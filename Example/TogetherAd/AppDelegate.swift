//
//  AppDelegate.swift
//  TogetherAd
//
//  Created by xujiaji on 11/08/2021.
//  Copyright (c) 2021 xujiaji. All rights reserved.
//

import UIKit
import TogetherAd

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        TogetherAd.shared.addProvider(adProviderEntity: AdProviderEntity(providerType: "csj", classPath: CsjProvider.self, desc: ""))
        TogetherAd.shared.setPublicProviderRatio(ratioMap: ["csj": 1])
        
        TogetherAdCsj.`init`(adProviderType: "csj", csjAdAppId: "5195862", isDebug: true)
        TogetherAdCsj.idMapCsj["splash"] = "887525763"
        TogetherAdCsj.idMapCsj["banner"] = "946453843"
        TogetherAdCsj.idMapCsj["fullscreen"] = "946453837"
        TogetherAdCsj.idMapCsj["reward"] = "946453836"
        TogetherAdCsj.idMapCsj["inter"] = "947075764"
        TogetherAdCsj.idMapCsj["native"] = "947094333"
        
        let frame = UIScreen.main.bounds
        
        // 设置和服务器配置的一致的比例，这里服务器配置的宽高比例为3：2
        CsjProvider.Inter.setSize(width: frame.width - 80, height: (frame.width - 80) * (2.0/3.0))
        
        if let rootViewController = window?.rootViewController {
            let view = TogetherSplashView(alias: "splash", rootViewController:rootViewController, frame: frame)
            rootViewController.view.addSubview(view)
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

