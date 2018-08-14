//
//  NSObject+Hook.m
//  BDNetDiskHook
//
//  Created by ezreal on 2017/12/29.
//  Copyright © 2017年 ezreal. All rights reserved.
//

#import "NSObject+Hook.h"
#import <objc/runtime.h>
#import "JRSwizzle.h"

@interface NSObject ()

@property(nonatomic) unsigned long long speedLimit;

@property(copy, nonatomic) NSString *requestURL;

@property(copy, nonatomic) NSString *serverHost; // @synthesize serverHost=_serverHost;

@property(copy, nonatomic) NSString *clientIP; // @synthesize clientIP=_clientIP;

@end

@implementation NSObject (Hook)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class tarClass = NSClassFromString(@"BDUser");
        Method srcMethod = class_getInstanceMethod([self class], @selector(isSVip_hook));
        Method tarMethod = class_getInstanceMethod(tarClass, @selector(isSVip));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"Registration Hook sucessed");
        }else{
            NSLog(@"Registration Hook error");
        }
        
        srcMethod = class_getInstanceMethod([self class], @selector(isVip_hook));
        tarMethod = class_getInstanceMethod(tarClass, @selector(isNormalVip));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"Registration Hook sucessed");
        }else{
            NSLog(@"Registration Hook error");
        }
        
        srcMethod = class_getInstanceMethod([self class], @selector(isNormalVip_hook));
        tarMethod = class_getInstanceMethod(tarClass, @selector(isNormalVip));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"Registration Hook sucessed");
        }else{
            NSLog(@"Registration Hook error");
        }
        
        tarClass = NSClassFromString(@"TransLogRecorder");
        srcMethod = class_getInstanceMethod([self class], @selector(speedLimit_hook));
        tarMethod = class_getInstanceMethod(tarClass, @selector(speedLimit));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"TransLogRecorder");
        }else{
            NSLog(@"Registration Hook error");
        }
        
        srcMethod = class_getInstanceMethod([self class], @selector(logSpeedLimit_hook:));
        tarMethod = class_getInstanceMethod(tarClass, @selector(logSpeedLimit:));
        
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"Registration Hook sucessed");
        }else{
            NSLog(@"Registration Hook error");
        }
        
        tarClass = NSClassFromString(@"BDUserPersonalInfo");
        srcMethod = class_getInstanceMethod([self class], @selector(expVipExpireTime_hook));
        tarMethod = class_getInstanceMethod(tarClass, @selector(expVipExpireTime));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"Registration Hook sucessed");
        }else{
            NSLog(@"Registration Hook error");
        }
        
        srcMethod = class_getInstanceMethod([self class], @selector(svipExpireTime_hook));
        tarMethod = class_getInstanceMethod(tarClass, @selector(svipExpireTime));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"Registration Hook sucessed");
        }else{
            NSLog(@"Registration Hook error");
        }
        
        srcMethod = class_getInstanceMethod([self class], @selector(vipExpireTime_hook));
        tarMethod = class_getInstanceMethod(tarClass, @selector(vipExpireTime));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"Registration Hook sucessed");
        }else{
            NSLog(@"Registration Hook error");
        }
        
        tarClass = NSClassFromString(@"FileTransSpeedUpTrialManager");
        srcMethod = class_getInstanceMethod([self class], @selector(trialToken_hook));
        tarMethod = class_getInstanceMethod(tarClass, @selector(trialToken));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"TransLogRecorder");
        }else{
            NSLog(@"Registration Hook error");
        }
        
        tarClass = NSClassFromString(@"FileTransmissionAPI");
        srcMethod = class_getClassMethod([self class], @selector(getDownloadCDNLocateWithServerFilePath_hook:isDlinkDownload:timestamp:token:dpLogID:completion:));
        tarMethod = class_getClassMethod(tarClass, @selector(getDownloadCDNLocateWithServerFilePath:isDlinkDownload:timestamp:token:dpLogID:completion:));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"TransLogRecorder");
        }else{
            NSLog(@"Registration Hook error");
        }
        
        tarClass = NSClassFromString(@"CDNDownloadLocateListModel");
        srcMethod = class_getInstanceMethod([self class], @selector(maximumBytesPerSecond_hook));
        tarMethod = class_getInstanceMethod(tarClass, @selector(maximumBytesPerSecond));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"TransLogRecorder");
        }else{
            NSLog(@"Registration Hook error");
        }
        
        tarClass = NSClassFromString(@"CDNDownloadLocateListModel");
        srcMethod = class_getInstanceMethod([self class], @selector(clientip_hook));
        tarMethod = class_getInstanceMethod(tarClass, @selector(clientip));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"clientip_hook");
        }else{
            NSLog(@"clientip_hook Hook error");
        }
        
        
        
        tarClass = NSClassFromString(@"ASIHTTPRequest");
        srcMethod = class_getInstanceMethod([self class], @selector(url_hook));
        tarMethod = class_getInstanceMethod(tarClass, @selector(url));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"TransLogRecorder");
        }else{
            NSLog(@"Registration Hook error");
        }
    
        tarClass = NSClassFromString(@"NSOperationQueue");
        srcMethod = class_getInstanceMethod([self class], @selector(setMaxConcurrentOperationCount_hook:));
        tarMethod = class_getInstanceMethod(tarClass, @selector(setMaxConcurrentOperationCount:));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"NSOperationQueue");
        }else{
            NSLog(@"NSOperationQueue Hook error");
        }
        
//        tarClass = NSClassFromString(@"BDCUserSettings");
//        srcMethod = class_getClassMethod([self class], @selector(isForceUpdate_hook));
//        tarMethod = class_getClassMethod(tarClass, @selector(isForceUpdate));
//        method_exchangeImplementations(srcMethod, tarMethod);
//        if (srcMethod != nil && tarMethod != nil) {
//            NSLog(@"ForceUpdate Hook sucessed");
//        }else{
//            NSLog(@"ForceUpdate Hook error");
//        }
        
        tarClass = NSClassFromString(@"AppVersionManager");
        srcMethod = class_getInstanceMethod([self class], @selector(startMotinorVersion_hook));
        tarMethod = class_getInstanceMethod(tarClass, @selector(startMotinorVersion));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"startMotinorVersion");
        }else{
            NSLog(@"startMotinorVersion Hook error");
        }
        
        tarClass = NSClassFromString(@"AppVersionManager");
        srcMethod = class_getInstanceMethod([self class], @selector(checkUpdate_hook));
        tarMethod = class_getInstanceMethod(tarClass, @selector(checkUpdate));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"checkUpdate");
        }else{
            NSLog(@"checkUpdate Hook error");
        }
        
        tarClass = NSClassFromString(@"BDCNetworkManager");
        srcMethod = class_getInstanceMethod([self class], @selector(maxAvailableBandwidthForFileDownload_hook));
        tarMethod = class_getInstanceMethod(tarClass, @selector(maxAvailableBandwidthForFileDownload));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"maxAvailableBandwidthForFileDownload");
        }else{
            NSLog(@"maxAvailableBandwidthForFileDownload Hook error");
        }
        
        tarClass = NSClassFromString(@"DownloadTaskManager");
        srcMethod = class_getInstanceMethod([self class], @selector(maxConcurrentOperationCount_hook));
        tarMethod = class_getInstanceMethod(tarClass, @selector(maxConcurrentOperationCount));
        method_exchangeImplementations(srcMethod, tarMethod);
        if (srcMethod != nil && tarMethod != nil) {
            NSLog(@"maxConcurrentOperationCount");
        }else{
            NSLog(@"maxConcurrentOperationCount Hook error");
        }
        
        
        
        
    });
}

- (long long)maxConcurrentOperationCount_hook
{
    long long d = [self maxConcurrentOperationCount_hook];
//    d = d*10;
    NSLog(@"maxConcurrentOperationCount %llu",d);
    NSLog(@"DownloadTaskManager %@",[self getAllPropertiesAndVaules]);
    return d;
}

- (long long)maxAvailableBandwidthForFileDownload_hook
{
    long long d = [self maxAvailableBandwidthForFileDownload_hook];
    NSLog(@"maxAvailableBandwidthForFileDownload %llu",d);
    return d;
}

- (NSInteger)checkUpdate_hook
{
    NSLog(@"开始checkUpdate");
    return 0;
}

- (void)startMotinorVersion_hook
{
    NSLog(@"开始监控版本");
}


- (BOOL)isSVip_hook{
    return YES;
}

- (BOOL)isVip_hook{
    return YES;
}

- (BOOL)isNormalVip_hook{
    return YES;
}


-(long long)speedLimit_hook{
    long long speed = [self speedLimit_hook];
    NSLog(@"speed %llu",speed);
    return speed;
}

-(double)expVipExpireTime_hook{
    return 1894704637;
}

-(double)svipExpireTime_hook{
    return 1894704637;
}

-(double)vipExpireTime_hook{
    return 1894704637;
}

- (void)logSpeedLimit_hook:(unsigned long long)arg1{
    NSLog(@"logSpeedLimit:%llu",arg1);
    
    [self logSpeedLimit_hook:arg1];
    NSLog(@"%@",[self getAllPropertiesAndVaules]);
}

- (NSDictionary *)getAllPropertiesAndVaules
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties =class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}

- (id)trialToken_hook{
    id token = [self trialToken_hook];
    
    NSLog(@"trialToken_hook %@",token);
//    token = @"VYW6T0MhG4bUQ3rNex3okRZkQsk=";
//    token = @"HadGZJt/4ugmpEdXSjv5T10mcBk=";
//    token = @"3XPULEbHYetVUSrBJjhbRI7jsEo=";
    return token;
}

+ (unsigned long long)getDownloadCDNLocateWithServerFilePath_hook:(id)arg1 isDlinkDownload:(BOOL)arg2 timestamp:(long long)arg3 token:(id)arg4 dpLogID:(id)arg5 completion:(id)arg6
{
    NSLog(@"getDownloadCDNLocateWithServerFilePath_hook %@ %d %llu %@ %@",arg1,arg2,arg3,arg4,arg5);
//    return [self getDownloadCDNLocateWithServerFilePath_hook:arg1 isDlinkDownload:arg2 timestamp:arg3 token:arg4 dpLogID:arg5 completion:^(id argt1,id argt2){
//        NSLog(@"%@ %@",argt1,argt2);
//    }];
    return [self getDownloadCDNLocateWithServerFilePath_hook:arg1 isDlinkDownload:arg2 timestamp:arg3 token:arg4 dpLogID:arg5 completion:arg6];
 
}

-(long long)maximumBytesPerSecond_hook{
    long long bytes = [self maximumBytesPerSecond_hook];

    NSLog(@"maximumBytesPerSecond_hook %llu",bytes);
    return 10*1024*1024;
}
-(NSString *)clientip_hook
{
    NSString *str = [self clientip_hook];
    NSLog(@"clientip %@",str);
    return str;
}

-(void)setMaxConcurrentOperationCount_hook:(NSInteger)count{
    
//    if (count == 5) {
        count = 100;

        //NSLog(@"queue %@",[self getAllPropertiesAndVaules]);
//    }
    NSLog(@"queue count  %ld",count);
    [self setMaxConcurrentOperationCount_hook:count];
}



-(NSURL *)url_hook{
    NSURL *url = [self url_hook];
    NSString *strURL = [url.absoluteString stringByReplacingOccurrencesOfString:@"https://" withString:@"http://"];
    NSURL *newUrl = [NSURL URLWithString:strURL];
//    NSLog(@"url_hook %@",newUrl);
    return newUrl;
//    return url;
}
@end
