//
//  FirstViewController.m
//  排序APP
//
//  Created by Mr.Lin on 18/1/15.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "FirstViewController.h"
#import "SizeHeader.h"
#import "ViewManger.h"
#import "StraightViewController.h"
#import "QuickViewController.h"
#import "ShellViewController.h"
#import "MaoViewController.h"
#import "HeapViewController.h"
#import "MergeViewController.h"
#import "RadixViewController.h"
#import "ScortMode.h"
#import "ModeManger.h"
#define leftSize LRYScreenpW(50)
@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation FirstViewController

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
    mode=[ViewManger ShareInstance].ScortArry[0];

    

    UILabel *resulttext =[[UILabel alloc]initWithFrame:CGRectMake(leftSize, TopAndSystemHeight,ScreenWidth-2*leftSize, LRYScreenpH(150))];
    resulttext.textAlignment=NSTextAlignmentCenter;
    resulttext.text=mode.ListScort;
    resulttext.numberOfLines=0;
    resulttext.lineBreakMode=NSLineBreakByWordWrapping;
    [resulttext.layer setMasksToBounds:YES];
    [resulttext.layer setCornerRadius:8];
    [resulttext.layer setBorderWidth:1];
    [resulttext.layer setBorderColor:[UIColor whiteColor].CGColor];
    [resulttext setBackgroundColor:WYKColor(252, 252, 252, 0.1)];
    [self.view addSubview:resulttext];
    
    
    UIImageView *Headimage =[[UIImageView alloc]initWithFrame:CGRectMake(5*leftSize, CGRectGetMaxY(resulttext.frame)+LRYScreenpH(100),ScreenWidth-10*leftSize, LRYScreenpH(50))];
    [Headimage setImage:[UIImage imageNamed:@"排序方法.png"]];
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
    return 7;
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
    NSArray *scortArry=[NSArray arrayWithObjects:@"直接排序.png",@"快速排序.png",@"希尔排序.png",@"冒泡排序.png",@"堆排序.png",@"归并排序.png",@"基排序.png", nil];
    if (indexPath.row ==4|| indexPath.row == 6)
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
            [image1 setBackgroundColor:[UIColor clearColor]];
            [image1 setAlpha:0.7];
            [image1 setImage:[UIImage imageNamed:scortArry[indexPath.row]]];
            [bgview addSubview:image1];
            
//            UILabel *labeTime =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(image1.frame)+LRYScreenpW(355),LRYScreenpH(40) , LRYScreenpW(40), LRYScreenpH(40))];
//            [labeTime setBackgroundColor:[UIColor redColor]];
//            [labeTime.layer setMasksToBounds:YES];
//            [labeTime.layer setBorderColor:[UIColor whiteColor].CGColor];
//            [labeTime.layer setBorderWidth:0.5];
//            [labeTime.layer setCornerRadius:4];
//            [bgview addSubview:labeTime];
//            
//            UILabel *labeCom =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(labeTime.frame)+LRYScreenpW(20),LRYScreenpH(40) , LRYScreenpW(40), LRYScreenpH(40))];
//            [labeCom setBackgroundColor:[UIColor redColor]];
//            [labeCom.layer setMasksToBounds:YES];
//            [labeCom.layer setBorderColor:[UIColor whiteColor].CGColor];
//            [labeCom.layer setBorderWidth:0.5];
//            [labeCom.layer setCornerRadius:4];
//            [bgview addSubview:labeCom];
//            
//            UILabel *labeMove =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(labeCom.frame)+LRYScreenpW(20),LRYScreenpH(40) , LRYScreenpW(40), LRYScreenpH(40))];
//            [labeMove setBackgroundColor:[UIColor redColor]];
//            [labeMove.layer setMasksToBounds:YES];
//            [labeMove.layer setBorderColor:[UIColor whiteColor].CGColor];
//            [labeMove.layer setBorderWidth:0.5];
//            [labeMove.layer setCornerRadius:4];
//            [bgview addSubview:labeMove];
            
            [CellView0 addSubview:bgview];
            
        }
        CellView0.tag =1000+indexPath.row;
        CellView0.selectionStyle=UITableViewCellSelectionStyleNone;
        return CellView0;

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
            [image1 setBackgroundColor:[UIColor clearColor]];
            [image1 setAlpha:0.7];
            [image1 setImage:[UIImage imageNamed:scortArry[indexPath.row]]];
            [bgview addSubview:image1];
            
//            UILabel *labeTime =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(image1.frame)+LRYScreenpW(295),LRYScreenpH(40) , LRYScreenpW(40), LRYScreenpH(40))];
//            [labeTime setBackgroundColor:[UIColor redColor]];
//            [labeTime.layer setMasksToBounds:YES];
//            [labeTime.layer setBorderColor:[UIColor whiteColor].CGColor];
//            [labeTime.layer setBorderWidth:0.5];
//            [labeTime.layer setCornerRadius:4];
//            [bgview addSubview:labeTime];
//            
//            UILabel *labeCom =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(labeTime.frame)+LRYScreenpW(20),LRYScreenpH(40) , LRYScreenpW(40), LRYScreenpH(40))];
//            [labeCom setBackgroundColor:[UIColor redColor]];
//            [labeCom.layer setMasksToBounds:YES];
//            [labeCom.layer setBorderColor:[UIColor whiteColor].CGColor];
//            [labeCom.layer setBorderWidth:0.5];
//            [labeCom.layer setCornerRadius:4];
//            [bgview addSubview:labeCom];
//            
//            UILabel *labeMove =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(labeCom.frame)+LRYScreenpW(20),LRYScreenpH(40) , LRYScreenpW(40), LRYScreenpH(40))];
//            [labeMove setBackgroundColor:[UIColor redColor]];
//            [labeMove.layer setMasksToBounds:YES];
//            [labeMove.layer setBorderColor:[UIColor whiteColor].CGColor];
//            [labeMove.layer setBorderWidth:0.5];
//            [labeMove.layer setCornerRadius:4];
//            [bgview addSubview:labeMove];
            
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

#pragma mark--------被选中的row
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0)
    {
        StraightViewController *StraightView=[[StraightViewController alloc]init];
        [[ViewManger ShareInstance].Navigationcontroler pushViewController:StraightView animated:YES];
    }
    else if (indexPath.row ==1)
    {
        QuickViewController *StraightView=[[QuickViewController alloc]init];
        [[ViewManger ShareInstance].Navigationcontroler pushViewController:StraightView animated:YES];
    }
    else if (indexPath.row ==2)
    {
        ShellViewController *StraightView=[[ShellViewController alloc]init];
        [[ViewManger ShareInstance].Navigationcontroler pushViewController:StraightView animated:YES];
    }
    else if (indexPath.row ==3)
    {
        MaoViewController *StraightView=[[MaoViewController alloc]init];
        [[ViewManger ShareInstance].Navigationcontroler pushViewController:StraightView animated:YES];
    }
    else if (indexPath.row ==4)
    {
        HeapViewController *StraightView=[[HeapViewController alloc]init];
        [[ViewManger ShareInstance].Navigationcontroler pushViewController:StraightView animated:YES];
    }
    else if (indexPath.row ==5)
    {
        MergeViewController *StraightView=[[MergeViewController alloc]init];
        [[ViewManger ShareInstance].Navigationcontroler pushViewController:StraightView animated:YES];
    }
    else
    {
        RadixViewController *StraightView=[[RadixViewController alloc]init];
        [[ViewManger ShareInstance].Navigationcontroler pushViewController:StraightView animated:YES];
    }
}

@end
