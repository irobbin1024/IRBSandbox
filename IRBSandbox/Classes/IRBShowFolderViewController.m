//
//  IRBShowFolderViewController.m
//  IRBSandbox
//
//  Created by robbin on 2019/2/14.
//

#import "IRBShowFolderViewController.h"
#import "IRBSandboxManager.h"
#import "IRBSandboxItem.h"
#import "IRBShowFolderTableViewCell.h"
#import "IRBFilePreviewViewController.h"
#import "IRBAirdropHelper.h"
#import "IRBUnknowFileTypeOpenHelper.h"
#import "IRBFileSystemHelper.h"

@interface IRBShowFolderViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<IRBSandboxItem *> * datasource;

@end

@implementation IRBShowFolderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[IRBShowFolderTableViewCell class] forCellReuseIdentifier:kIRBShowFolderTableViewCellIdentifier];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(hideSandbox:)];
    
    [self loadDatasource];
    
    [self.tableView reloadData];
    
}

- (void)loadDatasource {
    
    IRBSandboxItem * previousSandboxItem = [IRBSandboxItem new];
    previousSandboxItem.name = @"...";
    previousSandboxItem.type = IRBSandboxItemPreviousFolder;
    
    self.datasource = [NSMutableArray arrayWithCapacity:10];
    [self.datasource addObject:previousSandboxItem];
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSArray<NSString *> * fileList = [fileManager contentsOfDirectoryAtPath:self.rootFolderURL error:NULL];
    for (NSString * item in fileList) {
        
        if ([[item lastPathComponent] hasPrefix:@"."]) {
            continue;
        }
        
        NSString* fullPath = [self.rootFolderURL stringByAppendingPathComponent:item];
        
        BOOL isFolder = NO;
        [fileManager fileExistsAtPath:fullPath isDirectory:&isFolder];
        
        IRBSandboxItem * sandboxItem = [IRBSandboxItem new];
        sandboxItem.name = [NSString stringWithFormat:@"%@ %@", isFolder ? @"📁" : @"📃", item];
        sandboxItem.fileName = item;
        sandboxItem.type = isFolder ? IRBSandboxItemFolder : IRBSandboxItemFile;
        sandboxItem.subtype = [IRBSandboxItem subTypeWithFilePath:item];
        sandboxItem.path = fullPath;
        [self.datasource addObject:sandboxItem];
    }
}

- (void)hideSandbox:(id)sender {
    [[IRBSandboxManager sharedInstance] hide];
}

#pragma mark - Funs

- (void)refreshData {
    [self loadDatasource];
    [self.tableView reloadData];
}

- (void)deleteItem:(IRBSandboxItem *)item {
    [IRBFileSystemHelper deleteFileWithItem:item viewController:self];
}

- (void)airdropItem:(IRBSandboxItem *)item {
    [IRBAirdropHelper airdropWithPath:item viewController:self];
}

- (void)showUnknowFileTypeOpenMenuWithItem:(IRBSandboxItem *)item {
    [IRBUnknowFileTypeOpenHelper showUnknowFileTypeOpenMenuWithItem:item
                                                     viewController:self
                                                     additionAction:nil];
}

- (void)showActionMenuWithItem:(IRBSandboxItem *)item {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"选项" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self deleteItem:item];
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"AirDrop" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self airdropItem:item];
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
 
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)openFileWithItem:(IRBSandboxItem *)item {
    if (item.subtype == IRBSandboxItemSubtypeUnknow) {
        // 显示查看选项
        [self showUnknowFileTypeOpenMenuWithItem:item];
        return ;
    }
    
    IRBFilePreviewViewController * previewController = [IRBFilePreviewViewController new];
    previewController.item = item;
    
    [self.navigationController pushViewController:previewController animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IRBShowFolderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kIRBShowFolderTableViewCellIdentifier forIndexPath:indexPath];
    
    IRBSandboxItem * model = [self.datasource objectAtIndex:indexPath.row];
    cell.textLabel.text = model.name;
    cell.item = model;
    
    __weak IRBShowFolderViewController * weakSelf = self;
    cell.longPressGestureCallback = ^(IRBSandboxItem * _Nonnull item) {
        [weakSelf showActionMenuWithItem:item];
    };
    
    return cell;
}

#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    IRBSandboxItem * model = [self.datasource objectAtIndex:indexPath.row];
    
    if (model.type == IRBSandboxItemPreviousFolder) {
        [self.navigationController popViewControllerAnimated:YES];
    } else if (model.type == IRBSandboxItemFolder) {
        IRBShowFolderViewController * controller = [IRBShowFolderViewController new];
        controller.rootFolderURL = model.path;
        [self.navigationController pushViewController:controller animated:YES];
    } else if (model.type == IRBSandboxItemFile) {
        [self openFileWithItem:model];
    }
    
    [[self.tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
}

@end
