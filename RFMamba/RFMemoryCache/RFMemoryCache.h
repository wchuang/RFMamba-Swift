//
//  RFMemoryCache.h
//  RFMamba
//
//  Created by roy.cao on 2018/6/16.
//  Copyright © 2018年 RFMamba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RFMemoryCache : NSObject

@property (nonatomic, assign) NSUInteger maxLengthForFIFO;

@property (nonatomic, assign) NSUInteger maxLengthForLRU;

@property (nonatomic, assign) NSUInteger cacheSizeLimit;

+ (instancetype)defaultCache;

- (BOOL)hasCacheWithURL:(NSString *)URL;

- (void)cacheImage:(UIImage *)image URL:(NSString *)URL;

- (UIImage * _Nullable)imageWithURL:(NSString *)URL;

- (void)clearWithURL:(NSString *)URL;

- (void)clear;

- (int64_t)cacheSize;

- (int64_t)cacheSize:(BOOL)accurate;

@end

NS_ASSUME_NONNULL_END
