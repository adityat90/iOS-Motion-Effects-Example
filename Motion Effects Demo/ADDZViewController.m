//
//  ADDZViewController.m
//  Motion Effects Demo
//
//  Created by Sunil N. Talpade on 12/04/14.
//  Copyright (c) 2014 Aditya. All rights reserved.
//

#import "ADDZViewController.h"

@interface ADDZViewController ()

@end

@implementation ADDZViewController

- (UIImageView *)faceImageView
{
    if(!_faceImageView)
    {
        _faceImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-50, -50, self.view.frame.size.width + 100, self.view.frame.size.height + 100)];
        [_faceImageView setImage:[UIImage imageNamed:@"faceimage"]];
    }
    return _faceImageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    UIImageView *redStars = [[UIImageView alloc] initWithFrame:CGRectMake(-50, -50, self.view.frame.size.width + 100, self.view.frame.size.height + 100)];
    [redStars setImage:[UIImage imageNamed:@"redstars"]];
    
    UIImageView *blueStars = [[UIImageView alloc] initWithFrame:CGRectMake(-50, -50, self.view.frame.size.width + 100, self.view.frame.size.height + 100)];
    [blueStars setImage:[UIImage imageNamed:@"bluestars"]];
    
    UIImageView *whiteStars = [[UIImageView alloc] initWithFrame:CGRectMake(-50, -50, self.view.frame.size.width + 100, self.view.frame.size.height + 100)];
    [whiteStars
     setImage:[UIImage imageNamed:@"whitestars"]];
    
    [self addMotionEffectTo:self.faceImageView WithMax:-55 Min:55];
    [self addMotionEffectTo:redStars WithMax:-75 Min:75];
    [self addMotionEffectTo:blueStars WithMax:55 Min:-55];
    [self addMotionEffectTo:whiteStars WithMax:75 Min:-75];

    [self.view addSubview:self.faceImageView];
    [self.view addSubview:redStars];
    [self.view addSubview:blueStars];
    [self.view addSubview:whiteStars];
    
    FBShimmeringView *shimmeringView = [[FBShimmeringView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 71, self.view.frame.size.width, 97)];
    [shimmeringView setShimmeringHighlightWidth:0.5f];
    [shimmeringView setShimmeringDirection:FBShimmerDirectionRight];
    [self.view addSubview:shimmeringView];
    
    UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, shimmeringView.frame.size.width, 97)];
    [loadingLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:80]];
    loadingLabel.textAlignment = NSTextAlignmentCenter;
    loadingLabel.text = NSLocalizedString(@"UNDER THE SKIN", nil);
    [loadingLabel setTextColor:[UIColor colorWithRed:22/255.0f green:102/255.0f blue:127/255.0f alpha:1.0f]];
    shimmeringView.contentView = loadingLabel;
    
    // Start shimmering.
    shimmeringView.shimmering = YES;
    
    [self addMotionEffectTo:loadingLabel WithMax:-10 Min:10];
    
    UILabel *actorName = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, self.view.frame.size.height - 150, self.view.frame.size.width, 100)];
    [actorName setFont:[UIFont fontWithName:@"Baskerville" size:30]];
    [actorName setTextAlignment:NSTextAlignmentCenter];
    [actorName setTextColor:[UIColor colorWithWhite:1.0f alpha:0.7]];
    
    NSString *string = @"Scarlett Johansson";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    float spacing = 5.0f;
    [attributedString addAttribute:NSKernAttributeName
                             value:@(spacing)
                             range:NSMakeRange(0, [string length])];
    
    actorName.attributedText = attributedString;
    
    [self.view addSubview:actorName];
}

- (void)addMotionEffectTo:(UIView *)view WithMax:(CGFloat)max Min:(CGFloat)min
{
    CGPoint maxMovement = CGPointMake(max, max);
    CGPoint minMovement = CGPointMake(min, min);
    
    UIInterpolatingMotionEffect *leftRightMotion = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    leftRightMotion.maximumRelativeValue = @(maxMovement.x);
    leftRightMotion.minimumRelativeValue = @(minMovement.x);
    
    UIInterpolatingMotionEffect *topDownMotion = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    topDownMotion.maximumRelativeValue = @(maxMovement.y);
    topDownMotion.minimumRelativeValue = @(minMovement.y);
    UIMotionEffectGroup *meGroup = [[UIMotionEffectGroup alloc] init];
    [meGroup setMotionEffects:@[leftRightMotion, topDownMotion]];
    
    [view addMotionEffect:meGroup];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
