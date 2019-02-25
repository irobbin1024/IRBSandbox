//
//  IRBViewController.m
//  IRBSandbox
//
//  Created by robbin on 02/14/2019.
//  Copyright (c) 2019 robbin. All rights reserved.
//

#import "IRBViewController.h"
#import "IRBSandboxManager.h"

@interface IRBViewController ()



@end

@implementation IRBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIButton * showButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [showButton setTitle:@"Show" forState:UIControlStateNormal];
    [showButton sizeToFit];
    showButton.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
    [showButton addTarget:self action:@selector(showButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:showButton];
    
    UILabel * infoLabel = [UILabel new];
    infoLabel.font = [UIFont systemFontOfSize:14];
    infoLabel.text = @"示例目录在 tmp/messFolder/ 下面\n长按可以发送 Airdrop 或者删除";
    infoLabel.numberOfLines = 0;
    [infoLabel sizeToFit];
    infoLabel.textColor = [UIColor lightGrayColor];
    infoLabel.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5 + 30);
    [self.view addSubview:infoLabel];
    
    
    NSError * error;
    NSString * messFolder = [NSTemporaryDirectory() stringByAppendingPathComponent:@"messFolder"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:messFolder] == NO) {
        [[NSFileManager defaultManager] createDirectoryAtPath:messFolder withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    
    NSString * ooggPath = [[NSBundle mainBundle] pathForResource:@"og" ofType:@"oogg"];
    [[NSFileManager defaultManager] copyItemAtPath:ooggPath toPath:[messFolder stringByAppendingPathComponent:@"og.oogg"] error:&error];
    
    NSString * txtPath = [[NSBundle mainBundle] pathForResource:@"hello" ofType:@"txt"];
    [[NSFileManager defaultManager] copyItemAtPath:txtPath toPath:[messFolder stringByAppendingPathComponent:@"hello.txt"] error:&error];
    
    NSString * imagePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"];
    [[NSFileManager defaultManager] copyItemAtPath:imagePath toPath:[messFolder stringByAppendingPathComponent:@"1.jpg"] error:&error];
    
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"a" ofType:@"html"];
    [[NSFileManager defaultManager] copyItemAtPath:htmlPath toPath:[messFolder stringByAppendingPathComponent:@"a.html"] error:&error];
    
    NSString * videoPath = [[NSBundle mainBundle] pathForResource:@"996" ofType:@"MP4"];
    [[NSFileManager defaultManager] copyItemAtPath:videoPath toPath:[messFolder stringByAppendingPathComponent:@"996.MP4"] error:&error];
    
    NSString * audioPath = [[NSBundle mainBundle] pathForResource:@"Crisis" ofType:@"mp3"];
    [[NSFileManager defaultManager] copyItemAtPath:audioPath toPath:[messFolder stringByAppendingPathComponent:@"Crisis.mp3"] error:&error];
}

- (IBAction)showButtonAction:(id)sender {
    [[IRBSandboxManager sharedInstance] show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
