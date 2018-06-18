//
//  MambaManager.swift
//  RFMamba
//
//  Created by roy.cao on 2018/5/17.
//  Copyright © 2018年 RFMamba. All rights reserved.
//

import UIKit

public final class RetrieveImageTask {
    
    public static let `default` = RetrieveImageTask()
    
}

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
    
    public func retrieveImage(with resource: Resource,
                              options: MambaOptions?) -> RetrieveImageTask
    {
        let task = RetrieveImageTask()
        let options = options ?? MambaEmptyOptions
        if options.forceRefresh {
            downloadImage(with: resource.downloadURL,
                          forKey: resource.cacheKey)
            
        }
        
        
        return task
    }
    
    func downloadImage(with url: URL,
                       forKey key: String) {
        
        
        
    }
    
    
    
    
    
}
