//
//  IRBImagePreview.m
//  IRBSandbox
//
//  Created by irobbin on 2019/2/24.
//

#import "IRBImageTypeFilePreviewView.h"
#import "IRBSandboxItem.h"

@interface IRBImageTypeFilePreviewView ()

@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation IRBImageTypeFilePreviewView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.imageView];
    }
    
    return self;
}

- (void)setupWithItem:(IRBSandboxItem *)item {
    
    UIImage * image = [UIImage imageWithContentsOfFile:item.path];
    self.imageView.image = image;
}

@end
