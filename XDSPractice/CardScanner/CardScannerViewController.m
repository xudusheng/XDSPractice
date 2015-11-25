//
//  CardScannerViewController.m
//  XDSPractice
//
//  Created by zhengda on 8/5/15.
//  Copyright (c) 2015 zhengda. All rights reserved.
//

#import "CardScannerViewController.h"
#import "CardIO.h"
@interface CardScannerViewController ()<CardIOPaymentViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *cardInfoLabel;

@end

@implementation CardScannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)scanButtonClick:(id)sender {
    self.cardInfoLabel.text = @"1\n2\n3\n";
    CardIOPaymentViewController * cardScannerVC = [[CardIOPaymentViewController alloc]initWithPaymentDelegate:self];
    [self presentViewController:cardScannerVC animated:YES completion:nil];
}

#pragma mark - CardIOPaymentViewControllerDelegate
- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)paymentViewController{
    [paymentViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)cardInfo
             inPaymentViewController:(CardIOPaymentViewController *)paymentViewController{
    NSLog(@"cardInfo = %@", cardInfo.cardNumber);
    [paymentViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
