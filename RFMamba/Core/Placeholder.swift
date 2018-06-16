//
//  Placeholder.swift
//  RFMamba
//
//  Created by roy.cao on 2018/5/17.
//  Copyright © 2018年 RFMamba. All rights reserved.
//

import UIKit

public protocol Placeholder {
    
    func add(to imageView: UIImageView)
    
    func remove(from imageView: UIImageView)
}


extension Placeholder where Self: UIImage {
    
    public func add(to imageView: UIImageView) { imageView.image = self }
    
    public func remove(from imageView: UIImageView) { imageView.image = nil }
}

extension UIImage: Placeholder {}

