//
//  APIManager.h
//  Hit_API_NSURLSession
//
//  Created by SILICON on 28/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utility.h"


@interface NetworkManager : NSObject<NSURLSessionDelegate>

+ (NetworkManager *)sharedNetworkManager;

- (void)hitAPIPOSTMethodURL:(NSString *)stringURL AdditionalHeaderParameters:(NSDictionary *)dictionaryAdditionalHeaderParameters parameters:(NSDictionary *)dictionaryParameters completionHandlerSuccess:(void (^)(NSDictionary *responseDictionary))success completionHandlerFailure:(void (^)(NSError *error))failure;

- (void)hitAPIGETMethodURL:(NSString *)stringURL AdditionalHeaderParameters:(NSDictionary *)dictionaryAdditionalHeaderParameters completionHandlerSuccess:(void (^)(NSDictionary *responseDictionary))success completionHandlerFailure:(void (^)(NSError *error))failure;

@end
