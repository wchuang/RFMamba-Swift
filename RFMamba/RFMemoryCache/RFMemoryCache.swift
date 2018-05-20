//
//  MemoryCache.swift
//  MemoryCache
//
//  Created by roy.cao on 2018/5/19.
//  Copyright © 2018 roy.cao. All rights reserved.
//

import Foundation

public class RFMemoryCache<Key: Hashable> {
    
    
    private let FIFOQueue : FIFOCache<Key>
    private let LRUQueue : LRUCache<Key>
    private let semaphore = DispatchSemaphore(value: 1)
    
    public init(_ fC: Int = 400, lC: Int = 400) {
        
        FIFOQueue = FIFOCache<Key>(fC)
        LRUQueue = LRUCache<Key>(lC)
        NotificationCenter.default.addObserver(
            self, selector: #selector(clearMemoryCache), name: .UIApplicationDidReceiveMemoryWarning, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public func get(_ key: Key) -> Any? {
        
        semaphore.wait()
        let FIFOResult = FIFOQueue.get(key)
        let LRUResult = LRUQueue.get(key)
        
        if FIFOResult.1 == true {
            LRUQueue.set(key, val: FIFOResult.0 as Any)
        }
        semaphore.signal()
        return LRUResult == nil ? FIFOResult.0 : LRUResult
        
    }
    
    public func set(_ key: Key, val: Any) {
        
        semaphore.wait()
        let result = FIFOQueue.set(key, val: val)
        if result == true {
            LRUQueue.set(key, val: val)
        }
        semaphore.signal()
    }
    
    func remove(_ key: Key) {
        
        semaphore.wait()
        FIFOQueue.remove(key)
        LRUQueue.remove(key)
        semaphore.signal()
    }
    
    @objc func clearMemoryCache() {
        
        semaphore.wait()
        FIFOQueue.clear()
        LRUQueue.clear()
        semaphore.signal()
    }
}


