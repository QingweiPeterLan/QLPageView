# QLPageView

Customizable, calendar-like pageView.

## Installation

**Objective-C**

Add the following two files to your project `QLPageView.h`, `QLPageView.m`.

**Swift**

Add the following file to your project `QLPageView.swift`.

## Data Source Required Methods

Implement the following method to specify the title for the button in the button bar for each page.

**Objective-C:**
```objective-c
- (NSString *)pageView:(QLPageView *)pageView titleForButtonForPageAtIndex:(NSInteger)index
```

**Swift:**
```swift
func titleForButtonForPageAtIndex(sender: QLPageView, index: Int) -> String
```

Implement the following method to specify the actual view for each page.

**Objective-C:**
```objective-c
- (UIView *)pageView:(QLPageView *)pageView viewForPageAtIndex:(NSInteger)index
```

**Swift:**
```swift
func viewForPageAtIndex(sender: QLPageView, index: Int) -> UIView
```

## Other Data Source & Delegate Methods

Other delegate methods are used for customization of the pageView and the documentation can be found with along with the code.

## Example

### Objective-C

**`QLDemoViewController.h`**
```objective-c
#import <UIKit/UIKit.h>

@interface QLDemoViewController : UIViewController

@end
```

**`QLDemoViewController.m`**
```objective-c
#import "QLDemoViewController.h"
#import "QLPageView.h"

@interface QLDemoViewController () <QLPageViewDataSource, QLPageViewDelegate>

@property (nonatomic, strong) QLPageView *pageView;

@end

@implementation QLDemoViewController

#pragma mark - View Controller

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _pageView = [[QLPageView alloc] initWithFrame:self.view.bounds];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.pageView.frame = self.view.bounds;
    self.pageView.pageViewStyle = QLPageViewButtonBarStyleWithLabel;
    self.pageView.dataSource = self;
    self.pageView.delegate = self;
    [self.view addSubview:self.pageView];
}

#pragma mark - QLPageViewDataSource

- (NSInteger)initialIndexForPageInPageView:(QLPageView *)pageView
{
    return 1;
}

- (NSInteger)numberOfPagesInPageView:(QLPageView *)pageView
{
    return 6;
}

- (NSString *)pageView:(QLPageView *)pageView titleForLabelForPageAtIndex:(NSInteger)index
{
    switch (index) {
        case 0: return @"Mon"; break;
        case 1: return @"Tue"; break;
        case 2: return @"Wed"; break;
        case 3: return @"Thu"; break;
        case 4: return @"Fri"; break;
        case 5: return @"Sat"; break;
        default: break;
    }
    return @"";
}

- (NSString *)pageView:(QLPageView *)pageView titleForButtonForPageAtIndex:(NSInteger)index
{
    return [NSString stringWithFormat:@"%ld", (long)(index+1)];
}

- (UIView *)pageView:(QLPageView *)pageView viewForPageAtIndex:(NSInteger)index
{
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    if ((index % 2) == 0)
        view.backgroundColor = [UIColor blackColor];
    else
        view.backgroundColor = [UIColor cyanColor];
    return view;
}

@end
```

### Swift

**`QLDemoViewController.swift`**
```swift
import Foundation
import UIKit

class QLDemoViewController: UIViewController, QLPageViewDelegate, QLPageViewDataSource {
    
    var pageView: QLPageView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageView = QLPageView(frame: self.view.bounds)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        pageView?.frame = self.view.bounds
        pageView?.pageViewStyle = ButtonBarStyle.WithLabel
        pageView?.dataSource = self
        pageView?.delegate = self
        self.view.addSubview(pageView!)
    }
    
    func initialIndexForPageInPageView(sender: QLPageView) -> Int {
        return 1
    }
    
    func numberOfPagesInPageView(sender: QLPageView) -> Int {
        return 6
    }
    
    func titleForLabelForPageAtIndex(sender: QLPageView, index: Int) -> String {
        switch index {
        case 0: return "Mon"
        case 1: return "Tue"
        case 2: return "Wed"
        case 3: return "Thu"
        case 4: return "Fri"
        case 5: return "Sat"
        default: break
        }
        return ""
    }
    
    func titleForButtonForPageAtIndex(sender: QLPageView, index: Int) -> String {
        return "\(index+1)"
    }
    
    func viewForPageAtIndex(sender: QLPageView, index: Int) -> UIView {
        let view = UIView(frame: self.view.bounds)
        if index % 2 == 0 {
            view.backgroundColor = UIColor.blackColor()
        } else {
            view.backgroundColor = UIColor.cyanColor()
        }
        return view
    }
}
```
