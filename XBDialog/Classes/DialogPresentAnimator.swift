//
//  DialogPresentAnimator.swift
//  XBDialog
//
//  Created by xiaobin liu on 2017/6/7.
//  Copyright © 2017年 Sky. All rights reserved.
//

import Foundation
import UIKit


/// UIViewControllerTransitioningDelegate
public class DialogPresentAnimator: NSObject, UIViewControllerTransitioningDelegate {
    
    /// 基类
    unowned let base: UIViewController
    
    /// 配置
    private var config: DialogConfig?
    
    /// 自定义初始化
    public init(_ base: UIViewController) {
        self.base = base
        super.init()
        base.modalPresentationStyle = .custom
        base.transitioningDelegate = self
    }
    
    
    /// 弹出框设置
    public func dialog(setting: (_ config: DialogConfig) -> Void) {
        config = DialogConfig()
        setting(self.config!)
    }
    
    
    /// 隐藏
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DialogTransition(config: self.config!, isPresent: false)
    }
    
    /// 显示
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DialogTransition(config: self.config!, isPresent: true)
    }
    
    
    /// presentationController
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        return DialogPresentationController(presentedViewController: presented, presenting: presenting, config: self.config!)
        
    }
    
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
}
