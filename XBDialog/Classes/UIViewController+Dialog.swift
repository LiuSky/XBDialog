//
//  UIViewController+Dialog.swift
//  XBDialog
//
//  Created by xiaobin liu on 2017/6/7.
//  Copyright © 2017年 Sky. All rights reserved.
//

import Foundation
import UIKit


public protocol NamespaceWrappable {
    associatedtype WrapperType
    var xb: WrapperType { get }
    static var xb: WrapperType.Type { get }
}

public extension NamespaceWrappable {
    var xb: NamespaceWrapper<Self> {
        return NamespaceWrapper(value: self)
    }
    
    static var xb: NamespaceWrapper<Self>.Type {
        return NamespaceWrapper.self
    }
}

public protocol TypeWrapperProtocol {
    associatedtype WrappedType
    var wrappedValue: WrappedType { get }
    init(value: WrappedType)
}

public struct NamespaceWrapper<T>: TypeWrapperProtocol {
    public let wrappedValue: T
    public init(value: T) {
        self.wrappedValue = value
    }
}

extension UIViewController: NamespaceWrappable {}
fileprivate var presentKey = "com.mike.Dialog.PresentKey"
public extension TypeWrapperProtocol where WrappedType: UIViewController {
    
    var present: DialogPresentAnimator {
        
        if let v = objc_getAssociatedObject(self.wrappedValue, &presentKey) {
            return v as! DialogPresentAnimator
        }
        let m = DialogPresentAnimator(self.wrappedValue)
        objc_setAssociatedObject(self.wrappedValue, &presentKey, m, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return m
    }
}
