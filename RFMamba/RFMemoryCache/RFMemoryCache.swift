//
//  MemoryCache.swift
//  MemoryCache
//
//  Created by roy.cao on 2018/5/19.
//  Copyright © 2018 roy.cao. All rights reserved.
//

import Foundation

public class RFMemoryCache<Key: Hashable> {
    
    
    private let fifoQueue : FIFOQueue<Key>
    private let lruQueue : LRUQueue<Key>
    private let semaphore = DispatchSemaphore(value: 1)
    
    public init(_ fC: Int = 400, lC: Int = 400) {
        
        fifoQueue = FIFOQueue<Key>(fC)
        lruQueue = LRUQueue<Key>(lC)
        NotificationCenter.default.addObserver(
            self, selector: #selector(clearMemoryCache), name: .UIApplicationDidReceiveMemoryWarning, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public func get(_ key: Key) -> Any? {
        
        semaphore.wait()
        let fifoResult = fifoQueue.get(key)
        let lruResult = lruQueue.get(key)
        
        if fifoResult.1 == true {
            lruQueue.set(key, val: fifoResult.0 as Any)
        }
        semaphore.signal()
        return lruResult == nil ? fifoResult.0 : lruResult
        
    }
    
    public func set(_ key: Key, val: Any) {
        
        semaphore.wait()
        let result = fifoQueue.set(key, val: val)
        if result == true {
            lruQueue.set(key, val: val)
        }
        semaphore.signal()
    }
    
    func remove(_ key: Key) {
        
        semaphore.wait()
        fifoQueue.remove(key)
        lruQueue.remove(key)
        semaphore.signal()
    }
    
    @objc func clearMemoryCache() {
        
        semaphore.wait()
        fifoQueue.clear()
        lruQueue.clear()
        semaphore.signal()
    }
}


