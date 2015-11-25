//
//  SmtaranADViewController.m
//  XDSPractice
//
//  Created by zhengda on 15/11/25.
//  Copyright © 2015年 zhengda. All rights reserved.
//

#import "SmtaranADViewController.h"
#import "SmtaranSDKManager.h"
#import "SmtaranInterstitialAd.h"//插屏广告

@interface SmtaranADViewController ()<SmtaranInterstitialAdDelegate>
@property(nonatomic, strong) SmtaranInterstitialAd *interstitialWindow;

@end

@implementation SmtaranADViewController

- (instancetype)init{
    self = [super init];
    if (self) {
//        [[SmtaranSDKManager getInstance]setPublisherID:MS_Test_PublishID withChannel:@"you_channel" auditFlag:MS_Test_Audit_Flag];
        [[SmtaranSDKManager getInstance]setPublisherID:MS_Test_PublishID auditFlag:MS_Test_Audit_Flag];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self smtaranADViewControllerDataInit];
//    [self createSmtaranADViewControllerUI];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self createSmtaranADViewControllerUI];
}
#pragma mark - UI相关
- (void)createSmtaranADViewControllerUI{

}


#pragma mark - 代理方法
#pragma mark SmtaranInterstitialAdDelegate
-(void)smtaranInterstitialAdClick:(SmtaranInterstitialAd *)adInterstitial
{
    NSLog(@"smtaranInterstitialAdClick");
}
-(void)smtaranInterstitialAdClose:(SmtaranInterstitialAd *)adInterstitial
{
    NSLog(@"smtaranInterstitialAdClose");
    self.interstitialWindow.delegate = self;
    self.interstitialWindow = nil;
}

-(void)smtaranInterstitialAdSuccessToRequest:(SmtaranInterstitialAd *)adInterstitial
{
    NSLog(@"smtaranInterstitialAdSuccessToRequest");
}


-(void)smtaranInterstitialAdFaildToRequest:(SmtaranInterstitialAd *)adInterstitial withError:(NSError *)error
{
    NSLog(@"smtaranInterstitialAdFaildToRequest error =:%@",[error description]);
}

#pragma mark - 网络请求

#pragma mark - 点击事件处理
- (IBAction)createAD:(id)sender {
    self.interstitialWindow = [[SmtaranInterstitialAd alloc]initInterstitialAdSize:SmtaranInterstitialAdSizeLarge delegate:self slotToken:MS_Test_SlotToken_Poster];
    NSLog(@"===== %@", _interstitialWindow);
}

- (IBAction)showAD:(id)sender {
    [self.interstitialWindow showInterstitialAd];
}
#pragma mark - 其他私有方法

#pragma mark - 内存管理相关
- (void)smtaranADViewControllerDataInit{
    
}
- (void)dealloc {
    self.interstitialWindow.delegate = nil;
    self.interstitialWindow =  nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
