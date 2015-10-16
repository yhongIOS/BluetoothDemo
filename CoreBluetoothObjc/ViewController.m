//
//  ViewController.m
//  CoreBluetoothObjc
//
//  Created by 臧其龙 on 15/10/15.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "ViewController.h"
#import "CoreBluetoothManager.h"
#import <CoreBluetooth/CoreBluetooth.h>

static NSString * const kTableViewCellId = @"kTableViewCellId";

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, CoreBluetoothManagerDelegate>
{
    CoreBluetoothManager *bluetoothManager;
    NSMutableArray *peripheralArray;
}
@property (weak, nonatomic) IBOutlet UITableView *bluetoothDeviceTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    peripheralArray = [NSMutableArray array];
    
    bluetoothManager = [[CoreBluetoothManager alloc] init];
    bluetoothManager.delegate = self;
    
    [_bluetoothDeviceTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellId];
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

#pragma mark - TableView Datasource && Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return peripheralArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellId];
    
    CBPeripheral *peripheral = peripheralArray[indexPath.row];
    cell.textLabel.text = peripheral.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark CoreBluetoothManager Delegate

- (void)coreBluetoothManagerDidScanPeripheral:(CBPeripheral *)peripheral
{
    [peripheralArray addObject:peripheral];
    [_bluetoothDeviceTableView reloadData];
}

@end
