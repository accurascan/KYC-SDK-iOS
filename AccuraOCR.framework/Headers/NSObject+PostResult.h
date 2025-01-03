//
//  NSObject+PostResult.h
//  AccuraQatar
//
//  Created by Technozer on 01/03/21.
//  Copyright © 2021 technozer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AccuraCameraWrapper.h"




@interface PostResult: NSObject <NSURLSessionDelegate>

typedef void (^SuccessBlock)(NSMutableDictionary* Response);
typedef void (^FailureBlock)(NSError* error);
typedef void (^ProgressBlock)(NSMutableDictionary*);


- (void)postMethodWithParamsAndImage1:(NSMutableDictionary *)parameters
                            forMethod:(NSString *)forMethod
                                image:(UIImage *)image
                                apikey:(NSString *)apikey
                           completion:(void (^)(NSMutableDictionary *tagText))completion
                         FailureBlock:(FailureBlock)FailureBlock;

-(void) postMethodWithParamsAndImage:(NSMutableDictionary*)parameters forMethod: (NSString*)forMethod image:(UIImage*)image completion: (SuccessBlock)completion FailureBlock: (FailureBlock)FailureBlock;

-(void) postMethodWithParamsAndImageUpload:(NSMutableDictionary*)parameters forMethod: (NSString*)forMethod image:(UIImage*)image completion: (SuccessBlock)completion FailureBlock: (FailureBlock)FailureBlock;
- (void)saveLogToFile:(NSString *)msg;
@end
