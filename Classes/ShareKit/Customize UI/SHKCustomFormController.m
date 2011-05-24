//
//  SHKCustomFormController.m
//  ShareKit
//
//  Created by Nathan Weiner on 6/28/10.

//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//

#import "SHKCustomFormController.h"


@implementation SHKCustomFormController

// See http://getsharekit.com/customize/ for additional information on customizing

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Change the background color to something yellow/paperishy
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fundo.png"]];
}

// Create a custom footer label so we can style it
- (UIView *)tableView:(UITableView *)tableView 
viewForFooterInSection:(NSInteger)section
{
	NSString *footerTitle = [self tableView:tableView 
                    titleForFooterInSection:section];
    
	if (footerTitle)
	{
		// Create a view to put the label in so we have some padding
        CGRect wrapperFrame = CGRectMake(0,0,tableView.frame.size.width,50);
		UIView *wrapper = [[UIView alloc] initWithFrame:wrapperFrame];
		wrapper.autoresizesSubviews = YES;
		wrapper.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		
		// Create the label
		CGRect labelFrame = CGRectMake(round(tableView.frame.size.width/2-300/2),
                                       0,
                                       300,
                                       50);
		UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
		label.backgroundColor = [UIColor clearColor];
		label.opaque = NO;
		label.textColor = [UIColor whiteColor];
		label.font = [UIFont systemFontOfSize:14];
		
		label.textAlignment = UITextAlignmentCenter;
		label.lineBreakMode = UILineBreakModeWordWrap;
		label.numberOfLines = 0;
		
		label.text = footerTitle;
		
		label.autoresizesSubviews = YES;
		label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
		
		[wrapper addSubview:label];
		[label release];
		
		return [wrapper autorelease];
	}
	
	return nil;
}

// Set the height of our label (when we have one to display)
- (CGFloat)tableView:(UITableView *)tableView 
heightForFooterInSection:(NSInteger)section
{
	NSString *footerTitle = [self tableView:tableView 
                    titleForFooterInSection:section];

	if (footerTitle)
		return 50;
	
	return 0;
}

@end
