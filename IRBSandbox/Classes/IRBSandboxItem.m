//
//  IRBSandboxItem.m
//  IRBSandbox
//
//  Created by robbin on 2019/2/14.
//

#import "IRBSandboxItem.h"

@implementation IRBSandboxItem

- (void)setPath:(NSString *)path {
    _path = path;
    NSLog(@"path = %@", path);
}

+ (IRBSandboxItemSubtype)subTypeWithFilePath:(NSString *)filePath {
    NSString * extension = [filePath pathExtension];
    extension = [extension lowercaseString];
    // 第一步 精细筛选
    if ([extension isEqualToString:@"png"] ||
        [extension isEqualToString:@"jpg"] ||
        [extension isEqualToString:@"jpeg"]) {
        return IRBSandboxItemSubtypeImage;
    }
    
    if ([extension isEqualToString:@"html"] ||
        [extension isEqualToString:@"xml"] ) {
        return IRBSandboxItemSubtypeHTML;
    }
    
    
    if ([extension isEqualToString:@"txt"] ||
        [extension isEqualToString:@"text"] ||
        [extension isEqualToString:@"json"] ) {
        return IRBSandboxItemSubtypeText;
    }
    
    if ([extension isEqualToString:@"mp3"] ||
        [extension isEqualToString:@"ogg"] ||
        [extension isEqualToString:@"wav"] ||
        [extension isEqualToString:@"m4a"] ||
        [extension isEqualToString:@"aac"]) {
        return IRBSandboxItemSubtypeAudio;
    }
    
    if ([extension isEqualToString:@"mp4"] ||
        [extension isEqualToString:@"avi"] ||
        [extension isEqualToString:@"mpeg"] ||
        [extension isEqualToString:@"rmvb"] ||
        [extension isEqualToString:@"mov"]) {
        return IRBSandboxItemSubtypeVideo;
    }
    
    // 第二步 粗略筛选
    if ([extension rangeOfString:@"png"].length > 0) {
        return IRBSandboxItemSubtypeImage;
    }
    
    return IRBSandboxItemSubtypeUnknow;
}

+ (NSArray<NSString *> *)allSupportFileTypeNameList {
    return @[@"图片",
             @"视频",
             @"文本",
             @"网页",
             @"音频",];
}

+ (IRBSandboxItemSubtype)fileTypeWithName:(NSString *)name {
    if ([name isEqualToString:@"图片"]) {
        return IRBSandboxItemSubtypeImage;
    } else if ([name isEqualToString:@"视频"]) {
        return IRBSandboxItemSubtypeVideo;
    } else if ([name isEqualToString:@"文本"]) {
        return IRBSandboxItemSubtypeText;
    } else if ([name isEqualToString:@"网页"]) {
        return IRBSandboxItemSubtypeHTML;
    } else if ([name isEqualToString:@"音频"]) {
        return IRBSandboxItemSubtypeAudio;
    } else {
        return IRBSandboxItemSubtypeUnknow;
    }
}

@end
