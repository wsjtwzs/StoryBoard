//
//  GlobalConfig.h
//  StoryBoard
//
//  Created by 魔时网 on 14-7-31.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalConfig : NSObject

#pragma mark - 常用类处理 -
/**
 *  转化为字符串 （处理json NULL情况）
 *
 *  @param str object
 *
 *  @return 传入NULL ->@“” 或原字符串
 */
+ (NSString *) convertToString:(id)str;

+ (NSString *) convertToString:(NSString *)str withObject:(id)obj;

/**
 *  转化为数组 （处理json NULL情况）
 *
 *  @param array object
 *
 *  @return 传入NULL ->@【】或原数组
 */
+ (NSArray *) convertToArray:(id)array;

/**
 *  转化为字典 （处理json NULL情况）
 *
 *  @param dic object
 *
 *  @return 传入NULL->@{} 或原字典
 */
+ (NSDictionary *) convertToDictionary:(id)dic;

/**
 *  转化为Number（处理json NULL情况）
 *
 *  @param num object
 *
 *  @return 传入NULL ->@NO 或传入的原值
 */
+ (NSNumber *) convertToNumber:(id)num;

/**
 *  判断是否是字符串并且长度大于零
 *
 *  @param string
 *
 *  @return yes or no
 */
+ (BOOL) isKindOfNSStringClassAndLenthGreaterThanZero:(NSString *)string;
/**
 *  判断是否是数组并且数量大于零
 *
 *  @param array
 *
 *  @return yes or no
 */
+ (BOOL) isKindOfNSArrayClassAndCountGreaterThanZero:(NSArray *)array;
/**
 *  判断是否是字典并且数量大于零
 *
 *  @param dic
 *
 *  @return yes or no
 */
+ (BOOL) isKindOfNSDictionaryClassAndCountGreaterThanZero:(NSDictionary *)dic;


@end
