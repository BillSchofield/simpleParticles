//
//  NSDateTimer.m
//  Particles
//
//  Created by bschofil on 9/5/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "NSDateTimer.h"


@implementation NSDateTimer
-(id)init {
	NSDate* currentTime = [[NSDate alloc] init];
	timeOfLastUpdate = [currentTime timeIntervalSince1970];
	[currentTime release];
	return self;
}

-(void) update{
	NSDate* currentTime = [[NSDate alloc] init];
	double now = [currentTime timeIntervalSince1970];
	timeUpdateInterval = now - timeOfLastUpdate;
	timeOfLastUpdate = now;
	[currentTime release];
}

-(double) lastUpdateTimeInSeconds{
	return timeUpdateInterval;
}

@end
