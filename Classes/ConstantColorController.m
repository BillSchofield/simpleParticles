//
//  ConstantColorController.m
//  Particles
//
//  Created by bschofil on 8/12/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "ConstantColorController.h"


@implementation ConstantColorController

-(float) randomFrom: (float) lowerBound toMaximum: (float) upperBound
{
	int largeNumber = 65536;
	float difference = upperBound - lowerBound;
	return (random()%largeNumber)*difference/largeNumber + lowerBound;
}

-(id) initWithColors:(Color3D*) colors withNumberOfColors: (int) numberOfColors;
{
	for (int i=0; i<numberOfColors; ++i) 
	{		
		colors[i].red = random()%1000/1000.0;
		colors[i].green	= random()%1000/1000.0;
		colors[i].blue = random()%1000/1000.0;
		colors[i].alpha = random()%400/1000.0 + 600;
	}
	
	return self;
}

-(void) update
{
}
@end
