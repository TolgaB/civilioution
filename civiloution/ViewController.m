//
//  ViewController.m
//  civiloution
//
//  Created by Tolga Beser on 3/19/15.
//  Copyright (c) 2015 Tolga Beser. All rights reserved.
//

#import "ViewController.h"
#import <SIOSocket/SIOSocket.h>


@interface ViewController ()

@property SIOSocket *socket;
@property BOOL socketIsConnected;

@end

@implementation ViewController {
    NSMutableArray *questionsArray;
    NSMutableArray *voteArray;
    UILabel *voteCounter1;
     UILabel*voteCounter2;
     UILabel *voteCounter3;
    UILabel *voteCounter4;
    UILabel *voteCounter5;
     UILabel *voteCounter6;
     UILabel *voteCounter7;
     UILabel *voteCounter8;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    questionsArray = [[NSMutableArray alloc] init];
    voteArray = [[NSMutableArray alloc] init];
    
    [SIOSocket socketWithHost: @"http://45.55.138.146:3000" response: ^(SIOSocket *socket)
     {
         self.socket = socket;
         
         __weak typeof(self) weakSelf = self;
         self.socket.onConnect = ^()
         {
             weakSelf.socketIsConnected = YES;
            
             
            };
         
         [self.socket on:@"join" callback: ^(SIOParameterArray *args)
          {
              NSLog(@"Connected to server");
          }];
         
         [self.socket on:@"sendBeginData" callback: ^(SIOParameterArray *args)
          {
              NSArray *tempquestionsArray = [args firstObject];
              NSArray *tempVoteArray = [args lastObject];
              voteArray = tempVoteArray;
              questionsArray = tempquestionsArray;
              dispatch_async(dispatch_get_main_queue(), ^{
                  [self setUpVoteList];
              });
             
          }];
         
        
         
     }];
    
    
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setUpVoteList {
    
    for (int i = 0; i < questionsArray.count; i++) {
        
        NSString *tempQuestionString = questionsArray[i];
        
        UIButton  *tempQuestionlabel = [[UIButton alloc] initWithFrame:CGRectMake(0, 70 + (i * 100), 300, 50)];
        tempQuestionlabel.backgroundColor = [UIColor clearColor];
        tempQuestionlabel.tag = i;
        [tempQuestionlabel addTarget:self
                     action:@selector(questionButtonPressed:)
           forControlEvents:UIControlEventTouchUpInside];
        [tempQuestionlabel setTitle:tempQuestionString forState:UIControlStateNormal];
        [tempQuestionlabel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [tempQuestionlabel.titleLabel setFont:[UIFont fontWithName:@"Avenir-Next" size:50.0]];
        [self.view addSubview:tempQuestionlabel];
        
        UIButton *tempUpButton;
        UIButton *tempDownButton;
        
        
        
        UIButton *buttonUp = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        buttonUp.tag = i;
        [buttonUp addTarget:self
                   action:@selector(upButtonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
        [buttonUp setImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal ];
        [buttonUp setTintColor:[UIColor whiteColor]];
        buttonUp.frame = CGRectMake(340, 70 + (i * 100), 25, 25.0);
        [self.view addSubview:buttonUp];
        
        
        UIButton *buttonDown = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        buttonDown.tag = i;
        [buttonDown addTarget:self
                     action:@selector(downButtonPressed:)
           forControlEvents:UIControlEventTouchUpInside];
        [buttonDown setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal ];
        [buttonDown setTintColor:[UIColor whiteColor]];
        buttonDown.frame = CGRectMake(340, 130 + (i * 100), 25, 25);
        [self.view addSubview:buttonDown];
    
        [self setUpCounterLabel:i];
      
        
        
        
    }
}

-(void)setUpCounterLabel: (int)i {
   
        if (i == 0) {
             [voteCounter1 removeFromSuperview];
            voteCounter1 = [[UILabel alloc] initWithFrame:CGRectMake(300, 85 + (i * 100), 100, 50)];
            voteCounter1.backgroundColor = [UIColor clearColor];
            voteCounter1.textAlignment = UITextAlignmentCenter; // UITextAlignmentCenter, UITextAlignmentLeft
            voteCounter1.textColor=[UIColor blackColor];
            NSNumber *tempVoteNumber = voteArray[i];
            int voteNumber = [tempVoteNumber intValue];
            
            NSString *tempVoteStringFormat = [NSString stringWithFormat:@"%d", voteNumber];
            
            voteCounter1.text = tempVoteStringFormat;
            [self.view addSubview:voteCounter1];
            
        }
        if (i == 1) {
            [voteCounter2 removeFromSuperview];
            voteCounter2 = [[UILabel alloc] initWithFrame:CGRectMake(300, 85 + (i * 100), 100, 50)];
            voteCounter2.backgroundColor = [UIColor clearColor];
           voteCounter2.textAlignment = UITextAlignmentCenter; // UITextAlignmentCenter, UITextAlignmentLeft
            voteCounter2.textColor=[UIColor blackColor];
            NSNumber *tempVoteNumber = voteArray[i];
            int voteNumber = [tempVoteNumber intValue];
            
            NSString *tempVoteStringFormat = [NSString stringWithFormat:@"%d", voteNumber];
            
            voteCounter2.text = tempVoteStringFormat;
            [self.view addSubview:voteCounter2];
            
        }
        if (i == 2) {
             [voteCounter3 removeFromSuperview];
            voteCounter3 = [[UILabel alloc] initWithFrame:CGRectMake(300, 85 + (i * 100), 100, 50)];
            voteCounter3.backgroundColor = [UIColor clearColor];
            voteCounter3.textAlignment = UITextAlignmentCenter; // UITextAlignmentCenter, UITextAlignmentLeft
            voteCounter3.textColor=[UIColor blackColor];
            NSNumber *tempVoteNumber = voteArray[i];
            int voteNumber = [tempVoteNumber intValue];
            
            NSString *tempVoteStringFormat = [NSString stringWithFormat:@"%d", voteNumber];
            
            voteCounter3.text = tempVoteStringFormat;
            [self.view addSubview:voteCounter3];
        }
        if (i == 3) {
             [voteCounter4 removeFromSuperview];
            voteCounter4 = [[UILabel alloc] initWithFrame:CGRectMake(300, 85 + (i * 100), 100, 50)];
            voteCounter4.backgroundColor = [UIColor clearColor];
            voteCounter4.textAlignment = UITextAlignmentCenter; // UITextAlignmentCenter, UITextAlignmentLeft
            voteCounter4.textColor=[UIColor blackColor];
            NSNumber *tempVoteNumber = voteArray[i];
            int voteNumber = [tempVoteNumber intValue];
            
            NSString *tempVoteStringFormat = [NSString stringWithFormat:@"%d", voteNumber];
            
            voteCounter4.text = tempVoteStringFormat;
            [self.view addSubview:voteCounter4];
        }
        if (i == 4) {
             [voteCounter5 removeFromSuperview];
            voteCounter5 = [[UILabel alloc] initWithFrame:CGRectMake(300, 85 + (i * 100), 100, 50)];
            voteCounter5.backgroundColor = [UIColor clearColor];
            voteCounter5.textAlignment = UITextAlignmentCenter; // UITextAlignmentCenter, UITextAlignmentLeft
            voteCounter5.textColor=[UIColor blackColor];
            NSNumber *tempVoteNumber = voteArray[i];
            int voteNumber = [tempVoteNumber intValue];
            
            NSString *tempVoteStringFormat = [NSString stringWithFormat:@"%d", voteNumber];
            
            voteCounter5.text = tempVoteStringFormat;
            [self.view addSubview:voteCounter5];
        }
        if (i == 5) {
             [voteCounter6 removeFromSuperview];
            voteCounter6 = [[UILabel alloc] initWithFrame:CGRectMake(300, 85 + (i * 100), 100, 50)];
            voteCounter6.backgroundColor = [UIColor clearColor];
            voteCounter6.textAlignment = UITextAlignmentCenter; // UITextAlignmentCenter, UITextAlignmentLeft
            voteCounter6.textColor=[UIColor blackColor];
            NSNumber *tempVoteNumber = voteArray[i];
            int voteNumber = [tempVoteNumber intValue];
            
            NSString *tempVoteStringFormat = [NSString stringWithFormat:@"%d", voteNumber];
            
            voteCounter6.text = tempVoteStringFormat;
            [self.view addSubview:voteCounter6];
            
        }
        if (i == 6) {
             [voteCounter7 removeFromSuperview];
            voteCounter7 = [[UILabel alloc] initWithFrame:CGRectMake(300, 85 + (i * 100), 100, 50)];
            voteCounter7.backgroundColor = [UIColor clearColor];
            voteCounter7.textAlignment = UITextAlignmentCenter; // UITextAlignmentCenter, UITextAlignmentLeft
            voteCounter1.textColor=[UIColor blackColor];
            NSNumber *tempVoteNumber = voteArray[i];
            int voteNumber = [tempVoteNumber intValue];
            
            NSString *tempVoteStringFormat = [NSString stringWithFormat:@"%d", voteNumber];
            
            voteCounter7.text = tempVoteStringFormat;
            [self.view addSubview:voteCounter7];
        }
        if (i == 7) {
             [voteCounter2 removeFromSuperview];
            voteCounter8 = [[UILabel alloc] initWithFrame:CGRectMake(300, 85 + (i * 100), 100, 50)];
            voteCounter8.backgroundColor = [UIColor clearColor];
            voteCounter8.textAlignment = UITextAlignmentCenter; // UITextAlignmentCenter, UITextAlignmentLeft
            voteCounter8.textColor=[UIColor blackColor];
            NSNumber *tempVoteNumber = voteArray[i];
            int voteNumber = [tempVoteNumber intValue];
            
            NSString *tempVoteStringFormat = [NSString stringWithFormat:@"%d", voteNumber];
            
            voteCounter8.text = tempVoteStringFormat;
            [self.view addSubview:voteCounter8];
        }
        
    }
    





-(void)upButtonPressed:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    int tag = theButton.tag;
    NSString *tempQuestionString = questionsArray[tag];
    [self.socket emit: @"upVote" args:@[tempQuestionString]];
    
}

-(void)downButtonPressed:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    int tag = theButton.tag;
    NSString *tempQuestionString = questionsArray[tag];
    [self.socket emit:@"downVote" args:@[tempQuestionString]];
    
}
-(void)questionButtonPressed:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    int tag = theButton.tag;
    
    NSString *tempQuestionString = questionsArray[tag];
    [[NSUserDefaults standardUserDefaults] setObject:tempQuestionString forKey:@"questionToRetrieveComments"];
    
    [self performSegueWithIdentifier:@"goToComments" sender:@"Self"];

    
    
}

@end
