//
//  DialogPresentationController.swift
//  XBDialog
//
//  Created by xiaobin liu on 2017/6/7.
//  Copyright © 2017年 Sky. All rights reserved.
//

import Foundation
import UIKit


/// 对话框UIPresentationController
public class DialogPresentationController: UIPresentationController {
    
    /// 遮罩View
    public var maskView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        return view
    }()
    
    /// 配置
    internal var config: DialogConfig!
    
    
    /// 初始化
    ///
    /// - Parameters:
    ///   - presentedViewController: <#presentedViewController description#>
    ///   - presentingViewController: <#presentingViewController description#>
    ///   - config: <#config description#>
    public convenience init(presentedViewController: UIViewController, presenting
        presentingViewController: UIViewController? ,
                            config:DialogConfig) {
        
        self.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        self.config = config
    }
    
    
    /// 在呈现过渡即将开始的时候被调用的,(在这里面加入遮罩,以及遮罩显示的动画)
    public override func presentationTransitionWillBegin() {
        
        super.presentationTransitionWillBegin()
        
        if let c = containerView, maskView.superview == nil {
            c.insertSubview(maskView, at: 0)
        }
        
        /// 如果手势存在的话
        if config.gestureRecognizer != nil {
            maskView.addGestureRecognizer(config.gestureRecognizer!)
        }
        
        /// 如果有毛玻璃的设置
        if let effect = config.blurEffectStyle {
            
            maskView.alpha = 1.0
            maskView.effect = UIBlurEffect(style: effect)
            
        } else {
            maskView.alpha = 0.0
            maskView.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        }
        
        
        self.presentingViewController.transitionCoordinator?.animate(alongsideTransition: { (context) in
            self.presentingViewController.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.maskView.alpha = 1.0
        }, completion: nil)
    }
    
    
    /// 在退出过渡即将开始的时候被调用的,(在这里把遮罩给过渡去掉)
    public override func dismissalTransitionDidEnd(_ completed: Bool) {
        
        super.dismissalTransitionDidEnd(completed)
        
        if completed {
            maskView.removeFromSuperview()
            
            UIView.animate(withDuration: config.duration, animations: {
                self.maskView.alpha = 0
                self.presentingViewController.view.transform = .identity
            }, completion: { _ in
                
                self.maskView.effect = nil
                self.maskView.removeFromSuperview()
            })
        }
    }
    
    public override func containerViewWillLayoutSubviews() {
        
        super.containerViewWillLayoutSubviews()
        
        if let c = containerView {
            maskView.frame = c.bounds
        }
    }
    
    
    /// 是否全屏
    public override var shouldPresentInFullscreen: Bool {
        return false
    }
    
    /// shouldRemovePresentersView
    public override var shouldRemovePresentersView: Bool {
        return false
    }
    
    
    /// 视图将过渡
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (context) in
            
            if let c = self.containerView {
                self.presentingViewController.view.transform = .identity
                self.presentingViewController.view.frame = c.bounds
                self.presentingViewController.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            self.presentedViewController.view.frame = self.frameOfPresentedViewInContainerView
        }) { (context) in
        }
        
    }
    
    /// dismissalTransitionWillBegin
    public override func dismissalTransitionWillBegin() {
        
        super.dismissalTransitionWillBegin()
        
        self.presentingViewController.transitionCoordinator?.animate(alongsideTransition: { (context) in
            self.presentingViewController.view.transform = .identity
        }, completion: nil)
    }
    
    
    /// 如果你不希望被呈现的 View 占据了整个屏幕，可以调整它的frame
    public override var frameOfPresentedViewInContainerView: CGRect {
        
        get {
            if let frame = containerView?.frame {
                let width = frame.width
                let height = frame.height
                let presentedSize = self.presentedViewController.preferredContentSize
                return CGRect(x: (width - presentedSize.width) / 2,
                              y: (height - presentedSize.height) / 2,
                              width: presentedSize.width,
                              height: presentedSize.height)
            } else if let f = self.presentedView?.frame {
                return f
            }
            return CGRect.zero
        } set {}
    }
}
