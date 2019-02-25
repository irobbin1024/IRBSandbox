//
//  IRBAirdropHelper.m
//  IRBSandbox
//
//  Created by irobbin on 2019/2/19.
//

#import "IRBAirdropHelper.h"
#import "IRBSandboxItem.h"
#import "SSZipArchive.h"

@implementation IRBAirdropHelper

+ (void)airdropWithPath:(IRBSandboxItem *)item viewController:(UIViewController *)viewController {
    @synchronized (self) {
        NSString *cachesDir = [self shareZipFilePath];
        BOOL result = NO;
        if (item.type == IRBSandboxItemFolder) {
            result = [SSZipArchive createZipFileAtPath:cachesDir withContentsOfDirectory:item.path];
        } else if (item.type == IRBSandboxItemFile) {
            result = [SSZipArchive createZipFileAtPath:cachesDir withFilesAtPaths:@[item.path]];
        } else {
            return ;
        }
        
        if (result) {
            NSLog(@"压缩成功");
            [self sharePath:cachesDir viewController:viewController];
        }
    }
}

+ (void)sharePath:(NSString*)path viewController:(UIViewController *)viewController {
    NSURL *url = [NSURL fileURLWithPath:path];
    NSArray *objectsToShare = @[url];
    
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    NSArray *excludedActivities = @[UIActivityTypePostToTwitter, UIActivityTypePostToFacebook,
                                    UIActivityTypePostToWeibo,
                                    UIActivityTypeMessage, UIActivityTypeMail,
                                    UIActivityTypePrint, UIActivityTypeCopyToPasteboard,
                                    UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll,
                                    UIActivityTypeAddToReadingList, UIActivityTypePostToFlickr,
                                    UIActivityTypePostToVimeo, UIActivityTypePostToTencentWeibo];
    controller.excludedActivityTypes = excludedActivities;
    
    if ([(NSString *)[UIDevice currentDevice].model hasPrefix:@"iPad"]) {
        controller.popoverPresentationController.sourceView = viewController.view;
        controller.popoverPresentationController.sourceRect = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height, 10, 10);
    }
    [viewController presentViewController:controller animated:YES completion:nil];
}

+ (NSString *)shareZipFilePath {
    NSString * cachesDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    return [cachesDir stringByAppendingString:@"/shareFile.zip"];
}

@end
