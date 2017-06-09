//
//  DialogConfig.swift
//  XBDialog
//
//  Created by xiaobin liu on 2017/6/7.
//  Copyright © 2017年 Sky. All rights reserved.
//

import Foundation
import UIKit


/// 弹出框配置
public class DialogConfig: NSObject  {
    
    /// 动画时间
    public var duration: TimeInterval = 0.3
    
    /// 背景手势
    public var gestureRecognizer: UIGestureRecognizer?
    
    /// 背景毛玻璃效果(如果nil的话,默认一般的)
    public var blurEffectStyle: UIBlurEffectStyle?
}
