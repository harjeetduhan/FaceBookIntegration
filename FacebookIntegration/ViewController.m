//
//  ViewController.m
//  FacebookIntegration
//
//  Created by macserver on 8/31/16.
//  Copyright © 2016 macserver. All rights reserved.


#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    
    self.myFriends=[[NSMutableArray alloc] init];
    self.loginButton.delegate = self;
    [self toggleHiddenState:YES];
    self.lblLoginStatus.text = @"";
    self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends",@"user_birthday",@"read_custom_friendlists"];
//    //,@"friends_birthday"
    
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)toggleHiddenState:(BOOL)shouldHide
{
    self.lblUserName.hidden = shouldHide;
    self.lblEmail.hidden = shouldHide;
    self.profilePicture.hidden = shouldHide;
}

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
   self.lblLoginStatus.text=@"You are logged now";
    [self toggleHiddenState:NO];
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    self.profilePicture.profileID=user.objectID;
    self.lblUserName.text = user.name;
    self.lblEmail.text = [user objectForKey:@"email"];
    
  
//    //get fb frinds list
    [FBRequestConnection startWithGraphPath:@"me/friends"
                                 parameters:@{@"fields": @"name"}
                                 HTTPMethod:@"GET"
                          completionHandler:^( FBRequestConnection *connection,  id result, NSError *error )
                            {
                              NSLog(@"me/friends result=%@",result);
                              NSLog(@"me/friends error = %@", error.description);
                              
                              NSArray *friendList = [result objectForKey:@"data"];
                              [_myFriends addObjectsFromArray: friendList];
                              for (NSDictionary<FBGraphUser> *friend in result)
                              {
                                  NSLog(@"%@:%@", [friend name],[friend birthday]);
                              }
                          }];
                NSLog(@"%@",_myFriends);
}


-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
      self.lblLoginStatus.text=@"You are logged out now";
        [self toggleHiddenState:YES];
}

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error
{
    NSLog(@"%@", [error localizedDescription]);
}

@end
