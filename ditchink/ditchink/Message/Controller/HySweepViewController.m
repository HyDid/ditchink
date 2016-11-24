//
//  HySweepViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/11/23.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HySweepViewController.h"
#import "AVFoundation/AVFoundation.h"
@interface HySweepViewController ()<AVCaptureMetadataOutputObjectsDelegate>{
    AVCaptureSession *session;
    AVCaptureVideoPreviewLayer *layer;
}

@end

@implementation HySweepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adddQBbtn];
}
-(void)adddQBbtn{
    UIButton *zhBtn = [UIButton buttonWithType:0];
    zhBtn.frame = CGRectMake(75, 100, self.view.bounds.size.width - 150, 60);
    [zhBtn setTitle:@"点我进行扫描二维码" forState:0];
    [zhBtn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    zhBtn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:zhBtn];
}
-(void)BtnClick{
    //获取设备对象
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //初始化链接对象
    session = [[AVCaptureSession alloc]init];
    //创建输入流
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    NSError *error = nil;
    if (input) {
        [session addInput:input];
    }else{
        NSLog(@"error---%@",[error localizedDescription]);
    }
    //创建输出流
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc]init];
    //设置代理,在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    //高质量采集率
    [session setSessionPreset:AVCaptureSessionPresetHigh];
    [session addOutput:output];
    //设置扫描支持的编码格式（如下设置条形码和二维码兼容）
    output.metadataObjectTypes = @[];
    layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    //设置相机扫描仪大小
    layer.frame = CGRectMake(50, 170, 280, 200);
    [self.view.layer insertSublayer:layer atIndex:0];
    //开始捕获
    [session startRunning];
    
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    NSString *zhQRCode = nil;
    for (AVMetadataObject *meatdata in metadataObjects) {
        if ([meatdata.type isEqualToString:AVMetadataObjectTypeQRCode]) {
 //           zhQRCode = [(AVMetadataMachineReadableCodeObject *)meatdata stringvalue];
            break;
        }
    }
    [session stopRunning];
}


@end
