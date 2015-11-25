//
//  XDSPhotoBrowserViewController.m
//  XDSPractice
//
//  Created by zhengda on 15/11/18.
//  Copyright © 2015年 zhengda. All rights reserved.
//

#import "XDSPhotoBrowserViewController.h"
#import "MHGallery.h"
@interface XDSPhotoBrowserViewController ()

@end

@implementation XDSPhotoBrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self XDSPhotoBrowserViewControllerDataInit];
    [self createXDSPhotoBrowserViewControllerUI];
}

#pragma mark - UI相关
- (void)createXDSPhotoBrowserViewControllerUI{

}

#pragma mark - 代理方法

#pragma mark - 网络请求

#pragma mark - 点击事件处理
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UIImageView *imageView = [(ImageTableViewCell*)[tableView cellForRowAtIndexPath:indexPath] imageView];
//    
//    MHGalleryItem *image1 = [MHGalleryItem itemWithURL:@"myImageURL" galleryType:MHGalleryTypeImage];
//    MHGalleryItem *image2 = [MHGalleryItem itemWithURL:@"myImageURL" galleryType:MHGalleryTypeImage];
//    MHGalleryItem *youtube = [MHGalleryItem itemWithYoutubeVideoID:@"myYoutubeID"];
//    
//    NSArray *galleryData = @[image1,image2,youtube];
//    
//    MHGalleryController *gallery = [MHGalleryController galleryWithPresentationStyle:MHGalleryViewModeImageViewerNavigationBarShown];
//    gallery.galleryItems = galleryData;
//    gallery.presentingFromImageView = imageView;
//    gallery.presentationIndex = indexPath.row;
//    
//    __weak MHGalleryController *blockGallery = gallery;
//    
//    gallery.finishedCallback = ^(NSUInteger currentIndex,UIImage *image,MHTransitionDismissMHGallery *interactiveTransition){
//        
//        NSIndexPath *newIndex = [NSIndexPath indexPathForRow:currentIndex inSection:0];
//        
//        [self.tableView scrollToRowAtIndexPath:newIndex atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            UIImageView *imageView = [(ImageTableViewCell*)[self.tableView cellForRowAtIndexPath:newIndex] iv];
//            [blockGallery dismissViewControllerAnimated:YES dismissImageView:imageView completion:nil];
//        });
//        
//    };    
//    [self presentMHGalleryController:gallery animated:YES completion:nil];
}
#pragma mark - 其他私有方法

#pragma mark - 内存管理相关
- (void)XDSPhotoBrowserViewControllerDataInit{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
