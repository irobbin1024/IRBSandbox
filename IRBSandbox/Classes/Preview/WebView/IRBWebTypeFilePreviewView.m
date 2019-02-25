//
//  IRBWebTypeFilePreviewView.m
//  IRBSandbox
//
//  Created by irobbin on 2019/2/25.
//

#import "IRBWebTypeFilePreviewView.h"
#import "IRBSandboxItem.h"

@interface IRBWebTypeFilePreviewView()

@property (nonatomic, strong) UIWebView * webView;

@end

@implementation IRBWebTypeFilePreviewView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.webView = [[UIWebView alloc] initWithFrame:self.bounds];
        self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.webView];
    }
    
    return self;
}

- (void)setupWithItem:(IRBSandboxItem *)item {
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:item.path]];
    [self.webView loadRequest:request];
}


@end
