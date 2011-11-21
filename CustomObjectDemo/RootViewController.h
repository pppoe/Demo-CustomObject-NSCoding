//
//  RootViewController.h
//  CustomObjectDemo
//
//  Created by Haoxiang Li on 11/21/11.
//  Copyright (c) 2011 DEV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

- (IBAction)saveObjectPlain:(id)sender;
- (IBAction)saveObjectAsKey:(id)sender;
- (IBAction)saveObjectsInArray:(id)sender;

- (NSString *)tempFilePath;

@end
