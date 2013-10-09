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
    }

    return self;
}

- (void)updateStyle
{
    static NSString *sampleText = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam metus tellus, vulputate ac lobortis in, ornare placerat mi. In hac habitasse platea dictumst. Sed iaculis metus a tellus ullamcorper ultricies. Suspendisse in neque erat, at tincidunt enim. Aenean eros urna, semper sed blandit sed, vestibulum pulvinar arcu. Vestibulum vitae justo dolor. Etiam in turpis urna. Mauris blandit tincidunt scelerisque. In convallis velit quis risus vestibulum iaculis. Cras ullamcorper convallis dui, quis semper nisi iaculis vitae. Aliquam adipiscing, quam sed vehicula euismod, risus turpis dictum lorem, in bibendum ligula erat a arcu. Phasellus ac pretium ligula. Vivamus vestibulum pretium elit, et dignissim urna lacinia mattis. Sed eget tristique nisi. In hac habitasse platea dictumst. Maecenas elit dui, pretium quis accumsan at, mattis sit amet nulla. Phasellus nec tortor turpis. Sed mattis augue a mauris volutpat a convallis quam aliquet.";

    UIFont *font = [UIFont preferredFontForTextStyle:self.style];
    self.textView.font = font;
    self.textView.text = [NSString stringWithFormat:@"Family\n%@\n\nFont\n%@\n\nSize\n%f\n\nLine Height\n%f\n\n%@", font.familyName, font.fontName, font.pointSize, font.lineHeight, sampleText];
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
