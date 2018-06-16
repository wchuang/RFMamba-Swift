//
//  MambaOptions.swift
//  RFMamba
//
//  Created by roy.cao on 2018/5/17.
//  Copyright © 2018年 RFMamba. All rights reserved.
//

import UIKit


public typealias MambaOptions = [MambaOption]
let MambaEmptyOptions = [MambaOption]()


public enum MambaOption{
    

    case downloadPriority(Float)
    
    case forceRefresh
    
    case fromMemoryCacheOrRefresh
    
    case forceTransition
    
    case cacheMemoryOnly
    
    case onlyFromCache
    
    case backgroundDecode
    
    case callbackDispatchQueue(DispatchQueue?)
    
    case scaleFactor(CGFloat)
    
    case preloadAllAnimationData
    
    case keepCurrentImageWhileLoading
    
    case onlyLoadFirstFrame
    
    case cacheOriginalImage
}




