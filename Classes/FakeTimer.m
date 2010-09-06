//
//  FakeTimer.m
//  Particles
//
//  Created by bschofil on 9/5/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "FakeTimer.h"


@implementation FakeTimer
-(id)init {
	timeUpdateInterval = 0;
	return self;
}

-(void) timeUpdateInterval: (double) sourceTimeInterval {
	timeUpdateInterval = sourceTimeInterval;
}

-(void) update{
}

-(double) lastUpdateTimeInSeconds{
	return timeUpdateInterval;
}

@end
