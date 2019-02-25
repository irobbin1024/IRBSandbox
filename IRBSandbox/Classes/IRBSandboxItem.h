//
//  IRBSandboxItem.h
//  IRBSandbox
//
//  Created by robbin on 2019/2/14.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, IRBSandboxItemType) {
    IRBSandboxItemPreviousFolder = 0,
    IRBSandboxItemFolder,
    IRBSandboxItemFile,
};

typedef NS_ENUM(NSInteger, IRBSandboxItemSubtype) {
    IRBSandboxItemSubtypeUnknow = 0,
    IRBSandboxItemSubtypeImage,
    IRBSandboxItemSubtypeVideo,
    IRBSandboxItemSubtypeText,
    IRBSandboxItemSubtypeSqlite,
    IRBSandboxItemSubtypeHTML,
    IRBSandboxItemSubtypeAudio,
};


NS_ASSUME_NONNULL_BEGIN

@interface IRBSandboxItem : NSObject

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * fileName;
@property (nonatomic, copy) NSString * path;
@property (nonatomic, assign) IRBSandboxItemType type;
@property (nonatomic, assign) IRBSandboxItemSubtype subtype;

+ (IRBSandboxItemSubtype)subTypeWithFilePath:(NSString *)filePath;
+ (NSArray<NSString *> *)allSupportFileTypeNameList;
+ (IRBSandboxItemSubtype)fileTypeWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
