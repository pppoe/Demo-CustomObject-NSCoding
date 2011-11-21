//
//  CustomObject.m
//  CustomObjectDemo
//
//  Created by Haoxiang Li on 11/21/11.
//  Copyright (c) 2011 DEV. All rights reserved.
//

#import "CustomObject.h"

#define kEncodeKeyStringValue   @"kEncodeKeyStringValue" 
#define kEncodeKeyIntValue      @"kEncodeKeyIntValue" 
#define kEncodeKeyBOOLValue     @"kEncodeKeyBOOLValue" 

@implementation CustomObject
@synthesize stringValue, intValue, boolValue;

- (void)dealloc {
    self.stringValue = nil;
    [super dealloc];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"String:%@ \n Int: %d \n BOOL: %@ \n ", 
            self.stringValue, 
            self.intValue,
            (self.boolValue ? @"YES" : @"NO")];
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.stringValue   forKey:kEncodeKeyStringValue];
    [aCoder encodeInt:self.intValue         forKey:kEncodeKeyIntValue];
    [aCoder encodeBool:self.boolValue       forKey:kEncodeKeyBOOLValue];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super init]))
    {
        self.stringValue = [aDecoder decodeObjectForKey:kEncodeKeyStringValue];
        self.intValue    = [aDecoder decodeIntForKey:kEncodeKeyIntValue];
        self.boolValue   = [aDecoder decodeBoolForKey:kEncodeKeyBOOLValue];
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    CustomObject *copy = [[CustomObject allocWithZone:zone] init];
    copy.stringValue = [[self.stringValue copy] autorelease];
    copy.intValue = self.intValue;
    copy.boolValue = self.boolValue;
    return copy;
}

@end
