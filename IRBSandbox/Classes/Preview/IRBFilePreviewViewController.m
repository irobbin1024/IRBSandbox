//
//  IRBFilePreviewViewController.m
//  IRBSandbox
//
//  Created by irobbin on 2019/2/16.
//

#import "IRBFilePreviewViewController.h"
#import "IRBFilePreviewFactory.h"
#import "IRBSandboxItem.h"
#import "IRBUnknowFileTypeOpenHelper.h"
#import "IRBShowFolderViewController.h"
#import "IRBFileSystemHelper.h"

@interface IRBFilePreviewViewController ()

@property (nonatomic, strong) UIView<IRBFilePreviewProtocol> * previewView;

@end

@implementation IRBFilePreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.previewView = [IRBFilePreviewFactory previewWithItem:self.item forceFileType:self.forceFileType];
    if ([self.previewView respondsToSelector:@selector(setFatherViewController:)]) {
        self.previewView.fatherViewController = self;
    }
    self.previewView.frame = self.view.bounds;
    [self.view addSubview:self.previewView];
    
    self.title = self.item.name;
    
    // setup right button
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(rightButtonAction:)];
    
    UIBarButtonItem * deleteButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteButtonAction:)];
    self.navigationItem.rightBarButtonItems = @[rightButton, deleteButton];
}

#pragma mark - Action

- (IBAction)rightButtonAction:(id)sender {
    NSArray<UIAlertAction *> * additionAction = nil;
    if ([self.previewView respondsToSelector:@selector(additionActions)]) {
        additionAction = [self.previewView additionActions];
    }
    [IRBUnknowFileTypeOpenHelper showUnknowFileTypeOpenMenuWithItem:self.item
                                                     viewController:self
                                                     additionAction:additionAction];
}

- (IBAction)deleteButtonAction:(id)sender {
    [IRBFileSystemHelper deleteFileWithItem:self.item viewController:self];
}

@end
