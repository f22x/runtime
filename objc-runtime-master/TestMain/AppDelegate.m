//
//  AppDelegate.m
//  TestMain
//
//  Created by lei on 16/4/27.
//
//

#import "AppDelegate.h"
#import "objc-runtime.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)hello {
    printf("hello");
}

void say(id self, SEL _cmd, NSString *metre) {
    NSLog(@"%@", metre);
}

// 当调用了一个未实现的方法会来到这里
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == NSSelectorFromString(@"say:")) {
        // 动态添加方法
        class_addMethod(self, @selector(say:), say, "v@:@");
    }
    return [super resolveInstanceMethod:sel];
}

// 在没有找到方法时，会先调用此方法，可用于动态添加方法
/*
 + (BOOL)resolveInstanceMethod:(SEL)sel {
 return NO;
 }
 */

// 如果上面返回 NO，就会进入这一步，用于指定备选响应此 SEL 的对象
// 如果返回 self 就会死循环
/*
 - (id)forwardingTargetForSelector:(SEL)aSelector {
 return nil;
 }
 */

// 首先先检验签名(签名在内存表中)如果没有进入下一步
// 指定方法签名，若返回 nil，则不会进入下一步，而是无法处理消息
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"nosay"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}

// 当实现了此方法后，-doesNotRecognizeSelector: 将不会被调用
// 如果要测试找不到方法，可以注释掉这一个方法
// 在这里进行消息转发
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    // 改变选择器
    [anInvocation setSelector:@selector(sayno:)];
    // 改变方法选择器后，还需要指定是哪个对象的方法
    [anInvocation invokeWithTarget:self];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"无法处理消息：%@", NSStringFromSelector(aSelector));
}

- (void)sayno:(NSString *)sender {
    NSLog(@"oh ! no");
}

// 这里模拟进入消息转发过程
- (void)nosay {
    AppDelegate *app = [[AppDelegate alloc] init];
    [app performSelector:@selector(sayno:) withObject:nil];
}
@end
