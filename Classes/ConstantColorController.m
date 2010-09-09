#import "ConstantColorController.h"


@implementation ConstantColorController

-(float) randomFrom: (float) lowerBound toMaximum: (float) upperBound
{
	int largeNumber = 65536;
	float difference = upperBound - lowerBound;
	return (random()%largeNumber)*difference/largeNumber + lowerBound;
}

-(id) initWithColors:(Color*) colors withNumberOfColors: (int) numberOfColors;
{
	for (int i=0; i<numberOfColors; ++i) 
	{		
		colors[i].red = 255 * [self randomFrom:0.0 toMaximum:1.0];
		colors[i].green	= 255 * [self randomFrom:0.0 toMaximum:1.0];
		colors[i].blue = 255 * [self randomFrom:0.0 toMaximum:1.0];
		colors[i].alpha = 255 * [self randomFrom:0.4 toMaximum:1.0];
	}
	
	return self;
}

-(void) update
{
}
@end
