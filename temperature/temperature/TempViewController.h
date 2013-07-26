//
//  TempViewController.h
//  temperature
//
//  Created by  on 7/25/13.
//  Copyright (c) 2013 com.yahoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *fahrenheitTextField;
@property (nonatomic, strong) IBOutlet UITextField *celciusTextField;
@property (nonatomic, strong) IBOutlet UIButton *convertButton;
- (IBAction)operationPressed:(UIButton *)sender;
- (IBAction)onDoneButton;

@end
