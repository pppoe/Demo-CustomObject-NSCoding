//
//  RootViewController.m
//  CustomObjectDemo
//
//  Created by Haoxiang Li on 11/21/11.
//  Copyright (c) 2011 DEV. All rights reserved.
//

#import "RootViewController.h"
#import "CustomObject.h"

@implementation RootViewController

#pragma mark - IBActions
- (IBAction)saveObjectPlain:(id)sender {

    printf("==========================================\n");
    printf("saveObjectPlain===========================\n");
    printf("==========================================\n");

    //< Create and Save the Object
    {
        CustomObject *obj = [[[CustomObject alloc] init] autorelease];
        obj.stringValue = @"The String Value";
        obj.intValue    = 12345;
        obj.boolValue   = YES;
        [NSKeyedArchiver archiveRootObject:obj toFile:[self tempFilePath]];
        printf("Save: \n %s \n", [[obj description] cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    
    //< Load and Print the Object
    {
        CustomObject *obj = [NSKeyedUnarchiver unarchiveObjectWithFile:[self tempFilePath]];
        printf("Load: \n %s \n", [[obj description] cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    
    printf("==========================================\n");
}

- (IBAction)saveObjectAsKey:(id)sender {

    printf("==========================================\n");
    printf("saveObjectAsKey===========================\n");
    printf("==========================================\n");
    
    //< Create Two Keys and Save the Object
    {
        CustomObject *keyObj = [[[CustomObject alloc] init] autorelease];
        keyObj.stringValue = @"The String Value Key";
        keyObj.intValue    = 12345;
        keyObj.boolValue   = YES;

        CustomObject *valObj = [[[CustomObject alloc] init] autorelease];
        valObj.stringValue = @"The String Value Value";
        valObj.intValue    = 54321;
        valObj.boolValue   = NO;
        
        NSDictionary *dict = [NSDictionary dictionaryWithObject:valObj forKey:keyObj];
        [NSKeyedArchiver archiveRootObject:dict toFile:[self tempFilePath]];

        printf("Save: \n %s \n", [[dict description] cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    
    //< Load and Print the Object
    {
        NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithFile:[self tempFilePath]];
        printf("Load: \n %s \n", [[dict description] cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    
    printf("==========================================\n");
}

- (IBAction)saveObjectsInArray:(id)sender {

    printf("==========================================\n");
    printf("saveObjectsInArray========================\n");
    printf("==========================================\n");
    
    //< Create Two Keys and Save the Object
    {
        CustomObject *obj1 = [[[CustomObject alloc] init] autorelease];
        obj1.stringValue = @"The String Value 1";
        obj1.intValue    = 12345;
        obj1.boolValue   = YES;
        
        CustomObject *obj2 = [[[CustomObject alloc] init] autorelease];
        obj2.stringValue = @"The String Value 2";
        obj2.intValue    = 54321;
        obj2.boolValue   = NO;
        
        NSArray *array = [NSArray arrayWithObjects:obj1, obj2, nil];
        [NSKeyedArchiver archiveRootObject:array toFile:[self tempFilePath]];

        printf("Save: \n %s \n ", [[array description] cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    
    //< Load and Print the Object
    {
        NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:[self tempFilePath]];
        printf("Load: \n %s \n ", [[array description] cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    
    printf("==========================================\n");
}

#pragma mark - Methods
- (NSString *)tempFilePath {
    NSArray *urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory 
                                                           inDomains:NSUserDomainMask];
    NSString *documentDirPath = [[urls objectAtIndex:0] path];
    return [documentDirPath stringByAppendingPathComponent:@"tempFile"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
