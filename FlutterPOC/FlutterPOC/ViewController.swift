//
//  ViewController.swift
//  FlutterPOC
//
//  Created by Boo Kiao Wei on 7/1/19.
//  Copyright © 2019 SPH. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type:UIButton.ButtonType.custom)
        button.addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
        button.setTitle("Press me", for: UIControl.State.normal)
        button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
    }
    
    @objc func handleButtonAction()
    {
        let flutterViewController = FlutterViewController()
        flutterViewController.setInitialRoute("/Detail")
        self.pushViewController(flutterViewController, animated: true)
    
//        if let vc = self.presentedViewController, let nv = UINavigationController(rootViewController: vc)
//        {
//            nv.pushViewController(flutterViewController, animated: true)
//        }
    }
}

