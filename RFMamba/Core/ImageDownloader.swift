//
//  ImageDownloader.swift
//  RFMamba
//
//  Created by Frank on 2018/6/17.
//  Copyright © 2018年 RFMamba. All rights reserved.
//

import UIKit

public typealias ImageDownloadProgressBlock = ((_ receivedSize: Int64, _ totalSize: Int64) -> Void)

public typealias ImageDownloaderCompletionHandler = ((_ image: UIImage?, _ error: NSError?, _ url: URL?, _ originalData: Data?) -> Void)

open class ImageDownloader {
    
    open var downloadTimeout: TimeInterval = 15.0
    
    public static let `default` = ImageDownloader(name: "default")
    
    public init(name: String) {
        
        if name.isEmpty {
            fatalError("[RFMamba] You should specify a name for the cache. A cache with empty name is not permitted.")
        }
    }
}
