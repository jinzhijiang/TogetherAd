//
//  ViewController.swift
//  TogetherAd
//
//  Created by xujiaji on 11/08/2021.
//  Copyright (c) 2021 xujiaji. All rights reserved.
//

import UIKit
import TogetherAd

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let a = AdProviderEntity(providerType: "aa", classPath: "bb", desc: "ccc")
        
        print(a)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

