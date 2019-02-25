//
//  IRBTextTypeFilePreviewView.m
//  IRBSandbox
//
//  Created by irobbin on 2019/2/16.
//

#import "IRBTextTypeFilePreviewView.h"
#import "IRBSandboxItem.h"

@interface IRBTextTypeFilePreviewView ()

@property (nonatomic, strong) UITextView * textView;
@property (nonatomic, strong) IRBSandboxItem * item;

@end

@implementation IRBTextTypeFilePreviewView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textView = [[UITextView alloc] initWithFrame:self.bounds];
        self.textView.editable = NO;
        self.textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.textView];
    }
 
    return self;
}

- (void)setupWithItem:(IRBSandboxItem *)item {
    
    self.item = item;
    
    NSStringEncoding encoding = NSUTF8StringEncoding;
    if ([IRBSandboxItem subTypeWithFilePath:item.path] != IRBSandboxItemSubtypeText) {
        encoding = NSASCIIStringEncoding;
    }
    
    [self openWithUncoding:encoding];
}

- (void)openWithUncoding:(NSStringEncoding)encoding {
    NSData * data = [NSData dataWithContentsOfFile:self.item.path];
    NSString * string = [[NSString alloc] initWithData:data encoding:encoding];
    
    self.textView.text = string;
}

- (NSArray<UIAlertAction *> *)additionActions {
    UIAlertAction * utf8Action = [UIAlertAction actionWithTitle:@"用UTF8编码" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self openWithUncoding:NSUTF8StringEncoding];
        
    }];
    
    UIAlertAction * acsiiAction = [UIAlertAction actionWithTitle:@"用ASCII编码" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self openWithUncoding:NSASCIIStringEncoding];
        
    }];
    
    return @[utf8Action, acsiiAction];
}

@end
