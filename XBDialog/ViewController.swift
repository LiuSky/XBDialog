//
//  ViewController.swift
//  XBDialog
//
//  Created by xiaobin liu on 2017/6/7.
//  Copyright © 2017年 Sky. All rights reserved.
//

import UIKit
import SnapKit


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
        self.present(vc, animated: true, completion: nil)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


class DemoViewController: UIViewController {
    
    private let button = UIButton(type: .custom)

    private var de: XBPresentAnimator!
    init() {
        super.init(nibName: nil, bundle: nil)
        self.de = XBPresentAnimator(self)
//        self.de.menu {
//            $0.duration = 0.3
//            $0.isShowMask = true
//            $0.menuType = MenuType.leftWidthFromViewRate(rate: 0.8)
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureRecognizer))
//            tap.numberOfTapsRequired = 1
//            $0.gestureRecognizer = tap
//        }
//        self.xb.present.menu {
//            $0.duration = 0.3
//            $0.isShowMask = true
//            $0.menuType = MenuType.leftWidthFromViewRate(rate: 0.8)
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureRecognizer))
//            tap.numberOfTapsRequired = 1
//            $0.gestureRecognizer = tap
//        }
//
        
//        self.xb.present.dialog {
//            $0.duration = 0.3
//            $0.isShowMask = false
//            $0.animateType = DialogAnimateType.direction(type: .right)
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureRecognizer))
//            tap.numberOfTapsRequired = 1
//            $0.gestureRecognizer = tap
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.view.backgroundColor = .red
        self.button.backgroundColor = UIColor.blue
        self.button.setTitle("隐藏", for: .normal)
        self.button.addTarget(self, action: #selector(DemoViewController.dis), for: .touchUpInside)
        self.view.addSubview(self.button)
        
        self.button.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscapeLeft
    }
    
    @objc public func dis() {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // 手势点击
    @objc public func tapGestureRecognizer() {
        self.dismiss(animated: true, completion: nil)
    }
    
//    override var shouldAutorotate: Bool {
//        return true
//    }
//
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        return .landscapeRight
//    }
//
//    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
//        return UIInterfaceOrientation.landscapeLeft
//    }
    
//    // 大小自定义(这边自定义不影响上面用autolayout来布局)
//    override var preferredContentSize: CGSize {
//        get {
//            return CGSize(width: 300, height: 500)
//        }
//        set { super.preferredContentSize = newValue }
//    }
    
    deinit {
//    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        debugPrint("页面释放")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

