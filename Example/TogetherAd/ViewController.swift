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

    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onTapAddBanner(_ sender: Any) {
        let frame = UIScreen.main.bounds
        let bannerView = TogetherBannerView(alias: "banner", rootViewController: self, frame: CGRect(x: 0, y: 0, width: frame.width, height: 50))
        bannerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stackView.addArrangedSubview(bannerView)
    }
    
    @IBAction func onTapLoadAndShowFullVideo(_ sender: Any) {
        let helper = AdHelperFullVideo(alias: "fullscreen")
        helper.loadAndShow(fromRootViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

