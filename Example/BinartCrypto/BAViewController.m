//
//  BAViewController.m
//  BinartCrypto
//
//  Created by fallending on 07/18/2020.
//  Copyright (c) 2020 fallending. All rights reserved.
//

#import "BAViewController.h"
#import <BinartCrypto/NSData+BinartAES.h>

@interface BAViewController ()

@end

@implementation BAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *filename = @"021cb6c992c35933caafc36390af05fe.json";
    NSString *iv = @"lvMqzeb5tAWgYa59";
    NSData *ivData = [NSData dataWithBytes:[iv cStringUsingEncoding:NSUTF8StringEncoding] length:iv.length];
    
    NSURL *fileurl = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
    NSData *file = [NSData dataWithContentsOfURL:fileurl];
    
    NSData *encryptData = file;
    
    NSData *decryptData = [encryptData BinartAES_CBC_DecryptWith:ivData iv:ivData];
    
    NSString *decryptStr = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", decryptStr);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
