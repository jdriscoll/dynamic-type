//
//  Created by Justin Driscoll on 10/8/13.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, strong) NSString *style;

- (DetailViewController *)initWithStyle:(NSString *)style;

@end
