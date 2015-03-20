//
//  CommentViewController.m
//  civiloution
//
//  Created by Tolga Beser on 3/19/15.
//  Copyright (c) 2015 Tolga Beser. All rights reserved.
//

#import "CommentViewController.h"
#import <SIOSocket/SIOSocket.h>

@interface CommentViewController ()

@property SIOSocket *socket;
@property BOOL socketIsConnected;

@end

@implementation CommentViewController {
    NSMutableArray *commentsArray;
    UILabel *titleLabel;
    IBOutlet UITextField *commentTextField;
    IBOutlet UIButton *sendButton;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [commentTextField addTarget:commentTextField
                  action:@selector(resignFirstResponder)
        forControlEvents:UIControlEventEditingDidEndOnExit];
    
    commentsArray = [[NSMutableArray alloc] init];
    
    NSString *tempQuestionString = [[NSUserDefaults standardUserDefaults] objectForKey:@"questionToRetrieveComments"];
    
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 300, 50)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = tempQuestionString;
    [self.view addSubview:titleLabel];
    
    
    [SIOSocket socketWithHost: @"http://45.55.138.146:3000" response: ^(SIOSocket *socket)
     {
         self.socket = socket;
         
         __weak typeof(self) weakSelf = self;
         self.socket.onConnect = ^()
         {
             weakSelf.socketIsConnected = YES;
             
             
         };
         
         [self.socket on:@"joinOnComment" callback: ^(SIOParameterArray *args)
          {
              NSLog(@"Connected to server");
              [self.socket emit:@"retrieveCommentData" args:@[tempQuestionString]];
          }];
         
         
         [self.socket on:@"sendCommentBeginData" callback: ^(SIOParameterArray *args)
          {
              NSArray *tempArray = [args firstObject];
              commentsArray = tempArray;
            
            [self setUpCommentList];
              
          }];
         
         
         
     }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)setUpCommentList {
    for (int i = 0; i < commentsArray.count; i++) {
        NSString *tempCommentString = commentsArray[i];
        
        UILabel  *tempCommentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 70 + (i * 50), 400, 50)];
        tempCommentLabel.backgroundColor = [UIColor clearColor];
        tempCommentLabel.textColor = [UIColor blackColor];
        tempCommentLabel.text = tempCommentString;
        [self.view addSubview:tempCommentLabel];
    }
}
- (IBAction)sendButtonPressed:(id)sender {
     NSString *tempQuestionString = [[NSUserDefaults standardUserDefaults] objectForKey:@"questionToRetrieveComments"];
    NSString *tempCommentText = commentTextField.text;
    [self.socket emit:@"commentUpdate" args:@[tempCommentText, tempQuestionString]];
}
- (IBAction)backButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"goToMain" sender:@"Self"];
}

@end
