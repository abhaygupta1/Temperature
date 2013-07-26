//
//  TempViewController.m
//  temperature
//
//  Created by  on 7/25/13.
//  Copyright (c) 2013 com.yahoo. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()

@property (nonatomic, strong) UITextField *currentTextField;
- (void) updateValues;
@end

@implementation TempViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fahrenheitTextField.delegate = self;
    self.celciusTextField.delegate = self;
    self.currentTextField = nil;
    self.fahrenheitTextField.text = @"212";
    self.celciusTextField.text = @"100";
}

- (IBAction)operationPressed:(UIButton *)sender {
    [self updateValues];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                              action:@selector(onDoneButton)];
    self.currentTextField = textField;
    return YES;
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    [self updateValues];
    self.currentTextField = nil;
    return YES;
}


#pragma mark - Private methods
- (void) onDoneButton {
    [self.view endEditing:YES];
    
}

#pragma mark - Public methods

- (void) updateValues {
    if (self.currentTextField == self.fahrenheitTextField) {
        float fahrenheitValue = [self.fahrenheitTextField.text floatValue];
        float celciusValue = (fahrenheitValue - 32)/1.8;
        self.celciusTextField.text = [NSString stringWithFormat:@"%0.02f", celciusValue];
    }
    else if (self.currentTextField == self.celciusTextField) {
        float celciusValue = [self.celciusTextField.text floatValue];
        float fahrenheitValue = celciusValue * 1.8 + 32;
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.02f", fahrenheitValue];
    }
    
}

@end
