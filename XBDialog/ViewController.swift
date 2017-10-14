//
//  ViewController.swift
//  XBDialog
//
//  Created by xiaobin liu on 2017/6/7.
//  Copyright © 2017年 Sky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.button.backgroundColor = .red
        self.button.setTitle("添加", for: .normal)
        self.button.addTarget(self, action: #selector(ViewController.pre), for: .touchUpInside)
        self.view.addSubview(self.button)
    }
    
    @objc public func pre() {
        
        let vc = DemoViewController()
        vc.xb.present.dialog {
            $0.duration = 0.3
            $0.blurEffectStyle = UIBlurEffectStyle.extraLight
            let tap = UITapGestureRecognizer(target: vc, action: #selector(DemoViewController.tapGestureRecognizer))
            tap.numberOfTapsRequired = 1
            $0.gestureRecognizer = tap
        }
        self.present(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


class DemoViewController: UIViewController {
    
    private let button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.layer.masksToBounds = true
        self.view.layer.cornerRadius  = 4
        
        self.button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.button.backgroundColor = UIColor.blue
        self.button.setTitle("隐藏", for: .normal)
        self.button.addTarget(self, action: #selector(DemoViewController.dis), for: .touchUpInside)
        self.view.addSubview(self.button)
    }
    
    @objc public func dis() {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // 手势点击
    @objc public func tapGestureRecognizer() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // 大小自定义(这边自定义不影响上面用autolayout来布局)
    override var preferredContentSize: CGSize {
        get {
            return CGSize(width: 300, height: 400)
        }
        set { super.preferredContentSize = newValue }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

