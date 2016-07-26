/**
 *  说明：主要用于UILabel里面添加图片（阔以是网络图片的加载）
 *  继承...随意
 *
 */


#import <UIKit/UIKit.h>

@interface DCLabel : UILabel


@property(copy,nonatomic) NSString *networkImg; //需要插入的网络图片
@property(strong,nonatomic) UIImage *localImg; //需要插入的本地图片
@property(assign,nonatomic) NSInteger position; //需要插入的图片位置
@property(assign,nonatomic) CGRect imgSize; //图片的大小
@property(assign,nonatomic) CGFloat imgMargin; //图片的边距
@property(copy,nonatomic) NSString *dcAttributedString; //文字

@end


/**
 
    DCLabel *testLabel = [[DCLabel alloc]initWithFrame:CGRectMake(0, 100, 320, 60)];
    testLabel.backgroundColor = [UIColor lightGrayColor];
    testLabel.textAlignment = NSTextAlignmentCenter;
    testLabel.dcAttributedString = @"123456";
 
     //请务必按顺序使用 // 1:imgSize  2:networkImg||localImg 3:position 4:imgMargin
 
     testLabel.imgSize = CGRectMake(0,0,40,40);
     testLabel.networkImg = @"http://desk.fd.zol-img.com.cn/t_s960x600c5/g5/M00/05/02/ChMkJ1bxATiIVlzmAAlJIHaXmLkAAOTUgN32YEACUk4716.jpg"; //支持网络
     //testLabel.localImg = //支持本地
     testLabel.position = 0;
     testLabel.imgMargin = 10;


 */