//
//  ADDZViewController.h
//  Motion Effects Demo
//
//  Created by Sunil N. Talpade on 12/04/14.
//  Copyright (c) 2014 Aditya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBShimmeringView.h"

@interface ADDZViewController : UIViewController

@property (strong, nonatomic) UIImageView *faceImageView;

- (void)generateRandomParticleAndAddToView:(UIView *)view;

@end
