// Generated by Apple Swift version 1.2 (swiftlang-602.0.53.1 clang-602.0.53)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
#if __has_feature(nullability)
#  define SWIFT_NULLABILITY(X) X
#else
# if !defined(__nonnull)
#  define __nonnull
# endif
# if !defined(__nullable)
#  define __nullable
# endif
# if !defined(__null_unspecified)
#  define __null_unspecified
# endif
#  define SWIFT_NULLABILITY(X)
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import ObjectiveC;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;

SWIFT_CLASS("_TtC13DealsSortTest11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic) UIWindow * __nullable window;
- (BOOL)application:(UIApplication * __nonnull)application didFinishLaunchingWithOptions:(NSDictionary * __nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * __nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * __nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * __nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * __nonnull)application;
- (void)applicationWillTerminate:(UIApplication * __nonnull)application;
- (SWIFT_NULLABILITY(nonnull) instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13DealsSortTest4Deal")
@interface Deal : NSObject
@property (nonatomic, copy) NSString * __nonnull name;
@property (nonatomic, copy) NSString * __nonnull desc;
@property (nonatomic) NSInteger timeLimit;
@property (nonatomic) NSInteger tier;
@property (nonatomic) float value;
@property (nonatomic) BOOL isDefault;
@property (nonatomic, copy) NSString * __nonnull restId;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithName:(NSString * __nonnull)name desc:(NSString * __nonnull)desc timeLimit:(NSInteger)timeLimit tier:(NSInteger)tier value:(float)value isDefault:(BOOL)isDefault restId:(NSString * __nonnull)restId OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13DealsSortTest10Restaurant")
@interface Restaurant : NSObject
@property (nonatomic, copy) NSString * __nonnull identifier;
@property (nonatomic, copy) NSString * __nonnull imageName;
@property (nonatomic, copy) NSString * __nonnull name;
@property (nonatomic, copy) NSString * __nonnull address;
@property (nonatomic) float distance;
@property (nonatomic) NSInteger priceTier;
@property (nonatomic, copy) NSString * __nonnull phone;
@property (nonatomic, copy) NSString * __nonnull webUrl;
@property (nonatomic, copy) NSString * __nonnull hours;
@property (nonatomic, copy) NSArray * __nonnull deals;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithIdentifier:(NSString * __nonnull)identifier name:(NSString * __nonnull)name phone:(NSString * __nonnull)phone imageName:(NSString * __nonnull)imageName address:(NSString * __nonnull)address hours:(NSString * __nonnull)hours distance:(float)distance priceTier:(NSInteger)priceTier webUrl:(NSString * __nonnull)webUrl deals:(NSArray * __nonnull)deals OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;
@class UILabel;
@class UIActivityIndicatorView;
@class NSIndexPath;
@class UITableViewCell;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC13DealsSortTest14ViewController")
@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) IBOutlet UITableView * __null_unspecified dealTable;
@property (nonatomic) IBOutlet UILabel * __null_unspecified dealNameLabel;
@property (nonatomic) IBOutlet UIActivityIndicatorView * __null_unspecified activityIndicator;
@property (nonatomic) IBOutlet UILabel * __null_unspecified activityLabel;
@property (nonatomic, copy) NSArray * __nonnull plistObjects;
@property (nonatomic) IBOutlet UILabel * __null_unspecified dealValueLabel;
@property (nonatomic, copy) NSArray * __nonnull dealList;
@property (nonatomic) float topValue;
@property (nonatomic) NSInteger topHighestTier;
@property (nonatomic) NSInteger currentTier;
@property (nonatomic) NSInteger currentRestaurantIndex;
@property (nonatomic) Deal * __nullable topDeal;
@property (nonatomic, copy) NSArray * __nonnull allRestaurants;
@property (nonatomic, copy) NSArray * __nonnull dealListRestaurants;
- (void)viewDidLoad;
- (void)loadDeals;
- (void)calculateHighestTier;
- (void)delayLoad;
- (void)delayReload;
- (void)getFirstDeal;
- (void)getNextDeal;
- (void)reloadTableView;
- (void)setTopDeal;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * __nonnull)tableView:(UITableView * __nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (void)didReceiveMemoryWarning;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
