//
//  Timer.h
//  Particles
//
//  Created by bschofil on 8/25/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//
#import <Foundation/Foundation.h> 

@interface Timer : NSObject {
}
-(id) init;
-(void) update;
-(double) lastUpdateTimeInSeconds;

@end
