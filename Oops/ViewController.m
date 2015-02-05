//
//  ViewController.m
//  Oops
//
//  Created by AFLDLF on 02/02/15.
//  Copyright (c) 2015 AFLDLF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doCalculation];
    //[self superClassMethod];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)doCalculation
{
    //you can use any string instead "com.mycompany.myqueue"
    dispatch_queue_t backgroundQueue = dispatch_queue_create("com.mycompany.myqueue", 0);
    
    dispatch_async(backgroundQueue, ^{
        int result = 5656;

        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"dispatch_get_main_queue");
            [self updateMyUIWithResult:result];
        });
    });
}
- (void) updateMyUIWithResult:(int)r{
    NSLog(@"updateMyUIWithResult");

    self.labelResult.text = [NSString stringWithFormat:@"%d",r];
    //[self performSelectorOnMainThread:@selector(updateLabel:) withObject:nil waitUntilDone:NO];
}
- (void) updateLabel{
}

- (NSString*) superClassMethod{
    //NSLog(@"superClassMethod");
    return @"superClassMethod";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
