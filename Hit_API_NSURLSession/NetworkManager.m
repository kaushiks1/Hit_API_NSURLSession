//
//  APIManager.m
//  Hit_API_NSURLSession
//
//  Created by SILICON on 28/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

+ (NetworkManager *)sharedNetworkManager
{
    
    static NetworkManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NetworkManager alloc]init];
    });
    return sharedInstance;
    
    //    static NetworkManager *sharedNetworkManager = nil;
    //    static dispatch_once_t oncePredicate;
    //    dispatch_once(&oncePredicate, ^{
    //
    //        sharedNetworkManager = [[self alloc]initWithBaseURL:[NSURL URLWithString:SERVER_URL]];
    //        [sharedNetworkManager setupServerConnection];
    //        [sharedNetworkManager.reachabilityManager startMonitoring];
    //
    //    });
    //
    //    return sharedNetworkManager;
    
}




- (void)hitAPIPOSTMethodURL:(NSString *)stringURL AdditionalHeaderParameters:(NSDictionary *)dictionaryAdditionalHeaderParameters parameters:(NSDictionary *)dictionaryParameters completionHandlerSuccess:(void (^)(NSDictionary *responseDictionary))success completionHandlerFailure:(void (^)(NSError *error))failure
{
    if ([Utility isInternetConnected_ShowPopupIfNotConnected:YES])
    {
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.HTTPAdditionalHeaders = dictionaryAdditionalHeaderParameters;
        NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        NSURL *url = [NSURL URLWithString:stringURL];
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url
                                                                  cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                              timeoutInterval:60.0];
        
        //        [urlRequest addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        //        [urlRequest addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [urlRequest setHTTPMethod:@"POST"];
        
        /*
         NSString *stringPost = [dictionaryParameters urlEncodedString];
         NSData *dataPost = [stringPost dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
         NSString *stringPostLength = [NSString stringWithFormat:@"%lu",(unsigned long)[dataPost length]];
         [urlRequest setValue:stringPostLength forHTTPHeaderField:@"Content-Length"];
         //        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
         [urlRequest setValue:@"application/form-data" forHTTPHeaderField:@"Content-Text"];
         [urlRequest setHTTPBody:dataPost];
         */
        
        //        for Body - raw - Json(application/json)
        NSError *error;
        NSData *dataPost = [NSJSONSerialization dataWithJSONObject:dictionaryParameters options:0 error:&error];
        [urlRequest setHTTPBody:dataPost];
        
        
        NSURLSessionDataTask *urlSessionDataTask = [urlSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (error == nil)
            {
                NSDictionary * dictionaryJson  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                success(dictionaryJson);
            }
            else
            {
                failure(error);
            }
        }];
        [urlSessionDataTask resume];
    }
}



- (void)hitAPIGETMethodURL:(NSString *)stringURL AdditionalHeaderParameters:(NSDictionary *)dictionaryAdditionalHeaderParameters completionHandlerSuccess:(void (^)(NSDictionary *responseDictionary))success completionHandlerFailure:(void (^)(NSError *error))failure
{
    if ([Utility isInternetConnected_ShowPopupIfNotConnected:YES])
    {
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.HTTPAdditionalHeaders = dictionaryAdditionalHeaderParameters;
        NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        NSURL *url = [NSURL URLWithString:stringURL];
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url
                                                                  cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                              timeoutInterval:60.0];
        
        //        [urlRequest addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        //        [urlRequest addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [urlRequest setHTTPMethod:@"GET"];
        NSURLSessionDataTask *urlSessionDataTask = [urlSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (error == nil)
            {
                NSDictionary * dictionaryJson  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                success(dictionaryJson);
            }
            else
            {
                failure(error);
            }
        }];
        [urlSessionDataTask resume];
    }
}






@end
