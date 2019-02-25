//
//  IRBVideoTypeFilePreviewView.m
//  IRBSandbox
//
//  Created by irobbin on 2019/2/25.
//

#import "IRBVideoTypeFilePreviewView.h"
#import "IRBSandboxItem.h"
@import AVKit;

@implementation IRBVideoTypeFilePreviewView

@synthesize fatherViewController = _fatherViewController;


- (void)setupWithItem:(IRBSandboxItem *)item {
    AVPlayerViewController * playerViewController = [AVPlayerViewController new];
    
    AVPlayer * player = [AVPlayer playerWithURL:[NSURL fileURLWithPath:item.path]];
    playerViewController.player = player;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.fatherViewController presentViewController:playerViewController animated:YES completion:nil];
        [playerViewController.player play];
    });
}

@end
