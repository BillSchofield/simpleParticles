//
//  Timer.m
//  Particles
//
//  Created by bschofil on 8/25/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "Timer.h"


@implementation Timer
-(id)init {
	timeOfLastUpdate = [[NSDate alloc] init];
	return self;
}

-(void) update{
	NSDate* currentTime = [[NSDate alloc] init];
	timeUpdateInterval = [ currentTime timeIntervalSinceDate: timeOfLastUpdate];
	timeUpdateInterval /= 1000;
	[timeOfLastUpdate init];
	[ currentTime release ];
}

-(double) timeSinceLastUpdateInSeconds{
	return timeUpdateInterval;
}

-(void) dealloc {
	[timeOfLastUpdate release];
	[super dealloc];
}
@end
