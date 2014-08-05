//
//  CellModel.m
//  StoryBoard
//
//  Created by 魔时网 on 14-7-31.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "CellModel.h"
#import <objc/runtime.h>
#import "GlobalConfig.h"

@implementation CellModel

- (id) initWithDictionary:(NSDictionary *)dic
{
    if (self = [super init]) {
        /**
         *  必须实现 - (void) setValue:(id)value forUndefinedKey:(NSString *)key 否则遇到没有的key就会crash
         *  如果dic中没有@property的值 则@property值为nil
         */
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

//dic中key在@property所有属性中找不到对应的属性时会调用
- (void) setValue:(id)value forUndefinedKey:(NSString *)key
{
    //如果不需要可不写内容 但是该方法不能省略
}

//使用runtime
- (id) initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
      
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
        for (i = 0; i<outCount; i++)
        {
            objc_property_t property = properties[i];
            const char* char_f =property_getName(property);
            NSString *propertyName = [NSString stringWithUTF8String:char_f];
            const char *char_a  =property_getAttributes(property);
            NSString *propertyAttribute = [NSString stringWithUTF8String:char_a];
            
            NSRange range_t = [propertyAttribute rangeOfString:@"T"];
            NSRange range_f = [propertyAttribute rangeOfString:@","];
            NSString *className = [propertyAttribute substringWithRange:NSMakeRange(range_t.location, range_f.location - range_t.location)];
            
            if ([className isEqualToString:NSStringFromClass([NSString class])]) {
                
                [self setValue:[GlobalConfig convertToString:dic[propertyName]] forKey:propertyName];
            }
            else if ([className isEqualToString:NSStringFromClass([NSNumber class])]) {
                
                [self setValue:[GlobalConfig convertToNumber:dic[propertyName]] forKey:propertyName];
            }
            else if ([className isEqualToString:NSStringFromClass([NSDictionary class])]) {
                
                [self setValue:[GlobalConfig convertToDictionary:dic[propertyName]] forKey:propertyName];
            }
            else if ([className isEqualToString:NSStringFromClass([NSString class])]) {
                
                [self setValue:[GlobalConfig convertToArray:dic[propertyName]] forKey:propertyName];
            }
            
            
            
//            id propertyValue = [self valueForKey:(NSString *)propertyName];
//            if (propertyValue) [props setObject:propertyValue forKey:propertyName];
        }

        
    }
    return  self;
}




/* 获取对象的所有属性 */
- (NSDictionary *)properties_aps
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}

/* 获取对象的所有方法 */
-(void)printMothList
{
    unsigned int mothCout_f =0;
    Method* mothList_f = class_copyMethodList([self class],&mothCout_f);
    for(int i=0;i<mothCout_f;i++)
    {
        Method temp_f = mothList_f[i];
        IMP imp_f = method_getImplementation(temp_f);
        SEL name_f = method_getName(temp_f);
        const char* name_s =sel_getName(method_getName(temp_f));
        int arguments = method_getNumberOfArguments(temp_f);
        const char* encoding =method_getTypeEncoding(temp_f);
        NSLog(@"方法名：%@,参数个数：%d,编码方式：%@",[NSString stringWithUTF8String:name_s],
              arguments,
              [NSString stringWithUTF8String:encoding]);
    }
    free(mothList_f);
}


//存放时需要对自定义的类编解码
- (id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.subTitle = [aDecoder decodeObjectForKey:@"subtitle"];
        self.tel = [aDecoder decodeObjectForKey:@"tel"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_subTitle forKey:@"subtitle"];
    [aCoder encodeObject:_tel forKey:@"tel"];
}





@end
