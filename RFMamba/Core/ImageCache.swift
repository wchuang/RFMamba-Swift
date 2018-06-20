//
//  ImageCache.swift
//  RFMamba
//
//  Created by roy.cao on 2018/5/17.
//  Copyright © 2018年 RFMamba. All rights reserved.
//

import Foundation

/**
 Cache type of a cached image.
 
 - None:   The image is not cached yet when retrieving it.
 - Memory: The image is cached in memory.
 - Disk:   The image is cached in disk.
 - Mmap:   The image is cached in disk.
 */
public enum CacheType {
    case none, memory, disk, mmap
    
    public var cached: Bool {
        switch self {
        case .memory, .disk, .mmap: return true
        case .none: return false
        }
    }
}

open class ImageCache {
    
    //Memory
    fileprivate let memoryCache = RFMemoryCache.default()

    public static let `default` = ImageCache(name: "default")

    public init(name: String){
        
        if name.isEmpty {
            fatalError("[RFMamba] You should specify a name for the cache. A cache with empty name is not permitted.")
        }
        

    }

}
