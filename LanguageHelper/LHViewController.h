//
//  LHViewController.h
//  LanguageHelper
//
//  Created by hecor on 11/26/12.
//  Copyright (c) 2012 pzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIImage *finalImage;
}


@property (nonatomic,weak) IBOutlet UIImageView *imageView;
@property (nonatomic,weak) IBOutlet UIToolbar *toolbar;

@end
