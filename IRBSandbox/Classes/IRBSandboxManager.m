//
//  IRBSandboxManager.m
//  IRBSandbox
//
//  Created by robbin on 2019/2/14.
//

#import "IRBSandboxManager.h"
#import "IRBShowFolderViewController.h"

@interface IRBSandboxManager()

@property (nonatomic, strong) UIWindow * containerWindow;

@end

@implementation IRBSandboxManager

#pragma mark - Public

+ (instancetype)sharedInstance {
    static IRBSandboxManager *staticInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        staticInstance = [[IRBSandboxManager alloc] init];
    });
    return staticInstance;
}

- (void)enable {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UISwipeGestureRecognizer * swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureAction:)];
        swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
        [[UIApplication sharedApplication].keyWindow addGestureRecognizer:swipeGesture];
    });
}


- (void)hide {
    self.containerWindow.hidden = YES;
}

- (void)show {
    if (self.containerWindow == nil) {
        self.containerWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.containerWindow.windowLevel = UIWindowLevelStatusBar - 1;
        
        IRBShowFolderViewController * rootFolderController = [IRBShowFolderViewController new];
        rootFolderController.rootFolderURL = NSHomeDirectory();
        
        UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:rootFolderController];
        self.containerWindow.rootViewController = navigationController;
    }
    
    self.containerWindow.hidden = NO;
}

#pragma mark - Actions

- (void)swipeGestureAction:(UISwipeGestureRecognizer *)gesture {
    [self show];
}



@end
