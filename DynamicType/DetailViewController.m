//
//  Created by Justin Driscoll on 10/8/13.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (nonatomic, weak) IBOutlet UITextView *textView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (DetailViewController *)initWithStyle:(NSString *)style
{
    self = [super init];
    if (self) {
        _style = style;
        NSLog(@"TEST: %@", _style);
    }

    return self;
}

- (void)updateStyle
{
    UIFont *font = [UIFont preferredFontForTextStyle:self.style];
    self.textView.font = font;
    self.textView.text = [font description];
    self.title = self.style;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserverForName:UIContentSizeCategoryDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note) {
                                                      [self updateStyle];
                                                  }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateStyle];
}

@end
