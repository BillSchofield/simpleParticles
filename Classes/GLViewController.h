#import <UIKit/UIKit.h>
#import "GLView.h"
#import "Application.h"


@interface GLViewController : UIViewController < GLViewDelegate >
{
	Application* application;
}

@end
