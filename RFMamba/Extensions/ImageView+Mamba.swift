//
//  Image+Mamba.swift
//  RFMamba
//
//  Created by roy.cao on 2018/5/17.
//  Copyright © 2018年 RFMamba. All rights reserved.
//

import Foundation
import UIKit

extension Mamba where Base: UIImageView {
    
    public func setImage(with resource: Resource,
                         placeholder: Placeholder? = nil,
                         options: MambaOptions? = nil)
    {
        
        let task = MambaManager.shared.retrieveImage(
            with: resource,
            options: options)

        self.imageTask = task
    }
    
}

private enum rf_associatedKeys {
    
    static var lastURLKey = "rf_lastURLKey"
    static var imageTaskKey = "rf_imageTaskKey"
    static var placeholderKey = "rf_placeholderKey"
}

extension Mamba where Base: UIImageView {
    
    //Bind image URL to this image view.
    public fileprivate(set) var webURL: URL?{
        get {
            return objc_getAssociatedObject(self, &rf_associatedKeys.lastURLKey) as? URL
        }
        set {
            objc_setAssociatedObject(self, &rf_associatedKeys.lastURLKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    //Bind RetrieveImageTask to this image view.
    fileprivate var imageTask: RetrieveImageTask?{
        get {
            return objc_getAssociatedObject(self, &rf_associatedKeys.imageTaskKey) as? RetrieveImageTask
        }
        set {
            objc_setAssociatedObject(self, &rf_associatedKeys.imageTaskKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    //Bind placeholder to this image view.
    public fileprivate(set) var placeholder: Placeholder? {
        get {
            return objc_getAssociatedObject(base, &rf_associatedKeys.placeholderKey) as? Placeholder
        }
        set {
            if let previousPlaceholder = placeholder {
                previousPlaceholder.remove(from: base)
            }
            
            if let newPlaceholder = newValue {
                newPlaceholder.add(to: base)
            } else {
                base.image = nil
            }
            
            objc_setAssociatedObject(base, &rf_associatedKeys.placeholderKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
}




