//
//  LRUCache.swift
//  MemoryCache
//
//  Created by roy.cao on 2018/5/19.
//  Copyright © 2018 roy.cao. All rights reserved.
//

import Foundation

public class LRUQueue<Key: Hashable> {
    
    typealias Node = LinkedList<Key>.LinkedNode<Key>
    
    private struct CachePayload {
        let value: Any
        let node: Node
    }
    
    private let capacity: Int
    private var cache: [Key: CachePayload] = [:]
    private var list: LinkedList<Key> = LinkedList<Key>()
        
    public init(_ capacity: Int) {
        
        self.capacity = capacity
    }
    
    public func get(_ key: Key) -> Any? {
        
        guard let payload = cache[key] else {
            return nil
        }
        
        remove(key)
        insert(key, val: payload.value)
        
        return payload.value
    }
    
    public func set(_ key: Key, val: Any) {
        
        if cache[key] != nil {
            remove(key)
        } else if cache.count >= capacity, let keyToRemove = list.last?.value {
            remove(keyToRemove)
        }
        
        insert(key, val: val)
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
        cache[key] = CachePayload(value: val, node: first)
    }
    
    func clear() {
        
        cache.removeAll()
        list.removeAll()
    }
}










