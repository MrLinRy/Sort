//
//  RadixViewController.m
//  排序APP
//
//  Created by Mr.Lin on 18/1/15.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "RadixViewController.h"
#import "SizeHeader.h"
#import "ScortMode.h"
#import "ModeManger.h"

#define leftSize LRYScreenpW(50)
@interface RadixViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation RadixViewController

-(UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, TopAndSystemHeight+LRYScreenpH(400), ScreenWidth, LRYScreenpH(800)) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight =LRYScreenpH(100);
        _tableView.scrollEnabled=NO;
        _tableView.rowHeight=UITableViewAutomaticDimension;
        [_tableView setBackgroundColor:[UIColor clearColor]];
        
    }
    return _tableView;
}


-(instancetype)init
{
    self =[super init];
    if (self)
    {
        [self.view  setBackgroundColor:[UIColor whiteColor]];
        
        
    }
    return self;
    
}
-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    topbar.hidden=YES;
    
    
#pragma mark--------------电源栏字体颜色
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    UIImageView *bgview =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [bgview setImage:[UIImage imageNamed:@"BC9A8E548B54E3A04297D4757D6720AB.jpg"]];
    [bgview setAlpha:1.5];
    [self.view addSubview:bgview];
    
    //初始化mode
    ScortMode *mode=[[ScortMode alloc]init];
    mode=[ViewManger ShareInstance].ScortArry[6];
    
    UILabel *resulttext =[[UILabel alloc]initWithFrame:CGRectMake(leftSize, TopAndSystemHeight,ScreenWidth-2*leftSize, LRYScreenpH(150))];
    resulttext.text=mode.ListScort;
    resulttext.numberOfLines=0;
    resulttext.lineBreakMode=NSLineBreakByWordWrapping;
    resulttext.textAlignment=NSTextAlignmentCenter;
    [resulttext.layer setMasksToBounds:YES];
    [resulttext.layer setCornerRadius:8];
    [resulttext.layer setBorderWidth:1];
    [resulttext.layer setBorderColor:[UIColor whiteColor].CGColor];
    [resulttext setBackgroundColor:WYKColor(252, 252, 252, 0.1)];
    [self.view addSubview:resulttext];
    
    
    UIImageView *Headimage =[[UIImageView alloc]initWithFrame:CGRectMake(5*leftSize, CGRectGetMaxY(resulttext.frame)+LRYScreenpH(100),ScreenWidth-10*leftSize, LRYScreenpH(50))];
    [Headimage setImage:[UIImage imageNamed:@"性能分析.png"]];
    [Headimage setBackgroundColor:[UIColor clearColor]];
    [Headimage.layer setMasksToBounds:YES];
    [Headimage.layer setCornerRadius:2];
    [Headimage.layer setBorderColor:WYKColor(175, 175, 175, 0.5).CGColor];
    [Headimage.layer setBorderWidth:0.2];
    [self.view addSubview:Headimage];
    
    [self.view addSubview:self.tableView];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark-------区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark-------行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
#pragma mark-------区头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return 0;
}
#pragma mark-------区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
#pragma mark-------区尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return 0;
}
#pragma mark-------区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
    
}

#pragma mark-------行视图
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //初始化mode
    ScortMode *mode=[[ScortMode alloc]init];
    mode=[ViewManger ShareInstance].ScortArry[6];
    NSArray *scortArry=[NSArray arrayWithObjects:@"复杂度.png",@"耗时.png",@"移动次数.png",@"比较次数.png", nil];
    NSArray *modeArray=[NSArray arrayWithObjects:@"O(d(n+r))",mode.TimeScort,mode.MoveScort,mode.CompScort, nil];
    if (indexPath.row ==0)
    {
        static NSString *CellID0 = @"CellID0";
        UITableViewCell *CellView0 =[tableView dequeueReusableCellWithIdentifier:CellID0];
        if (CellView0 == nil)
        {
            CellView0 =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID0];
            [CellView0 setBackgroundColor:[UIColor clearColor]];
            
            UIView *bgview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, LRYScreenpH(100))];
            UILabel *Line =[[UILabel alloc]initWithFrame:CGRectMake(leftSize,LRYScreenpH(99), ScreenWidth-2*leftSize, LRYScreenpH(1))];
            [Line setBackgroundColor:WYKColor(175, 175, 175, 0.5)];
            [bgview addSubview:Line];
            
            UIImageView *image1=[[UIImageView alloc]initWithFrame:CGRectMake(leftSize,LRYScreenpH(40) , LRYScreenpW(140), LRYScreenpH(40))];
            [image1 setImage:[UIImage imageNamed:scortArry[indexPath.row]]];
            [image1 setBackgroundColor:[UIColor clearColor]];
            [image1 setAlpha:0.8];
            [bgview addSubview:image1];
            
            UILabel *labeTime =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(image1.frame)+LRYScreenpW(340),LRYScreenpH(40) , LRYScreenpW(170), LRYScreenpH(40))];
            labeTime.textAlignment =NSTextAlignmentLeft;
            [labeTime setText:modeArray[indexPath.row]];
            [labeTime setBackgroundColor:[UIColor clearColor]];
            [bgview addSubview:labeTime];
            
            UILabel *Lines =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(labeTime.frame), CGRectGetMaxY(labeTime.frame)+LRYScreenpH(1), CGRectGetWidth(labeTime.frame), LRYScreenpH(1))];
            [Lines setBackgroundColor:WYKColor(175, 175, 175, 0.5)];
            [bgview addSubview:Lines];
            
            
            [CellView0 addSubview:bgview];
            
        }
        CellView0.tag =1000+indexPath.row;
        CellView0.selectionStyle=UITableViewCellSelectionStyleNone;
        return CellView0;
    }
    else if(indexPath.row ==1)
    {
        static NSString *CellID1 = @"CellID1";
        UITableViewCell *CellView1 =[tableView dequeueReusableCellWithIdentifier:CellID1];
        if (CellView1 == nil)
        {
            CellView1 =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID1];
            [CellView1 setBackgroundColor:[UIColor clearColor]];
            
            UIView *bgview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, LRYScreenpH(100))];
            UILabel *Line =[[UILabel alloc]initWithFrame:CGRectMake(leftSize,LRYScreenpH(99), ScreenWidth-2*leftSize, LRYScreenpH(1))];
            [Line setBackgroundColor:WYKColor(175, 175, 175, 0.5)];
            [bgview addSubview:Line];
            
            UIImageView *image1=[[UIImageView alloc]initWithFrame:CGRectMake(leftSize,LRYScreenpH(40) , LRYScreenpW(100), LRYScreenpH(40))];
            [image1 setImage:[UIImage imageNamed:scortArry[indexPath.row]]];
            [image1 setBackgroundColor:[UIColor clearColor]];
            [image1 setAlpha:0.8];
            [bgview addSubview:image1];
            
            UILabel *labeTime =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(image1.frame)+LRYScreenpW(380),LRYScreenpH(40) , LRYScreenpW(170), LRYScreenpH(40))];
            labeTime.textAlignment =NSTextAlignmentLeft;
            [labeTime setText:modeArray[indexPath.row]];
            [labeTime setBackgroundColor:[UIColor clearColor]];
            [bgview addSubview:labeTime];
            
            UILabel *Lines =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(labeTime.frame), CGRectGetMaxY(labeTime.frame)+LRYScreenpH(1), CGRectGetWidth(labeTime.frame), LRYScreenpH(1))];
            [Lines setBackgroundColor:WYKColor(175, 175, 175, 0.5)];
            [bgview addSubview:Lines];
            
            
            [CellView1 addSubview:bgview];
            
        }
        CellView1.tag =1000+indexPath.row;
        CellView1.selectionStyle=UITableViewCellSelectionStyleNone;
        return CellView1;
    }
    else
    {
        static NSString *CellID = @"CellID";
        UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
        if (CellView == nil)
        {
            CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
            [CellView setBackgroundColor:[UIColor clearColor]];
            
            UIView *bgview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, LRYScreenpH(100))];
            UILabel *Line =[[UILabel alloc]initWithFrame:CGRectMake(leftSize,LRYScreenpH(99), ScreenWidth-2*leftSize, LRYScreenpH(1))];
            [Line setBackgroundColor:WYKColor(175, 175, 175, 0.5)];
            [bgview addSubview:Line];
            
            UIImageView *image1=[[UIImageView alloc]initWithFrame:CGRectMake(leftSize,LRYScreenpH(40) , LRYScreenpW(200), LRYScreenpH(40))];
            [image1 setImage:[UIImage imageNamed:scortArry[indexPath.row]]];
            [image1 setBackgroundColor:[UIColor clearColor]];
            [image1 setAlpha:0.8];
            [bgview addSubview:image1];
            
            UILabel *labeTime =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(image1.frame)+LRYScreenpW(285),LRYScreenpH(40) , LRYScreenpW(170), LRYScreenpH(40))];
            labeTime.textAlignment =NSTextAlignmentLeft;
            [labeTime setText:modeArray[indexPath.row]];
            [labeTime setBackgroundColor:[UIColor clearColor]];
            [bgview addSubview:labeTime];
            
            UILabel *Lines =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(labeTime.frame), CGRectGetMaxY(labeTime.frame)+LRYScreenpH(1), CGRectGetWidth(labeTime.frame), LRYScreenpH(1))];
            [Lines setBackgroundColor:WYKColor(175, 175, 175, 0.5)];
            [bgview addSubview:Lines];
            
            
            [CellView addSubview:bgview];
            
        }
        CellView.tag =1000+indexPath.row;
        CellView.selectionStyle=UITableViewCellSelectionStyleNone;
        return CellView;
    }
}

#pragma mark-------行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LRYScreenpH(100);
    
}

//#pragma mark--------被选中的row
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
