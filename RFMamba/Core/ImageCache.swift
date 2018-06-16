//
//  ImageCache.swift
//  RFMamba
//
//  Created by roy.cao on 2018/5/17.
//  Copyright © 2018年 RFMamba. All rights reserved.
//

import Foundation


open class ImageCache {


    
    public static let `default` = ImageCache(name: "default")


    public init(name: String){
        
        if name.isEmpty {
            fatalError("[Kingfisher] You should specify a name for the cache. A cache with empty name is not permitted.")
        }
        

    }

}
