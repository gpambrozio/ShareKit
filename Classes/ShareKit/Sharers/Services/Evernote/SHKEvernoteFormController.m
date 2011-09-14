//
//  SHKEvernoteFormController.m
//  PhotoScribe
//
//  Created by Gustavo Ambrozio on 14/9/11.
//  Copyright 2011 CodeCrop Software. All rights reserved.
//

#import "SHKEvernoteFormController.h"


@implementation SHKEvernoteFormController

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.f, 60.0f)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:SHKLocalizedString(@"Create a free account at %@", @"Evernote.com") forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goToEvernote) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor clearColor];
    btn.frame = CGRectMake(9.0f, 10.0f, 302.0f, 50.0f);
    [view addSubview:btn];
    view.backgroundColor = [UIColor clearColor];
    return [view autorelease];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 60.0f;
}

- (void)goToEvernote
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.evernote.com/Registration.action"]];
}

@end
