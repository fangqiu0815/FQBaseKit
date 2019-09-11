//
//  FQTextView.m
//  TouchInstantCash
//
//  Created by mac on 2018/8/28.
//  Copyright © 2018年 zongsheng. All rights reserved.
//

#import "FQTextView.h"

@interface FQTextView()

@property (strong, nonatomic) NSString *currentText;


@end

@implementation FQTextView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layoutManager.allowsNonContiguousLayout = NO;
        [self scrollRangeToVisible:NSMakeRange(0, self.text.length)];
        [self addObserver];
        [self setView];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.layoutManager.allowsNonContiguousLayout = NO;
        [self scrollRangeToVisible:NSMakeRange(0, self.text.length)];
        [self addObserver];
        [self setView];
    }
    return self;
}

- (id)init{
    self = [super init];
    if (self) {
        [self addObserver];
        [self setView];
    }
    return self;
}

-(void)setView{
    if (!self.fq_placeholderLabel) {
        self.fq_placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 0, self.frame.size.width, self.frame.size.height)];
        self.fq_placeholderLabel.textColor = [UIColor lightGrayColor];
        self.fq_placeholderLabel.numberOfLines = 0;
        self.fq_placeholderLabel.font = [self font];
        [self addSubview:self.fq_placeholderLabel];
        super.delegate = self;
    }
    
    if (!self.fq_wordNumLabel) {
        self.fq_wordNumLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.fq_wordNumLabel.font = [UIFont systemFontOfSize:13];
        self.fq_wordNumLabel.textColor = [UIColor lightGrayColor];
        self.fq_wordNumLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.fq_wordNumLabel];
        
    }
    
}

-(void)layoutSubviews{
    self.fq_placeholderLabel.frame = CGRectMake(8, 6.5, self.frame.size.width-8, self.frame.size.height);
    [self.fq_placeholderLabel sizeToFit];
    [self.fq_wordNumLabel sizeToFit];
    [self refreshFram];
}
-(void)addObserver
{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextViewTextDidChangeNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(placeholderTextViewdidChange:) name:UITextViewTextDidChangeNotification object:self];
    
}


-(void)setFq_placeholder:(NSString *)fq_placeholder{
    _fq_placeholder = fq_placeholder;
    self.fq_placeholderLabel.text = _fq_placeholder;
    [self.fq_placeholderLabel sizeToFit];
    [self endEditing:NO];
}
-(void)setFq_maxLength:(NSInteger)fq_maxLength{
    
    _fq_maxLength = fq_maxLength;
    self.fq_wordNumLabel.text = [NSString stringWithFormat:@"0/%ld",(long)_fq_maxLength];
    
}
-(void)placeholderTextViewdidChange:(NSNotification *)notificat{
    
    FQTextView *textView = (FQTextView *)notificat.object;
    if ([self.text length]>0) {
        [self.fq_placeholderLabel setHidden:YES];
    }else{
        [self.fq_placeholderLabel setHidden:NO];
    }
    if ([textView.text length]>self.fq_maxLength&&self.fq_maxLength!=0&&textView.markedTextRange == nil) {
        textView.text = [textView.text substringToIndex:self.fq_maxLength];
    }
    self.fq_wordNumLabel.text = [NSString stringWithFormat:@"%ld/%ld",(long)[textView.text length],(long)_fq_maxLength];
    if (self.fq_didChangeText) {
        self.fq_didChangeText(textView);
    }
    
    [self refreshFram];
    _currentText = textView.text;
    
}

- (void)setFq_tipsType:(FQTextViewWordTipsType)fq_tipsType
{
    _fq_tipsType = fq_tipsType;
    [self refreshFram];
    
}


- (void)fq_didChangeText:(void (^)(FQTextView *))block{
    self.fq_didChangeText = block;
}


- (void)setText:(NSString *)text{
    [super setText:text];
    if (text.length>0) {
        [self.fq_placeholderLabel setHidden:YES];
        self.fq_wordNumLabel.text = [NSString stringWithFormat:@"%ld/%ld",(long)[text length],(long)_fq_maxLength];
        [self.fq_wordNumLabel sizeToFit];
        [self refreshFram];
        
    }
}


-(void)placeholderTextViewEndEditing{
    
    if ([self.text length]>0) {
        [self.fq_placeholderLabel setHidden:YES];
    }else{
        [self.fq_placeholderLabel setHidden:NO];
        
    }
}

- (void)refreshFram
{
    [self.fq_wordNumLabel sizeToFit];

    if (self.fq_tipsType == FQTextViewWordTipsTypeRight) {
        self.fq_wordNumLabel.hidden = NO;
        if (self.contentSize.height>self.frame.size.height-self.fq_wordNumLabel.frame.size.height-5) {
            
            CGFloat wnumX = self.frame.size.width - self.fq_wordNumLabel.frame.size.width-5;
            
            CGFloat wnumY = 10;
            
            self.fq_wordNumLabel.frame = CGRectMake(wnumX, wnumY, self.fq_wordNumLabel.frame.size.width, self.fq_wordNumLabel.frame.size.height);
            self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        }else{
            CGFloat numX = self.frame.size.width - self.fq_wordNumLabel.frame.size.width-5;
            CGFloat numY = 10;
            self.fq_wordNumLabel.frame = CGRectMake(numX, numY, self.fq_wordNumLabel.frame.size.width, self.fq_wordNumLabel.frame.size.height);
            self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        }
    } else if(self.fq_tipsType == FQTextViewWordTipsTypeBottomRight){
        self.fq_wordNumLabel.hidden = NO;
        if (self.contentSize.height>self.frame.size.height-self.fq_wordNumLabel.frame.size.height-5) {
            self.fq_wordNumLabel.frame = CGRectMake(self.frame.size.width - self.fq_wordNumLabel.frame.size.width-5, self.contentSize.height+self.contentInset.bottom-self.fq_wordNumLabel.frame.size.height-5, self.fq_wordNumLabel.frame.size.width, self.fq_wordNumLabel.frame.size.height);
            self.contentInset = UIEdgeInsetsMake(0, 0, self.fq_wordNumLabel.frame.size.height, 0);
            
        }else{
            self.fq_wordNumLabel.frame = CGRectMake(self.frame.size.width - self.fq_wordNumLabel.frame.size.width-5, self.frame.size.height + self.contentInset.bottom-self.fq_wordNumLabel.frame.size.height-5, self.fq_wordNumLabel.frame.size.width, self.fq_wordNumLabel.frame.size.height);
            self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        }
    } else {
        self.fq_wordNumLabel.hidden = YES;
    }
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}




@end




