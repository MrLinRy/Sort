//
//  HomeViewController.m
//  排序APP
//
//  Created by Mr.Lin on 18/1/15.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "HomeViewController.h"
#import "SizeHeader.h"
#import "ViewManger.h"
#import "SearchBarTextField.h"
#import "FirstViewController.h"
#import "ScortMode.h"
#import "ModeManger.h"
#define leftSize LRYScreenpW(50)
#define SEACHBAR 1001

@interface HomeViewController ()
{
    int compare2;
    int compareb;
    int moveb;
    int comparess;
    int movess;
    int move2;
    int compare4;
    int move4;
    int compare5;
    int move5;
    int compare6;
    int move6;
    NSMutableArray *quickarr;
    NSMutableArray *Megarr;
    NSMutableArray *heaparr;
}

@end

@implementation HomeViewController


-(instancetype)init
{
    self =[super init];
    if (self)
    {
        
        
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
    [self.view setBackgroundColor:[UIColor blackColor]];
    UIImageView *bgview =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [bgview setImage:[UIImage imageNamed:@"BC9A8E548B54E3A04297D4757D6720AB.jpg"]];
    [bgview setAlpha:1.5];
    [self.view addSubview:bgview];
#pragma mark--------------电源栏字体颜色
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    UIImageView *Headimage =[[UIImageView alloc]initWithFrame:CGRectMake((ScreenWidth-LRYScreenpW(200))/2, LRYScreenpH(70), LRYScreenpW(200), LRYScreenpH(200))];
    [Headimage setBackgroundColor:[UIColor clearColor]];
    [Headimage setImage:[UIImage imageNamed:@"圆角矩形 7.png"]];
    [self.view addSubview:Headimage];
    
    SearchBarTextField *SearchTextField =[[SearchBarTextField alloc]initWithFrame:CGRectMake(LRYScreenpW(50), CGRectGetMaxY(Headimage.frame)+LRYScreenpH(80),ScreenWidth-2*leftSize, LRYScreenpH(150))];
    SearchTextField.tag =SEACHBAR;
    [SearchTextField.layer setMasksToBounds:YES];
    [SearchTextField.layer setCornerRadius:8];
    [SearchTextField.layer setBorderColor:[UIColor whiteColor].CGColor];
    [SearchTextField.layer setBorderWidth:1];
    [SearchTextField setBackgroundColor:WYKColor(252, 252, 252, 0.1)];
    [SearchTextField setTextAlignment:NSTextAlignmentCenter];
    SearchTextField.keyboardType =UIKeyboardTypeNumberPad;
    SearchTextField.placeholder =@"输入待排序的序列";
    SearchTextField.placeholderColor=LRYUIColorFromRGB(0xb9c1d6, 1.0);
    [self.view addSubview:SearchTextField];
    
    UIButton *Creatbtn =[[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(150), CGRectGetMaxY(SearchTextField.frame)+LRYScreenpH(200), CGRectGetWidth(SearchTextField.frame)*0.68, LRYScreenpH(70))];
    [Creatbtn setImage:[UIImage imageNamed:@"确定.png"] forState:UIControlStateNormal];
    [self.view addSubview:Creatbtn];
    [Creatbtn addTarget:self action:@selector(CreatbtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







-(void)CreatbtnClick
{
    //清空单例数组
    [[ViewManger ShareInstance].ScortArry removeAllObjects];
    //获取输入序列字符串
    SearchBarTextField *SearchTextField =[self.view viewWithTag:SEACHBAR];
    //将获取的字符串转换成字符数组
    NSMutableArray  *array = [SearchTextField.text componentsSeparatedByString:@" "];
    NSMutableArray  *array1 = [SearchTextField.text componentsSeparatedByString:@" "];
    NSMutableArray  *array2 = [SearchTextField.text componentsSeparatedByString:@" "];
    NSMutableArray  *array3 = [SearchTextField.text componentsSeparatedByString:@" "];
    NSMutableArray  *array4 = [SearchTextField.text componentsSeparatedByString:@" "];
    NSMutableArray  *array5 = [SearchTextField.text componentsSeparatedByString:@" "];
    NSMutableArray  *array6 = [SearchTextField.text componentsSeparatedByString:@" "];
    
    //①直接排序
    
    [self InsertSort:array];
    
    //②快速排序
    move2=0;
    compare2=0;
    CFAbsoluteTime startTime2 = CFAbsoluteTimeGetCurrent();
    [self quickAscendingOrderSort:array1 leftIndex:0 rightIndex:array1.count-1];
    CFAbsoluteTime endTime2 = CFAbsoluteTimeGetCurrent();
    float t2=endTime2 - startTime2;
    NSString *text = [quickarr componentsJoinedByString:@" "];
    //转换
    NSString *MoveStr=[NSString stringWithFormat:@"%d",move2];
    NSString *CompStr=[NSString stringWithFormat:@"%d",compare2];
    NSString *TimeStr=[NSString stringWithFormat:@"%f",t2];
    //初始化对象，获取输入序列字符串
    ScortMode *mode=[[ScortMode alloc]init];
    mode.ListScort =text;
    mode.TimeScort =TimeStr;
    mode.MoveScort=MoveStr;
    mode.CompScort=CompStr;
    [[ViewManger ShareInstance].ScortArry addObject:mode];
    
    //③希尔排序
    movess=0;
    comparess=0;
    [self InsertSSSort:array2];
    
    //④冒泡排序
    compareb=0;
    moveb=0;
    [self bubbleAscendingOrderSortWithArray:array3];
    
    
    
    //⑤堆排序
    move4=0;
    compare4=0;
    CFAbsoluteTime startTime4 = CFAbsoluteTimeGetCurrent();
    [self heapsortAsendingOrderSort:array4];
    CFAbsoluteTime endTime4 = CFAbsoluteTimeGetCurrent();
     float t4=endTime4 - startTime4;
    NSString *tex = [heaparr componentsJoinedByString:@" "];
    //转换
    NSString *MoveSt=[NSString stringWithFormat:@"%d",move4];
    NSString *CompSt=[NSString stringWithFormat:@"%d",compare4];
    NSString *TimeSt=[NSString stringWithFormat:@"%f",t4];
    //初始化对象，获取输入序列字符串
    ScortMode *mod=[[ScortMode alloc]init];
    mod.ListScort =tex;
    mod.MoveScort=MoveSt;
    mod.CompScort=CompSt;
    mod.TimeScort=TimeStr;
    [[ViewManger ShareInstance].ScortArry addObject:mod];
    
    //⑥归并排序
    move5=0;
    compare5=0;
    CFAbsoluteTime startTime5 = CFAbsoluteTimeGetCurrent();
    [self megerSortAscendingOrderSort:array5];
    CFAbsoluteTime endTime5 = CFAbsoluteTimeGetCurrent();
    float t5=endTime5 - startTime5;
    NSString *texts = [Megarr[0] componentsJoinedByString:@" "];
    //转换
    NSString *MoveS=[NSString stringWithFormat:@"%d",move5];
    NSString *CompS=[NSString stringWithFormat:@"%d",compare5];
    NSString *TimeS=[NSString stringWithFormat:@"%f",t5];
    //初始化对象，获取输入序列字符串
    ScortMode *mo=[[ScortMode alloc]init];
    mo.ListScort =texts;
    mo.TimeScort =TimeS;
    mo.MoveScort=MoveS;
    mo.CompScort=CompS;
    [[ViewManger ShareInstance].ScortArry addObject:mo];
    
    //⑦基排序
    move6=0;
    compare6=0;
    [self radixAscendingOrderSort:array6];
    
    FirstViewController *FirstView =[[FirstViewController alloc]init];
    [[ViewManger ShareInstance].Navigationcontroler pushViewController:FirstView animated:YES];

}

//直接排序
-(void)InsertSort:(NSArray *)array
{
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    int j;
    int compare=0;
    int move=0;
    
    //将获取的字符数组转换成数字数组
    int scor[array.count];
    for (int i=0; i<array.count; i++)
    {
        NSString *str = [array objectAtIndex:i];
        scor[i]=[str intValue];
    }
    
    //排序
    for(int i= 1; i<array.count+1; i++)
    {
        j= i-1;
        compare++;
        if(scor[i] < scor[j])//»Ùµ⁄i∏ˆ‘™Àÿ¥Û”⁄i-1‘™Àÿ£¨÷±Ω”≤Â»Î°£–°”⁄µƒª∞£¨“∆∂Ø”––Ú±Ì∫Û≤Â»Î
        {
            scor[array.count] = scor[i];    //∏¥÷∆Œ™…⁄±¯£¨º¥¥Ê¥¢¥˝≈≈–Ú‘™Àÿ
            while(scor[array.count] < scor[j] && j>=0)//≤È’“‘⁄”––Ú±Ìµƒ≤Â»ÎŒª÷√
            {
                compare++;
                move++;
                scor[j+1] = scor[j];//‘™Àÿ∫Û“∆
                j--;
            }
            move++;
            scor[j+1] = scor[array.count];      //≤Â»ÎµΩ’˝»∑Œª÷√
        }
        
    }
    CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
    float t=endTime - startTime;

    ////将获取的字符串转换成字符数组 再转换字符串
    NSMutableArray *arry=[[NSMutableArray alloc]init];
    for (int i= 0; i<array.count; i++)
    {
        NSString *str = [NSString stringWithFormat:@"%d",scor[i]];
        [arry addObject:str];
    }
    NSString *text = [arry componentsJoinedByString:@" "];
    //转换
    NSString *MoveStr=[NSString stringWithFormat:@"%d",move];
    NSString *CompStr=[NSString stringWithFormat:@"%d",compare];
    NSString *TimeStr=[NSString stringWithFormat:@"%f",t];

    //初始化对象，获取输入序列字符串
    ScortMode *mode=[[ScortMode alloc]init];
    mode.ListScort =text;
    mode.TimeScort =TimeStr;
    mode.MoveScort=MoveStr;
    mode.CompScort=CompStr;
    [[ViewManger ShareInstance].ScortArry addObject:mode];
    [arry removeAllObjects];
}



//快速排序
- (void)quickAscendingOrderSort:(NSMutableArray *)arr leftIndex:(NSInteger)left rightIndex:(NSInteger)right
{
    
    if (left < right) {
        NSInteger temp = [self getMiddleIndex:arr leftIndex:left rightIndex:right];
        [self quickAscendingOrderSort:arr leftIndex:left rightIndex:temp - 1];
        [self quickAscendingOrderSort:arr leftIndex:temp + 1 rightIndex:right];
    }
    quickarr =arr;
}
- (NSInteger)getMiddleIndex:(NSMutableArray *)arr leftIndex:(NSInteger)left rightIndex:(NSInteger)right
{
    NSInteger tempValue = [arr[left] integerValue];
    while (left < right)
    {
        while (left < right && tempValue <= [arr[right] integerValue])
        {
            right --;
            compare2++;
        }
        if (left < right)
        {
            arr[left] = arr[right];
            move2++;
        }
        while (left < right && [arr[left] integerValue] <= tempValue)
        {
            left ++;
            compare2++;
        }
        if (left < right)
        {
            arr[right] = arr[left];
            move2++;
        }
    }
    arr[left] = [NSNumber numberWithInteger:tempValue];
    return left;
}

//希尔排序
-(void) InsertSSSort:(NSArray *)array
{
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    //将获取的字符数组转换成数字数组
    int scor[array.count];
    for (int i=0; i<array.count; i++)
    {
        NSString *str = [array objectAtIndex:i];
        scor[i]=[str intValue];
    }
    int i, j, gap;
    for (gap = array.count / 2; gap > 0; gap /= 2) //步长
        for (i = 0; i < gap; i++)        //直接插入排序
        {
            for (j = i + gap; j < array.count; j += gap)
            {
                comparess++;
                if (scor[j] < scor[j - gap])
                {
                    int temp = scor[j];
                    int k = j - gap;
                    comparess++;
                    while (k >= 0 && scor[k] > temp)
                    {
                        comparess++;
                        movess++;
                        scor[k + gap] = scor[k];
                        k -= gap;
                    }
                    scor[k + gap] = temp;
                    movess++;
                    
                }
            }
        }
    
    CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
    float t=endTime - startTime;
    //将获取的字符串转换成字符数组 再转换字符串
    NSMutableArray *arry=[[NSMutableArray alloc]init];
    for (int i= 0; i<array.count; i++)
    {
        NSString *str = [NSString stringWithFormat:@"%d",scor[i]];
        [arry addObject:str];
    }
    NSString *text = [arry componentsJoinedByString:@" "];
    NSLog(@"s%@",text);
    //转换
    NSString *MoveStr=[NSString stringWithFormat:@"%d",movess];
    NSString *TimeStr=[NSString stringWithFormat:@"%f",t];
    NSString *CompStr=[NSString stringWithFormat:@"%d",comparess];
    //初始化对象，获取输入序列字符串
    ScortMode *mode=[[ScortMode alloc]init];
    mode.ListScort =text;
    mode.TimeScort=TimeStr;
    mode.MoveScort=MoveStr;
    mode.CompScort=CompStr;
    [[ViewManger ShareInstance].ScortArry addObject:mode];
    [arry removeAllObjects];

}

//冒泡排序
- (void)bubbleAscendingOrderSortWithArray:(NSMutableArray *)ascendingArr
{
    
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    for (int i = 0; i < ascendingArr.count; i++)
    {
        for (int j = 0; j < ascendingArr.count - 1 - i;j++)
        {
            compareb++;
            if ([ascendingArr[j+1]  intValue] < [ascendingArr[j] intValue])
            {
                int temp = [ascendingArr[j] intValue];
                ascendingArr[j] = ascendingArr[j + 1];
                ascendingArr[j + 1] = [NSNumber numberWithInt:temp];
                moveb++;
            }
        }
    }
    
    CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
    float t=endTime - startTime;
    NSString *text = [ascendingArr componentsJoinedByString:@" "];
    //转换
    NSString *MoveStr=[NSString stringWithFormat:@"%d",moveb];
    NSString *TimeStr=[NSString stringWithFormat:@"%f",t];
    NSString *CompStr=[NSString stringWithFormat:@"%d",compareb];
    //初始化对象，获取输入序列字符串
    ScortMode *mode=[[ScortMode alloc]init];
    mode.TimeScort=TimeStr;
    mode.ListScort =text;
    mode.MoveScort=MoveStr;
    mode.CompScort=CompStr;
    [[ViewManger ShareInstance].ScortArry addObject:mode];

}


//堆排序
- (void)heapsortAsendingOrderSort:(NSMutableArray *)ascendingArr
{
    NSInteger endIndex = ascendingArr.count - 1;
    ascendingArr = [self heapCreate:ascendingArr];
    while (endIndex >= 0)
    {

        NSNumber *temp = ascendingArr[0];
        ascendingArr[0] = ascendingArr[endIndex];
        ascendingArr[endIndex] = temp;
        move4++;
        endIndex -= 1;
        ascendingArr = [self heapAdjast:ascendingArr withStartIndex:0 withEndIndex:endIndex + 1];
    }
    
    heaparr =ascendingArr;
}
- (NSMutableArray *)heapCreate:(NSMutableArray *)array
{
    NSInteger i = array.count;
    while (i > 0) {
        array = [self heapAdjast:array withStartIndex:i - 1 withEndIndex:array.count];
        i -= 1;
    }
    return array;
}
- (NSMutableArray *)heapAdjast:(NSMutableArray *)items withStartIndex:(NSInteger)startIndex withEndIndex:(NSInteger)endIndex
{
    NSNumber *temp = items[startIndex];
    NSInteger fatherIndex = startIndex + 1;
    NSInteger maxChildIndex = 2 * fatherIndex;
    while (maxChildIndex <= endIndex)
    {
        compare4++;
        if (maxChildIndex < endIndex && [items[maxChildIndex - 1] floatValue] < [items[maxChildIndex] floatValue])
        {
            maxChildIndex++;
            
        }
        compare4++;
        if ([temp floatValue] < [items[maxChildIndex - 1] floatValue])
        {
            items[fatherIndex - 1] = items[maxChildIndex - 1];
            
        } else
        {
            break;
        }
        fatherIndex = maxChildIndex;
        maxChildIndex = fatherIndex * 2;
    }
    items[fatherIndex - 1] = temp;
    move4++;
    return items;
}



//归并排序
- (void)megerSortAscendingOrderSort:(NSMutableArray *)ascendingArr
{
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:1];
    for (NSNumber *num in ascendingArr)
    {
        NSMutableArray *subArray = [NSMutableArray array];
        [subArray addObject:num];
        [tempArray addObject:subArray];
    }
    while (tempArray.count != 1) {
        NSInteger i = 0;
        while (i < tempArray.count - 1)
        {
            tempArray[i] = [self mergeArrayFirstList:tempArray[i] secondList:tempArray[i + 1]];
            [tempArray removeObjectAtIndex:i + 1];
            
            i++;
        }
    }
    Megarr =tempArray;
}

- (NSArray *)mergeArrayFirstList:(NSArray *)array1 secondList:(NSArray *)array2
{
    NSMutableArray *resultArray = [NSMutableArray array];
    NSInteger firstIndex = 0, secondIndex = 0;
    while (firstIndex < array1.count && secondIndex < array2.count)
    {
        move5++;
        compare5++;
        if ([array1[firstIndex] floatValue] < [array2[secondIndex] floatValue])
        {
            [resultArray addObject:array1[firstIndex]];
            firstIndex++;
        }
        else
        {
            [resultArray addObject:array2[secondIndex]];
            secondIndex++;
        }
    }
    while (firstIndex < array1.count)
    {
        move5++;
        [resultArray addObject:array1[firstIndex]];
        firstIndex++;
    }
    while (secondIndex < array2.count)
    {
        move5++;
        [resultArray addObject:array2[secondIndex]];
        secondIndex++;
    }
    return resultArray.copy;
}



//基排序
-(void) bucket_sort:(NSArray *)array
{
    
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();

    //m为待排序序列元素值取范的上限（下限默认为0），n为序列长度，a为原序列
    int compare=0;
    int move=0;
    int temp=0;
    //将获取的字符数组转换成数字数组
    int scor[array.count];
    for (int i=0; i<array.count; i++)
    {
        NSString *str = [array objectAtIndex:i];
        scor[i]=[str intValue];
    }
    temp=scor[0];
    for (int i=0; i<array.count; i++)
    {
        if (temp<scor[i])
        {
            temp=scor[i];
        }
    }
//    compare=array.count;
//    move=array.count;
    int s[temp+1];  //注意新序列长度不是n而是temp
    for(int i=0;i<=temp;i++){ //初始化
        s[i]=0;
    }
    
    for(int  i=0;i<array.count;i++)//由原序列获得新序列
    {
        s[scor[i]]++;
    }
    
    int j=0;
    for(int i=0;i <=temp;i++)//输出新序列
    {
        if(s[i]!=0)
        {
            for(int k=s[i];k > 0;k--)
            {
                scor[j]=i;
                j++;
            }
        }
    }
    CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
    float t=endTime - startTime;
    ////将获取的字符串转换成字符数组 再转换字符串
    NSMutableArray *arry=[[NSMutableArray alloc]init];
    for (int i= 0; i<array.count; i++)
    {
        NSString *str = [NSString stringWithFormat:@"%d",scor[i]];
        [arry addObject:str];
    }
    NSString *text = [arry componentsJoinedByString:@" "];
    //转换
    NSString *MoveStr=[NSString stringWithFormat:@"%d",move];
    NSString *TimeStr=[NSString stringWithFormat:@"%f",t];
    NSString *CompStr=[NSString stringWithFormat:@"%d",compare];
    //初始化对象，获取输入序列字符串
    ScortMode *mode=[[ScortMode alloc]init];
    mode.ListScort =text;
    mode.MoveScort=MoveStr;
    mode.TimeScort=TimeStr;

    mode.CompScort=CompStr;
    [[ViewManger ShareInstance].ScortArry addObject:mode];
    [arry removeAllObjects];

    
    
    
    
}

- (NSMutableArray *)createBucket {
    NSMutableArray *bucket = [NSMutableArray array];
    for (int index = 0; index < 10; index++) {
        NSMutableArray *array = [NSMutableArray array];
        [bucket addObject:array];
    }
    return bucket;
}

- (NSNumber *)listMaxItem:(NSArray *)list {
    NSNumber *maxNumber = list[0];
    for (NSNumber *number in list) {
        if ([maxNumber integerValue] < [number integerValue]) {
            maxNumber = number;
        }
    }
    return maxNumber;
}
- (NSInteger)fetchBaseNumber:(NSNumber *)number digit:(NSInteger)digit {
    if (digit > 0 && digit <= numberLength(number)) {
        NSMutableArray *numbersArray = [NSMutableArray array];
        NSString *string = [NSString stringWithFormat:@"%ld", [number integerValue]];
        for (int index = 0; index < numberLength(number); index++) {
            [numbersArray addObject:[string substringWithRange:NSMakeRange(index, 1)]];
        }
        NSString *str = numbersArray[numbersArray.count - digit];
        return [str integerValue];
    }
    return 0;
}
NSInteger numberLength(NSNumber *number) {
    NSString *string = [NSString stringWithFormat:@"%ld", (long)[number integerValue]];
    return string.length;
}
- (void)radixAscendingOrderSort:(NSMutableArray *)ascendingArr
{
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    NSMutableArray *buckt = [self createBucket];
    NSNumber *maxnumber = [self listMaxItem:ascendingArr];
    NSInteger maxLength = numberLength(maxnumber);
    for (int digit = 1; digit <= maxLength; digit++) {
        // 入桶
        for (NSNumber *item in ascendingArr)
        {
            NSInteger baseNumber = [self fetchBaseNumber:item digit:digit];
            NSMutableArray *mutArray = buckt[baseNumber];
            [mutArray addObject:item];
        }
        NSInteger index = 0;
        for (int i = 0; i < buckt.count; i++)
        {
            NSMutableArray *array = buckt[i];
            while (array.count != 0) {
                NSNumber *number = [array objectAtIndex:0];
                ascendingArr[index] = number;
                [array removeObjectAtIndex:0];
                index++;
            }
        }
    }
    CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
    float t=endTime - startTime;
    
    NSString *text = [ascendingArr componentsJoinedByString:@" "];
    //转换
    NSString *MoveStr=[NSString stringWithFormat:@"%d",move6];
    NSString *TimeStr=[NSString stringWithFormat:@"%f",t];
    NSString *CompStr=[NSString stringWithFormat:@"%d",compare6];
    //初始化对象，获取输入序列字符串
    ScortMode *mode=[[ScortMode alloc]init];
    mode.ListScort =text;
    mode.MoveScort=MoveStr;
    mode.TimeScort=TimeStr;
    
    mode.CompScort=CompStr;
    [[ViewManger ShareInstance].ScortArry addObject:mode];
}











//点击界面空白处退出
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SearchBarTextField *SearchBar = [self.view viewWithTag:SEACHBAR];
    [SearchBar resignFirstResponder];
}

@end
