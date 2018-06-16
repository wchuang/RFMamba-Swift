//
//  ImageDownloader.swift
//  RFMamba
//
//  Created by roy.cao on 2018/5/17.
//  Copyright © 2018年 RFMamba. All rights reserved.
//

import UIKit



public typealias ImageDownloadProgressBlock = ((_ receivedSize: Int64, _ totalSize: Int64) -> Void)

public typealias ImageDownloaderCompletionHandler = ((_ image: UIImage?, _ error: NSError?, _ url: URL?, _ originalData: Data?) -> Void)

/// `ImageDownloader` represents a downloading manager for requesting the image with a URL from server.
open class ImageDownloader {

    
    public static let `default` = ImageDownloader(name: "default")
    
    
    public init(name: String){
        
        if name.isEmpty {
            fatalError("[Kingfisher] You should specify a name for the cache. A cache with empty name is not permitted.")
        }
        
        
    }
    
}
