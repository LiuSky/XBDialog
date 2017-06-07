//
//  DialogTransition.swift
//  XBDialog
//
//  Created by xiaobin liu on 2017/6/7.
//  Copyright © 2017年 Sky. All rights reserved.
//

import Foundation
import UIKit

/// 自定义对话框专场动画
public class DialogTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    /// 是否是pre
    var isPresent = true
    
    internal var config: DialogConfig!
    
    /// 初始化
    convenience init(config: DialogConfig , isPresent: Bool) {
        self.init()
        self.config = config
        self.isPresent = isPresent
    }
    
    
    
    /// 转场时间
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return config.duration
    }
    
    
    /// 动画
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView
        
        if self.isPresent {
            
            let toVC = transitionContext.viewController(forKey: .to)!
            let finalFrame = transitionContext.finalFrame(for: toVC)
            toVC.view.frame = finalFrame
            toVC.view.transform = CGAffineTransform.init(scaleX: 0.00001, y: 0.0001)
            container.addSubview(toVC.view)
            
            UIView.animate(withDuration: config.duration, animations: {
                toVC.view.transform = .identity
            }, completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
            
        } else {
            let fromView = transitionContext.viewController(forKey: .from)!
            
            UIView.animate(withDuration: config.duration, animations: {
                fromView.view.transform = CGAffineTransform.init(scaleX: 0.00001, y: 0.0001)
            }, completion: { _ in
                fromView.view.transform = .identity
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        }
    }
}
