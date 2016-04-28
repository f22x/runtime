//
//  main.m
//  TestMain
//
//  Created by lei on 16/4/27.
//
//
//  测试部分来自 https://github.com/Tuccuay/RuntimeSummary      洪硕

#import <Cocoa/Cocoa.h>
#import <objc/runtime.h>

#import "AppDelegate.h"
#import "AppDelegate+append.h"
#import "Model.h"
#import "Model+Archive.h"

int main(int argc, const char * argv[]) {
    AppDelegate *app = [[AppDelegate alloc] init];
    [app hello];
    [app hello];
    
    /***********************************************************************
     * test
     **********************************************************************/
    
#pragma mark 创建
    // 首先获取到类
    Class myClass = objc_getClass("AppDelegate");
    // 创建
    app = objc_msgSend(myClass, @selector(alloc));
    // 初始化
    app = objc_msgSend(myClass, @selector(init));
    // 调用方法
    objc_msgSend(app, @selector(hello));
    
    // 也可以这样构造
    //    AppDelegate *privateClass = objc_msgSend(objc_msgSend(objc_getClass("AppDelegate"), sel_registerName("alloc")), sel_registerName("init"));
    //    objc_msgSend(privateClass, @selector(hello), nil);
    
#pragma mark 替换
    // 方法已经被替换
    [app hello];
    
#pragma mark 增加属性
    NSLog(@"%@", app.name);
    
#pragma mark 动态添加(在类中实现)
    [app performSelector:@selector(say:) withObject:@"hello!"];
    
#pragma mark 没有实现某方法,转换为实现其他方法(其实是模拟消息转发过程)
    [app nosay];
    
#pragma mark 获取属性列表(假如属性是一个model)
    Model *model = [Model modelWithDict:nil updateDict:nil];
    
    
    
    
    
    
    
    
    
    
    
    //    暂时关闭窗口
    return 0;
    //    return NSApplicationMain(argc, argv);
}

