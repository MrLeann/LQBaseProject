//
//  AppDelegate.h
//  LQBaseProject
//
//  Created by YZR on 16/7/7.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>



// ----- 多语言设置
#define kNotificationLanguageChanged @"kNotificationLanguageChanged"
#define CHINESE @"zh-Hans"
#define ENGLISH @"en"
#define AppLanguage @"appLanguage"
#define LanguageFileName @"Localizable"
//#define LocationLanguage(key) NSLocalizedStringFromTable(str, LanguageFileName, nil)
#define LocationLanguage(key) [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:@"" table:nil]



@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

