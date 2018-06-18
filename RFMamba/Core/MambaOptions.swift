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
    
    case retryFailed

    case downloadPriority(Float)
    
    case forceRefresh
    
    case fromMemoryCacheOrRefresh
    
    case forceTransition
    
    case cacheMemoryOnly
    
    case onlyFromCache
    
    case backgroundDecode
    
    case callbackDispatchQueue(DispatchQueue?)
    
    case scaleFactor(CGFloat)
    
    case cacheOriginalImage
}

precedencegroup ItemComparisonPrecedence {
    associativity: none
    higherThan: LogicalConjunctionPrecedence
}

infix operator <== : ItemComparisonPrecedence

func <== (lhs: MambaOption, rhs: MambaOption) -> Bool {
    switch (lhs, rhs) {
    case (.downloadPriority(_), .downloadPriority(_)): return true
    case (.forceRefresh, .forceRefresh): return true
    case (.fromMemoryCacheOrRefresh, .fromMemoryCacheOrRefresh): return true
    case (.forceTransition, .forceTransition): return true
    case (.cacheMemoryOnly, .cacheMemoryOnly): return true
    case (.onlyFromCache, .onlyFromCache): return true
    case (.backgroundDecode, .backgroundDecode): return true
    case (.callbackDispatchQueue(_), .callbackDispatchQueue(_)): return true
    case (.scaleFactor(_), .scaleFactor(_)): return true
    case (.cacheOriginalImage, .cacheOriginalImage): return true
    default: return false
    }
}


public extension Collection where Iterator.Element == MambaOption {
    
    public var retryFailed: Bool {
        return contains{ $0 <== .retryFailed }
    }

    public var forceRefresh: Bool {
        return contains{ $0 <== .forceRefresh }
    }
    
    public var backgroundDecode: Bool {
        return contains{ $0 <== .backgroundDecode }
    }

}
































