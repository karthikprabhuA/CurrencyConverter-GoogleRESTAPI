//
//  AKPViewController.h
//  CurrencyConverterGoogleRESTful
//
//  Created by Bala on 10/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKPViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *fromTxtField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progressIndicator;
@property (weak, nonatomic) IBOutlet UITextField *toTxtField;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (strong, nonatomic) NSArray* countryNames;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UITextField *amountTxtField;
@property (atomic) BOOL istoTxtFieldSelected;
- (IBAction)convertButtonCLicked:(UIButton *)sender;
- (IBAction)fromTxtFieldClicked:(UITextField *)sender;
- (IBAction)toTxtFieldClicked:(UITextField *)sender;

@end
