//
//  GlobalConfig.m
//  StoryBoard
//
//  Created by 魔时网 on 14-7-31.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "GlobalConfig.h"

@implementation GlobalConfig

//数据优化
+ (NSString *) convertToString:(id)str
{
    if (![GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:str]) {
        return @"";
    }
    return (NSString *)str;
}

+ (NSString *) convertToString:(NSString *)str withObject:(id)obj
{
    if (![GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:str]) {
        return str;
    }
    return (NSString *)obj;
}

+ (NSArray *) convertToArray:(id)array
{
    if (![GlobalConfig isKindOfNSArrayClassAndCountGreaterThanZero:array]) {
        return @[];
    }
    return array;
}
+ (NSDictionary *) convertToDictionary:(id)dic
{
    if (![GlobalConfig isKindOfNSDictionaryClassAndCountGreaterThanZero:dic]) {
        return @{};
    }
    return dic;
}

+ (NSNumber *) convertToNumber:(id)num
{
    if ([num isKindOfClass:[NSNumber class]]) {
        return num;
    }
    return [[NSNumber alloc] initWithBool:NO];
}

//判断是否是字符串并且长度大于零
+ (BOOL) isKindOfNSStringClassAndLenthGreaterThanZero:(NSString *)string
{
    return ([string isKindOfClass:[NSString class]] && string.length > 0);
}
//判断是否是数组并且数量大于零
+ (BOOL) isKindOfNSArrayClassAndCountGreaterThanZero:(NSArray *)array
{
    return ([array isKindOfClass:[NSArray class]] && array.count > 0);
}
//判断是否是字典并且数量大于零
+ (BOOL) isKindOfNSDictionaryClassAndCountGreaterThanZero:(NSDictionary *)dic
{
    return ([dic isKindOfClass:[NSDictionary class]] && dic.count > 0);
}



@end
