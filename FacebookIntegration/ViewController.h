//
//  ViewController.h
//  FacebookIntegration
//
//  Created by macserver on 8/31/16.
//  Copyright © 2016 macserver. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <FacebookSDK/FacebookSDK.h>

@interface ViewController : UIViewController <FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePicture;
@property (weak, nonatomic) IBOutlet FBLoginView *loginButton;


@property (strong, nonatomic) IBOutlet UILabel *lblLoginStatus;
@property (strong, nonatomic) IBOutlet UILabel *lblUserName;
@property (strong, nonatomic) IBOutlet UILabel *lblEmail;
@property (strong, nonatomic) NSMutableArray *myFriends;


@end

