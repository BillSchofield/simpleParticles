//
//  RandomFloat.m
//  Particles
//
//  Created by bschofil on 8/28/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "RandomFloat.h"


@implementation RandomFloat

+ (float) randomFrom: (float) lowerBound to: (float) upperBound
{
	static int largeNumber = 65535;
	float difference = upperBound - lowerBound;
	return (random()%largeNumber)*difference/largeNumber + lowerBound;
}
@end
