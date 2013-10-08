//
//  Created by Justin Driscoll on 10/8/13.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_styles;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _styles = [NSMutableArray arrayWithCapacity:6];
    [_styles addObject:UIFontTextStyleHeadline];
    [_styles addObject:UIFontTextStyleSubheadline];
    [_styles addObject:UIFontTextStyleBody];
    [_styles addObject:UIFontTextStyleFootnote];
    [_styles addObject:UIFontTextStyleCaption1];
    [_styles addObject:UIFontTextStyleCaption2];

    __weak MasterViewController *self_ = self;

    [[NSNotificationCenter defaultCenter] addObserverForName:UIContentSizeCategoryDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note) {
                                                      [self_.tableView reloadData];
                                                  }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_styles count];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *style = [_styles objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
    controller.style = style;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *style = [_styles objectAtIndex:indexPath.row];
    UIFont *font = [UIFont preferredFontForTextStyle:style];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = style;
    cell.textLabel.font = font;
    return cell;
}

@end
