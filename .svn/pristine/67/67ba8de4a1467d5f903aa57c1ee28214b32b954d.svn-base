// AFAppDotNetAPIClient.h
//
// Copyright (c) 2012 Mattt Thompson (http://mattt.me/)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AFAppDotNetAPIClient.h"
#import "TheUserManager.h"
#import "MD5.h"
#import "LoginManager.h"
#import "GDataXMLNode.h"

#define   OBDTokenKey @"3dd985b5a9af6e86c7d412aaad987a0585a2589ee9fbd3cd877e4de120f910c1f364067c4091ffb28b343f6274a4306e"
#define   CTokenKey @"2013tsicheyoubangandroidprojecta"

static NSString * const AFAppDotNetAPIBaseURLString = @"http://testtsi.365car.com.cn:60080/";//@"http://port.365car.com.cn/";


@implementation AFAppDotNetAPIClient

+ (instancetype)sharedClient {
    static AFAppDotNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
//        [config setHTTPAdditionalHeaders:@{@"Content-Type":@"text/plain"}];

        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
//        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    });
    
    return _sharedClient;
}

-(NSURLSessionDataTask*)GetadverImgesInfo:(void (^)(NSArray *posts, NSError *error))block
{
    NSString *useridString = [NSString stringWithFormat:@"%d", 646722];
    
    NSMutableDictionary * params= [[NSMutableDictionary alloc]init];
    
//    [params setObject:useridString forKey:@"userId"];
    [params setObject:@"/clb/apps/companyIntroduction_getDefaultActivity4Mobile.action" forKey:@"url"];
    [params setObject: [NSString stringWithFormat:@"%d", 1] forKey:@"page.currentPage"];
    [params setObject: [NSString stringWithFormat:@"%d", 4] forKey:@"page.perPageSize"];
    [params setObject: @"pd" forKey:@"appVersion"];
    [AFAppDotNetAPIClient sharedClient].responseSerializer = [AFJSONResponseSerializer serializer];


    
    return [[AFAppDotNetAPIClient sharedClient] POST:@"agent/interface/clb_route.action?" parameters:params success:^(NSURLSessionDataTask * __unused task, id receiveObj) {
        
        NSDictionary *result  = (NSDictionary*)receiveObj;
        NSLog(@"%@",[receiveObj class]);
//        NSData *data = [receiveString dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//
        NSLog(@"ismainThread %d",[NSThread isMainThread]);
        
        if ([result valueForKey:@"activitys"] != nil) {
            
            NSArray *arr = [result valueForKey:@"activitys"];
            
        if (block) {
            block([NSArray arrayWithArray:arr], nil);
        }
        }

    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
            NSLog(@"%@",error);
        }
    }];
        
}

- (NSURLSessionDataTask*)getValiateCodeRequest:(NSString*)phoneNum complete:(void (^)(NSString *datas, NSError *error))block
{
    NSInteger userId = [[LoginManager sharedInstance].userId integerValue];
    NSString *useridString = [NSString stringWithFormat:@"%ld", (long)userId];
   
    
    NSDate *nowdate = [NSDate date];
    NSTimeInterval timeInterval = [nowdate timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%f", timeInterval * 1000];
    NSString *SignMd5=[[[[NSString stringWithFormat:@"%ld",(long)userId] stringByAppendingString:[CTokenKey MD5]] stringByAppendingString:timeString] MD5];
    
    NSMutableDictionary * params= [[NSMutableDictionary alloc]init];
    [params setObject: useridString forKey:@"userId"];
    [params setObject: timeString forKey:@"timestamp"];
    [params setObject: SignMd5 forKey:@"sign"];
    [params setObject: phoneNum forKey:@"mobileNo"];
    [params setObject: [NSString stringWithFormat:@"%d", 1] forKey:@"type"];

    NSLog(@"SignMd5=%@",SignMd5);
    [AFAppDotNetAPIClient sharedClient].responseSerializer = [AFHTTPResponseSerializer serializer];
    
    return [[AFAppDotNetAPIClient sharedClient] POST:@"tsi/api/cyhl/getMbValidCode?" parameters:params success:^(NSURLSessionDataTask * __unused task, id responseObject) {
        NSString * xmlstring = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@",xmlstring);
       
            if (block) {
                block(xmlstring, nil);
            }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([[NSString alloc]init], error);
            NSLog(@"%@",error);
        }
    }];
    
}


- (NSURLSessionDataTask*)getNowPwd:(NSString*)passWord validcode:(NSString*)vcode phoneNum:(NSString*)phNum  complete:(void (^)(NSString *responsexml, NSError *error))block
{
    NSInteger userId = 0;//[[LoginManager sharedInstance].userId integerValue];
    NSString *useridString = [NSString stringWithFormat:@"%ld", (long)userId];
    
    
    NSDate *nowdate = [NSDate date];
    NSTimeInterval timeInterval = [nowdate timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%f", timeInterval * 1000];
    NSString *SignMd5=[[[[NSString stringWithFormat:@"%ld",(long)userId] stringByAppendingString:[CTokenKey MD5]] stringByAppendingString:timeString] MD5];
    
    NSMutableDictionary * params= [[NSMutableDictionary alloc]init];
    [params setObject: useridString forKey:@"userId"];
    [params setObject: timeString forKey:@"timestamp"];
    [params setObject: SignMd5 forKey:@"sign"];
    [params setObject: vcode forKey:@"validCode"];
    [params setObject: passWord forKey:@"passWord"];
    [params setObject: phNum  forKey:@"mobileNo"];
    
    NSLog(@"SignMd5=%@",SignMd5);
    [AFAppDotNetAPIClient sharedClient].responseSerializer = [AFHTTPResponseSerializer serializer];
    
    return [[AFAppDotNetAPIClient sharedClient] POST:@"tsi/api/cyhl/updateCYHLUserPwd?" parameters:params success:^(NSURLSessionDataTask * __unused task, id responseObject) {
        NSString * xmlstring = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@",xmlstring);
        
        NSError* Xmlerror;
        NSError* returnError;

        //
            NSLog(@"注册或修改密码的请求返回信息:%@",xmlstring);
            GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:[xmlstring dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&Xmlerror];
            if (doc != nil)
            {
                GDataXMLElement *firstName;
                NSArray *arrNode = [doc nodesForXPath:@"//resultCode" error:nil];
                if ([arrNode count] == 1) {
                    firstName = (GDataXMLElement *) [arrNode objectAtIndex:0];
                    if ([[firstName stringValue] isEqual:@"0"]) {
                        //找回密码
                        
                    } else if ([[firstName stringValue] isEqual:@"9080"]) {
                        returnError = [[NSError alloc]initWithDomain:@"验证码错误或者验证码已经过期." code:9080 userInfo:nil];
                    } else if ([[firstName stringValue] isEqual:@"9085"]) {
                        returnError = [[NSError alloc]initWithDomain:@"手机号码已经注册." code:9085 userInfo:nil];
       
                    } else if ([[firstName stringValue] isEqual:@"9086"]) {
                       returnError = [[NSError alloc]initWithDomain:@"该手机号没有注册." code:9086 userInfo:nil];

                    } else if ([[firstName stringValue] isEqual:@"9088"]) {
                        returnError = [[NSError alloc]initWithDomain:@"该手机号已被使用" code:9089 userInfo:nil];
                     
                    } else if ([[firstName stringValue] isEqual:@"9003"]) {
                         returnError = [[NSError alloc]initWithDomain:@"参数错误." code:9009 userInfo:nil];
                    }
                    else
                    {
                        int errorCode = [[firstName stringValue] intValue];
                        NSArray *arrMsgNode = [doc nodesForXPath:@"//msg" error:nil];
                        NSString* errorMsg;
                        if (arrMsgNode.count) {
                            GDataXMLElement*  msgElement = (GDataXMLElement *) [arrMsgNode objectAtIndex:0];
                            if (msgElement) {
                                errorMsg = [msgElement stringValue];
                            }
                            
                        }
                        
                        returnError = [[NSError alloc]initWithDomain:errorMsg code:errorCode  userInfo:nil];
                    }
                        
                }

            }
        if (block) {
            block(nil, returnError);
        }
        //
 
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
            NSLog(@"%@",error);
        }
    }];

}

//获取行驶统计
-(NSURLSessionDataTask*)getDrivingCount:(NSString*)strbeginTime endTime:(NSString*)strendTime complete:(void (^)(NSDictionary *drivingCount, NSError *error))block
{
    //debug bobo
    NSInteger userId = 689610;//[[LoginManager sharedInstance].userId integerValue];
    NSString *useridString = [NSString stringWithFormat:@"%d", userId];
    
    NSDate *nowdate = [NSDate date];
    NSTimeInterval timeInterval = [nowdate timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%f", timeInterval * 1000];
    NSString *SignMd5=[[[[NSString stringWithFormat:@"%ld",(long)userId] stringByAppendingString:[OBDTokenKey MD5]] stringByAppendingString:timeString] MD5];
    
    NSMutableDictionary * params= [[NSMutableDictionary alloc]init];
    [params setObject: useridString forKey:@"userId"];
    [params setObject:strbeginTime  forKey:@"beginTime"];
    [params setObject:strendTime  forKey:@"endTime"];
    [params setObject: timeString forKey:@"timestamp"];
    [params setObject: SignMd5 forKey:@"sign"];
    [params setObject:@"obd/statisticsApi/getDrivingCount" forKey:@"methodName"];
    [params setObject:@"obd" forKey:@"serverName"];
    
   [AFAppDotNetAPIClient sharedClient].responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
   [AFAppDotNetAPIClient sharedClient].responseSerializer = [AFJSONResponseSerializer serializer];
//    
//    
//    
    return [[AFAppDotNetAPIClient sharedClient] POST:@"tsi/api/httpUtilsApi/commonPost?" parameters:params success:^(NSURLSessionDataTask * __unused task, id jsonObj) {

        NSDictionary *jsonDate  = (NSDictionary*)jsonObj;
        NSLog(@"%@",[jsonDate class]);

        NSLog(@"ismainThread %d",[NSThread isMainThread]);
        
        NSDictionary * resultDate =  [jsonDate valueForKey:@"drivingCount"];
        
        if (resultDate) {
            NSNumber* errCode = [resultDate valueForKey:@"errCode"];
            if (errCode) {
                 int nerrCode = [errCode intValue];
                if (nerrCode != 0) {
                    block(nil, [[NSError alloc]initWithDomain:@"获取失败" code:[errCode intValue]  userInfo:nil]);
                    return;
                }
            }
        }
      
        
        NSDictionary *dateDic = [jsonDate valueForKey:@"drivingCount"];
        if (dateDic) {
            if (block) {
                block([NSDictionary dictionaryWithDictionary:dateDic], nil);
            }
        }
        
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
            NSLog(@"%@",error);
        }
    }];
    
    
//    [AFAppDotNetAPIClient sharedClient].responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    return [[AFAppDotNetAPIClient sharedClient] POST:@"tsi/api/httpUtilsApi/commonPost?" parameters:params success:^(NSURLSessionDataTask * __unused task, id responseObject) {
//        NSString * xmlstring = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSLog(@"%@",xmlstring);
//        
//
//    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
//        if (block) {
//
//            NSLog(@"%@",error);
//        }
//    }];

    
}

@end
