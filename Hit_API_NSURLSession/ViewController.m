//
//  ViewController.m
//  Hit_API_NSURLSession
//
//  Created by SILICON on 28/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
  //  NSLog(@"%d",[Utility isInternetConnected_ShowPopupIfNotConnected:YES]);
    
    

    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}










- (IBAction)buttonActionHitAPIPostMethod:(id)sender {
    
    
     NSDictionary *mapData = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
     @"email", @"identity",
     @"amit@yopmail.com", @"email",
     @"123456", @"password",
     nil];
     
     
     
     
     [[NetworkManager sharedNetworkManager]hitAPIPOSTMethodURL:@"http://a1.fitternity.com/customerlogin" AdditionalHeaderParameters:nil parameters:mapData completionHandlerSuccess:^(NSDictionary *responseDictionary) {
     NSLog(@"%@",responseDictionary);
     } completionHandlerFailure:^(NSError *error) {
     NSLog(@"%@",error);
     }];
     
}

- (IBAction)buttonActionHitAPIGetMethod:(id)sender {
    
    //http://shagunn.info/cherishws/mobileapi/listMenus
    
    [[NetworkManager sharedNetworkManager]hitAPIGETMethodURL:@"http://shagunn.info/cherishws/mobileapi/listMenus" AdditionalHeaderParameters:nil completionHandlerSuccess:^(NSDictionary *responseDictionary) {
        NSLog(@"%@",responseDictionary);
    } completionHandlerFailure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}
@end
