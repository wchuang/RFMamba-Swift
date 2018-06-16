//
//  MambaManager.swift
//  RFMamba
//
//  Created by roy.cao on 2018/5/17.
//  Copyright © 2018年 RFMamba. All rights reserved.
//

import UIKit

public class MambaManager {

    public static let shared = MambaManager()
    
    // Cache used by this manager
    public var cache: ImageCache
    
    // Downloader used by this manager
    public var downloader: ImageDownloader


    convenience init() {
        self.init(downloader: .default, cache: .default)
    }
    
    init(downloader: ImageDownloader, cache: ImageCache) {
        self.downloader = downloader
        self.cache = cache
    }
    
    
}
