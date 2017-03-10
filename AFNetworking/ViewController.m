//
//  ViewController.m
//  AFNetworking
//
//  Created by Nagam Pawan on 3/10/17.
//  Copyright © 2017 Nagam Pawan. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <AFURLSessionManager.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getSession:@"http://api.wunderground.com/api/8492f44733b86cc1/forecast/conditions/geolookup/q/autoip/vijayawada.json"];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getSession:(NSString *)url{
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.wunderground.com/api/8492f44733b86cc1/forecast/conditions/geolookup/q/autoip/vijayawada.json"]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"Json : %@", responseObject);
        NSDictionary *json = (NSDictionary *)responseObject;
        NSArray *conditions = [[[[json valueForKey:@"forecast"] valueForKey:@"simpleforecast"] valueForKey:@"forecastday"] valueForKey:@"conditions"];
        NSLog(@"Conditions are :%@", conditions);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Network Not found" message:@"Please connect to the internet and try again" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
    }];
    

    
}

@end
