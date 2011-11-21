//
//  CustomObject.h
//  CustomObjectDemo
//
//  Created by Haoxiang Li on 11/21/11.
//  Copyright (c) 2011 DEV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomObject : NSObject <NSCoding, NSCopying> {
    NSString*   mStringValue;
    int         mIntValue;
    BOOL        mBOOLValue;
}

@property (nonatomic, retain) NSString *stringValue;
@property (nonatomic, assign) int       intValue;
@property (nonatomic, assign) BOOL      boolValue;

@end
