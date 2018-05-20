//
//  FIFOCache.swift
//  MemoryCache
//
//  Created by roy.cao on 2018/5/19.
//  Copyright © 2018 roy.cao. All rights reserved.
//

import Foundation

public class FIFOCache<Key: Hashable> {
    
    typealias Node = LinkedList<Key>.LinkedNode<Key>
    
    private struct CachePayload {
        let value: Any
        var number: Int
        let node: Node
    }
    
    private let capacity: Int
    private var cache: [Key: CachePayload] = [:]
    private var list: LinkedList<Key> = LinkedList<Key>()
    
    public init(_ capacity: Int) {
        
        self.capacity = capacity
    }
    
    //true表示从FIFOCache中移除并添加到LRUCache
    public func get(_ key: Key) -> (Any?, Bool) {
        
        guard let payload = cache[key] else {
            return (nil, false)
        }
        
        cache[key]?.number += 1
        
        guard let num = cache[key]?.number, num > 1 else{
            return (payload.value, false)
        }
        
        remove(key)
        return (payload.value, true)
    }
    
    //true表示从FIFOCache中移除并添加到LRUCache
    public func set(_ key: Key, val: Any) -> Bool {
        
        guard cache[key] == nil else {
            cache[key]?.number += 1
            guard let num = cache[key]?.number, num > 1 else{
                return false
            }
            remove(key)
            return true
        }
        
        if cache.count >= capacity, let keyToRemove = list.last?.value {
            remove(keyToRemove)
        }
    
        insert(key, val: val)
        return false
    }
    
    func remove(_ key: Key) {
        
        guard let payload = cache[key] else {
            return
        }
        cache.removeValue(forKey: key)
        list.remove(node: payload.node)
    }
    
    private func insert(_ key: Key, val: Any) {
        
        list.insert(key, atIndex: 0)
        guard let first = list.first else {
            return
        }
        cache[key] = CachePayload(value: val, number: 1, node: first)
        
    }
    
    func clear() {
        
        cache.removeAll()
        list.removeAll()
    }
}







