//
//  ViewController.m
//  CoreBluetoothObjc
//
//  Created by 臧其龙 on 15/10/15.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "ViewController.h"
#import "CoreBluetoothManager.h"

@interface ViewController ()
{
    CoreBluetoothManager *bluetoothManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    bluetoothManager = [CoreBluetoothManager sharedManager];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Private Method

- (IBAction)scanAllDevices:(id)sender
{
    [bluetoothManager scanAllPeripheralDevices];
}

@end
