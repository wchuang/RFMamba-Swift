//
//  MambaManager.swift
//  RFMamba
//
//  Created by roy.cao on 2018/5/17.
//  Copyright © 2018 roy.cao. All rights reserved.
//

import UIKit


public class MambaManager {

    public static let shared = MambaManager()
    
    public var cache: ImageCache
    
    public var downloader: ImageDownloader


    convenience init() {
        self.init(downloader: .default, cache: .default)
    }
    
    init(downloader: ImageDownloader, cache: ImageCache) {
        self.downloader = downloader
        self.cache = cache
    }
    
    
}
