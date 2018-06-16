//
//  Resource.swift
//  RFMamba
//
//  Created by roy.cao on 2018/5/17.
//  Copyright © 2018年 RFMamba. All rights reserved.
//

import Foundation

public enum RFError: Error {

    case invalidURL(url: URLConvertible)
}

public protocol URLConvertible {
    
    func asURL() throws -> URL
}


extension String: URLConvertible {
    /// Returns a URL if `self` represents a valid URL string that conforms to RFC 2396 or throws an `AFError`.
    ///
    /// - throws: An `AFError.invalidURL` if `self` is not a valid URL string.
    ///
    /// - returns: A URL or throws an `AFError`.
    public func asURL() throws -> URL {
        guard let url = URL(string: self) else { throw RFError.invalidURL(url: self)}
        return url
    }
}

extension URL: URLConvertible {
    /// Returns self.
    public func asURL() throws -> URL { return self }
}

public protocol Resource {
    
    var cacheKey: String { get }
    
    var downloadURL: URL { get }

}

public struct ImageResource: Resource {
    /// The key used in cache.
    public let cacheKey: String
    
    /// The target image URL.
    public let downloadURL: URL
    
    /**
     Create a resource.
     
     - parameter downloadURL: The target image URL.
     - parameter cacheKey:    The cache key. If `nil`, Kingfisher will use the `absoluteString` of `downloadURL` as the key.
     
     - returns: A resource.
     */
    public init(downloadURL: URLConvertible, cacheKey: String? = nil) throws {
        let url = try downloadURL.asURL()
        self.downloadURL = url
        self.cacheKey = cacheKey ?? url.absoluteString
    }
}






























