//
//  AKPViewController.m
//  CurrencyConverterGoogleRESTful
//
//  Created by Bala on 10/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AKPViewController.h"

@interface AKPViewController ()

@end

@implementation AKPViewController
@synthesize fromTxtField;
@synthesize progressIndicator;
@synthesize toTxtField;
@synthesize outputLabel;
@synthesize convertButton;
@synthesize pickerView;
@synthesize amountTxtField;
@synthesize countryNames;
@synthesize istoTxtFieldSelected;

#define GOOGLERESTURL @"http://www.google.com/ig/calculator?hl=en&q=%@=?%@"

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.countryNames = [[NSArray alloc] initWithObjects:
                         @"United Arab Emirates Dirham (AED)",
                         @"Netherlands Antillean Guilder (ANG)",
                         @"Argentine Peso (ARS)",
                         @"Australian Dollar (AUD)",
                         @"Bangladeshi Taka (BDT)",
                         @"Bulgarian Lev (BGN)",
                         @"Bahraini Dinar (BHD)",
                         @"Brunei Dollar (BND)",
                        @"Bolivian Boliviano (BOB)",
                         @"Brazilian Real (BRL)",
                         @"Botswanan Pula (BWP)",
                         @"Canadian Dollar (CAD)",
                        @"Swiss Franc (CHF)",
                         @"Chilean Peso (CLP)",
                         @"Chinese Yuan (CNY)",
                        @"Colombian Peso (COP)",
                        @"Costa Rican Colón (CRC)",
                         @"Czech Republic Koruna (CZK)",
                         @"Danish Krone (DKK)",
                       @"Dominican Peso (DOP)",
                        @"Algerian Dinar (DZD)",
                        @"Estonian Kroon (EEK)",
                         @"Egyptian Pound (EGP)",
                        @"Euro (EUR)",
                        @"Fijian Dollar (FJD)",
                       @"British Pound Sterling (GBP)",
                        @"Hong Kong Dollar (HKD)",
                         @"Honduran Lempira (HNL)",
                        @"Croatian Kuna (HRK)",
                         @"Hungarian Forint (HUF)",
                         @"Indonesian Rupiah (IDR)",
                         @"Israeli New Sheqel (ILS)",
                        @"Indian Rupee (INR)",
                        @"Jamaican Dollar (JMD)",
                         @"Jordanian Dinar (JOD)",
                       @"Japanese Yen (JPY)",
                       @"Kenyan Shilling (KES)",
                      @"South Korean Won (KRW)",
                         @"Kuwaiti Dinar (KWD)",
                         @"Cayman Islands Dollar (KYD)",
                        @"Kazakhstani Tenge (KZT)",
                        @"Lebanese Pound (LBP)",
                        @"Sri Lankan Rupee (LKR)",
                         @"Lithuanian Litas (LTL)",
                        @"Latvian Lats (LVL)",
                        @"Moroccan Dirham (MAD)",
                       @"Moldovan Leu (MDL)",
                        @"Macedonian Denar (MKD)",
                        @"Mauritian Rupee (MUR)",
                        @"Maldivian Rufiyaa (MVR)",
                        @"Mexican Peso (MXN)",
                        @"Malaysian Ringgit (MYR)",
                         @"Namibian Dollar (NAD)",
                        @"Nigerian Naira (NGN)",
                        @"Nicaraguan Córdoba (NIO)",
                      @"Norwegian Krone (NOK)",
                        @"Nepalese Rupee (NPR)",
                        @"New Zealand Dollar (NZD)",
                        @"Omani Rial (OMR)",
                       @"Peruvian Nuevo Sol (PEN)",
                         @"Papua New Guinean Kina (PGK)",
                        @"Philippine Peso (PHP)",
                        @"Pakistani Rupee (PKR)",
                         @"Polish Zloty (PLN)",
                       @"Paraguayan Guarani (PYG)",
                         @"Qatari Rial (QAR)",
                        @"Romanian Leu (RON)",
                     @"Serbian Dinar (RSD)",
                         @"Russian Ruble (RUB)",
                         @"Saudi Riyal (SAR)",
                        @"Seychellois Rupee (SCR)",
                        @"Swedish Krona (SEK)",
                         @"Singapore Dollar (SGD)",
                         @"Slovak Koruna (SKK)",
                         @"Sierra Leonean Leone (SLL)",
                         @"Salvadoran Colón (SVC)",
                         @"Thai Baht (THB)",
                         @"Tunisian Dinar (TND)",
                       @"Turkish Lira (TRY)",
                         @"Trinidad and Tobago Dollar (TTD)",
                         @"New Taiwan Dollar (TWD)",
                         @"Tanzanian Shilling (TZS)",
                         @"Ukrainian Hryvnia (UAH)",
                         @"Ugandan Shilling (UGX)",
                         @"US Dollar (USD)",
                         @"Uruguayan Peso (UYU)",
                        @"Uzbekistan Som (UZS)",
                         @"Venezuelan Bolívar (VEF)",
                        @"Vietnamese Dong (VND)",
                         @"CFA Franc BCEAO (XOF)",
                         @"Yemeni Rial (YER)",
                         @"South African Rand (ZAR)",
                         @"Zambian Kwacha (ZMK)", nil];
}

- (void)viewDidUnload
{
    [self setPickerView:nil];
    [self setFromTxtField:nil];
    [self setToTxtField:nil];
    [self setOutputLabel:nil];
    [self setConvertButton:nil];
    [self setAmountTxtField:nil];
    [self setProgressIndicator:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark -
#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [self.countryNames count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [self.countryNames objectAtIndex:row];
} 

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
  
    if(self.istoTxtFieldSelected == YES)
        self.toTxtField.text = [self.countryNames objectAtIndex:row];
    else {
        self.fromTxtField.text = [self.countryNames objectAtIndex:row];
    }
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    // Hide both keyboard and blinking cursor.
     if(amountTxtField != textField)
        return NO;
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField            
{
    if (textField == amountTxtField) {
        [amountTxtField resignFirstResponder];
    }
    return YES;
    
}
- (IBAction)convertButtonCLicked:(UIButton *)sender {
    
    
     if([self.progressIndicator isAnimating]  == NO)
     {
    if(self.amountTxtField.text.length > 0 && self.fromTxtField.text.length >0 && self.toTxtField.text.length > 0)
    {
        [self.progressIndicator startAnimating];
        
        dispatch_queue_t downloadQueue = dispatch_queue_create("google downloader", NULL);
        
    dispatch_async(downloadQueue, ^{
        
        NSString* amount =self.amountTxtField.text;
        NSString *fromstr = self.fromTxtField.text ;
        NSRange fromrange ;
        fromrange.length = 3;
        fromrange.location = fromstr.length - 4;
        fromstr = [fromstr substringWithRange:fromrange];
        
        NSString *tostr = self.toTxtField.text ;
        NSRange torange ;
        torange.length = 3;
        torange.location = tostr.length -4;
        tostr = [tostr substringWithRange:torange];
        
        NSString *urlAddress = [[NSString alloc] initWithFormat:GOOGLERESTURL,[NSString stringWithFormat:@"%@%@",amount,fromstr],tostr];
        NSString* escapedUrlString =
        [urlAddress stringByAddingPercentEscapesUsingEncoding:
         NSUTF8StringEncoding];
    
        NSData* data = [NSData dataWithContentsOfURL: 
                        [NSURL URLWithString:escapedUrlString]];
        [self performSelectorOnMainThread:@selector(updateConvertedValue:) 
                               withObject:data waitUntilDone:YES];
        
    });
        dispatch_release(downloadQueue);
    }
    else {
        [self alertMessage:@"Enter all values !"];
    }
     }
}

-(void)alertMessage:(NSString*)aMessage
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Currency Converter" message:aMessage delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    
}

-(void)updateConvertedValue: (NSData*)receivedData
{
    NSString *result = [[NSString alloc] initWithBytes:[receivedData bytes] length:[receivedData length] encoding:NSUTF8StringEncoding];
    NSError *error = NULL;
    //google is not sending valid JSOn so convert into valid JSON
    NSString *resultdata = result;
    resultdata = [resultdata stringByReplacingOccurrencesOfString:@"{" withString:@"{\""];
     resultdata = [resultdata stringByReplacingOccurrencesOfString:@"," withString:@",\""];
     resultdata = [resultdata stringByReplacingOccurrencesOfString:@":" withString:@"\":"];

    NSData* data = [resultdata dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data 
                          options:kNilOptions 
                          error:&error];
    
    NSString* convertedvalue = [json objectForKey:@"rhs"];
    if(error == nil)
        outputLabel.text = convertedvalue;
    else {
        outputLabel.text = @"conversion not available";
    }
     [self.progressIndicator stopAnimating];
    
}
- (IBAction)fromTxtFieldClicked:(UITextField *)sender {
    self.istoTxtFieldSelected = NO;
    self.fromTxtField.backgroundColor = [UIColor yellowColor];
        self.toTxtField.backgroundColor = [UIColor whiteColor];
    if([self.amountTxtField isFirstResponder])
        [self.amountTxtField resignFirstResponder];
}

- (IBAction)toTxtFieldClicked:(UITextField *)sender {
    self.istoTxtFieldSelected = YES; 
    self.toTxtField.backgroundColor = [UIColor yellowColor];
    self.fromTxtField.backgroundColor = [UIColor whiteColor];
    if([self.amountTxtField isFirstResponder])
       [self.amountTxtField resignFirstResponder];
}
@end
