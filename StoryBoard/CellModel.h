//
//  CellModel.h
//  StoryBoard
//
//  Created by 魔时网 on 14-7-31.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject

@property (nonatomic ,strong) NSString *title;
@property (nonatomic ,strong) NSNumber *subTitle;
@property (nonatomic ,assign) NSArray *tel;

//- (CellModel *) cellModelWithDictionary:(NSDictionary *)dic;
- (id) initWithDictionary:(NSDictionary *)dic;

- (id) initWithDic:(NSDictionary *)dic;
@end
