//
//  CalcViewController.swift
//  FastCalc
//
//  Created by Julian1 on 04.05.16.
//  Copyright © 2016 juliankob.com. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {

    var x : Double = 0.0
    var y : Double = 0.0
    var hideIndicator = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    
    //digital outlets
    @IBOutlet weak var digit1: MyCustomButton!
    @IBOutlet weak var digit2: MyCustomButton!
    @IBOutlet weak var digit3: MyCustomButton!
    @IBOutlet weak var digit4: MyCustomButton!
    @IBOutlet weak var digit5: MyCustomButton!
    @IBOutlet weak var digit6: MyCustomButton!
    @IBOutlet weak var digit7: MyCustomButton!
    @IBOutlet weak var digit8: MyCustomButton!
    @IBOutlet weak var digit9: MyCustomButton!
    @IBOutlet weak var digit0: MyCustomButton!
    
    //Outlets for func button
    @IBOutlet weak var xCubeOutlet: MyCustomButton!
    @IBOutlet weak var logarifmOutlet: MyCustomButton!
    @IBOutlet weak var eilerToXOutlet: MyCustomButton!
    @IBOutlet weak var OneToXOutlet: MyCustomButton!
    @IBOutlet weak var sqrtXOutlet: MyCustomButton!
    @IBOutlet weak var xSquareOutlet: MyCustomButton!
    @IBOutlet weak var eilerOutlet: MyCustomButton!
    @IBOutlet weak var sinusOutlet: MyCustomButton!
    @IBOutlet weak var cosinusOutlet: MyCustomButton!
    @IBOutlet weak var tangensOutlet: MyCustomButton!
    @IBOutlet weak var piOutlet: MyCustomButton!
    
    //Operations outlets
    @IBOutlet weak var clearOutlet: MyCustomButton!
    @IBOutlet weak var inverseOutlet: MyCustomButton!
    @IBOutlet weak var percentOutlet: MyCustomButton!
    @IBOutlet weak var operation1: MyCustomButton!
    @IBOutlet weak var operation2: MyCustomButton!
    @IBOutlet weak var operation3: MyCustomButton!
    @IBOutlet weak var operation4: MyCustomButton!
    @IBOutlet weak var equalOutlet: MyCustomButton!
    @IBOutlet weak var decimalOutlet: MyCustomButton!
    @IBOutlet weak var igrikToXOutlet: MyCustomButton!
    
    // view outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var moreView: UIView!
    
    private var operationActive = 0
    private var enterFlag = 1
    private var igrikFlag = 1
    var decimalPoint = 0
    var power = 1
    var numberFormatter = NSNumberFormatter()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showNumber(sender: UIButton) {
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        let alertView = UIAlertView(title: "Full number", message: "this is your number:  \(x)", delegate: self, cancelButtonTitle: "OK")
        alertView.show()
    }
    
    @IBOutlet weak var numberShowButton: UIButton!

    @IBAction func digitals(sender: AnyObject) {
        switch sender.tag
        {
        case 0:
            digit0.transform = CGAffineTransformMakeScale(0.6, 0.6)
        case 1:
            digit1.transform = CGAffineTransformMakeScale(0.6, 0.6)
        case 2:
            digit2.transform = CGAffineTransformMakeScale(0.6, 0.6)
        case 3:
            digit3.transform = CGAffineTransformMakeScale(0.6, 0.6)
        case 4:
            digit4.transform = CGAffineTransformMakeScale(0.6, 0.6)
        case 5:
            digit5.transform = CGAffineTransformMakeScale(0.6, 0.6)
        case 6:
            digit6.transform = CGAffineTransformMakeScale(0.6, 0.6)
        case 7:
            digit7.transform = CGAffineTransformMakeScale(0.6, 0.6)
        case 8:
            digit8.transform = CGAffineTransformMakeScale(0.6, 0.6)
        case 9:
            digit9.transform = CGAffineTransformMakeScale(0.6, 0.6)
        default:
            digit0.transform = CGAffineTransformMakeScale(0.6, 0.6)
        }
        UIView.animateWithDuration(2.0, delay: 0, usingSpringWithDamping: CGFloat(0.20), initialSpringVelocity: CGFloat(6.0), options: UIViewAnimationOptions.AllowUserInteraction, animations:
            {
                switch sender.tag
                {
                case 0:
                self.digit0.transform = CGAffineTransformIdentity
                case 1:
                self.digit1.transform = CGAffineTransformIdentity
                case 2:
                self.digit2.transform = CGAffineTransformIdentity
                case 3:
                self.digit3.transform = CGAffineTransformIdentity
                case 4:
                self.digit4.transform = CGAffineTransformIdentity
                case 5:
                self.digit5.transform = CGAffineTransformIdentity
                case 6:
                self.digit6.transform = CGAffineTransformIdentity
                case 7:
                self.digit7.transform = CGAffineTransformIdentity
                case 8:
                self.digit8.transform = CGAffineTransformIdentity
                case 9:
                self.digit9.transform = CGAffineTransformIdentity
                default:
                self.digit0.transform = CGAffineTransformIdentity
                }
            },
        completion: { Void in()  }
        )
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        if enterFlag == 1
        {
            x = 0
            enterFlag = 0
        }
        if decimalPoint == 0
        {
            x = x * 10 + Double(sender.tag)
            let t = numberFormatter.stringFromNumber(x)!
            switch t
            {
            case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(t))
            default:
            resultLabel.text = " " + t
            }
       
        }
        else
        {
            x = x + (Double(sender.tag)/pow(10, Double(power)))
            power = power + 1
            let t = numberFormatter.stringFromNumber(x)!
            switch t
            {
            case let z where z.hasSuffix(".0"):
                resultLabel.text = " " + String(Int(t))
            default:
                resultLabel.text = " " + t
            }
        }
        if resultLabel.text?.characters.count > 15
        {
            numberShowButton.setTitle("full number", forState: .Normal)
        }
    }
    
    @IBAction func numberEiler(sender: UIButton) {
        eilerOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.eilerOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()

        x = 2.7182818285
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + t
        default:
            resultLabel.text = " " + t
        }

    }
    
    
    @IBAction func xCube(sender: UIButton) {
        xCubeOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.xCubeOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()

        x = pow(x,3)
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + t
        default:
            resultLabel.text = " " + t
        }

    }
    
    @IBAction func xSquare(sender: UIButton) {
        xSquareOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.xSquareOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()

        x = pow(x,2)
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + t
        default:
            resultLabel.text = " " + t
        }

    }
    
    
    @IBAction func sqrtX(sender: UIButton) {
        sqrtXOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.sqrtXOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()

        x = sqrt(x)
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + t
        default:
            resultLabel.text = " " + t
        }

    }
    
    @IBAction func oneToX(sender: UIButton) {
        OneToXOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.OneToXOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()

        x = 1/x
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + t
        default:
            resultLabel.text = " " + t
        }
    }
    
    @IBAction func numberPi(sender: UIButton) {
        piOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.piOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()

        x = 3.1415926536
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + t
        default:
            resultLabel.text = " " + t
        }
    }
    
    @IBAction func sinus(sender: UIButton) {
        sinusOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.sinusOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = sin(x)
        let t = numberFormatter.stringFromNumber(x)!
        
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + t
        default:
            resultLabel.text = " " + t
        }
    }
    
    
    @IBAction func logarifm(sender: UIButton) {
        logarifmOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.logarifmOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = log(x)
        let t = numberFormatter.stringFromNumber(x)!
        
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + t
        default:
            resultLabel.text = " " + t
        }

    }
    
    
    @IBAction func eilerToX(sender: UIButton) {
        eilerToXOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.eilerToXOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = pow(2.7182818285, x)
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + t
        default:
            resultLabel.text = " " + t
        }

    }
    
    @IBAction func tangens(sender: UIButton) {
        tangensOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.tangensOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = tan(x)
        let t = numberFormatter.stringFromNumber(x)!
        
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + t
        default:
            resultLabel.text = " " + t
        }

    }
    
    @IBAction func cosinus(sender: UIButton) {
        cosinusOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.cosinusOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = cos(x)
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + t
        default:
            resultLabel.text = " " + t
        }
    }
    
    @IBAction func inverse(sender: UIButton) {
        inverseOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.inverseOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )

        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = -x
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + t
        default:
            resultLabel.text = " " + t         }

    }
    
    @IBAction func operations(sender: UIButton) {
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
       if enterFlag != 1 && igrikFlag == 1
        {
            switch operationActive
            {
                case 101:
                x = y / x
                case 102:
                x = y * x
                case 103:
                x = y - x
                case 104:
                x = y + x
                case 110:
                x = pow(y, 1/x)
                default:
                    let t = numberFormatter.stringFromNumber(x)!
                    switch t
                    {
                    case let z where z.hasSuffix(".0"):
                        resultLabel.text = " " + String(Int(t))
                    default:
                        resultLabel.text = " " + t
                }

            }
        }
        operationActive = sender.tag
        y = x
        igrikFlag = 1
        enterFlag = 1
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(t))
        default:
            resultLabel.text = " " + t
        }
        if resultLabel.text?.characters.count > 15
        {
            numberShowButton.setTitle("full number", forState: .Normal)
        }
        else
        {
            numberShowButton.setTitle("", forState: .Normal)
        }

        power = 0
        decimalPoint = 0
    }
    
    
    @IBAction func divideButtonAnimation(sender: MyCustomButton) {
        operation1.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.operation1.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        

    }
    

    @IBAction func multiplyButtonAnimation(sender: MyCustomButton) {
        operation2.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.operation2.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        

    }
    
    @IBAction func minusButtonAnimation(sender: MyCustomButton) {
        operation3.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.operation3.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        

    }
    
    @IBAction func plusButtonAmination(sender: MyCustomButton) {
        operation4.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.operation4.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        

    }
    
    @IBAction func equalButtonAnimation(sender: MyCustomButton) {
        equalOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.equalOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )

    }

    
    @IBAction func igrikToXAnimation(sender: MyCustomButton) {
        igrikToXOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.igrikToXOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        
}
    
    @IBAction func percent(sender: UIButton) {
        percentOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.percentOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )

        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()

        x = x / 100
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + t
        default:
            resultLabel.text = " " + t
        }

    }
 
    @IBAction func decimal(sender: UIButton) {
        decimalOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.decimalOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )

        if decimalPoint == 0
        {
            decimalPoint = 1
            resultLabel.text = resultLabel.text! + "."
        }
    }
    
    @IBOutlet weak var moreChanged: UIButton!
    
    @IBAction func moreButton(sender: UIButton) {
        moreView.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.moreView.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )
        
              if hideIndicator == 0
        {
            hideIndicator = 1
            moreChanged.setTitle("More", forState: .Normal) //uncomment this
            moreView.hidden = true
            self.moreChanged.transform = CGAffineTransformTranslate( self.moreChanged.transform, 0.0, -215.0  )
            self.resultLabel.transform = CGAffineTransformTranslate( self.resultLabel.transform, 0.0, -215.0  )
            self.mainView.transform = CGAffineTransformTranslate( self.mainView.transform, 0.0, -215.0  )
            self.numberShowButton.transform = CGAffineTransformTranslate( self.numberShowButton.transform, 0.0, -215.0  )
        }
        else if hideIndicator == 1
        {
            hideIndicator = 0
            moreChanged.setTitle("Hide", forState: .Normal) // uncomment this
            moreView.hidden = false
            self.moreChanged.transform = CGAffineTransformTranslate( self.moreChanged.transform, 0.0, 215.0  )
            self.resultLabel.transform = CGAffineTransformTranslate( self.resultLabel.transform, 0.0, 215.0  )
            self.mainView.transform = CGAffineTransformTranslate( self.mainView.transform, 0.0, 215.0  )
            self.numberShowButton.transform = CGAffineTransformTranslate( self.numberShowButton.transform, 0.0, 215.0  )
        }

    }
        
    @IBAction func clearAll(sender: UIButton) {
        clearOutlet.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.clearOutlet.transform = CGAffineTransformIdentity
            },
                                   completion: { Void in()  }
        )

        x = 0
        y = 0
        operationActive = 0
        enterFlag = 1
        igrikFlag = 1
        decimalPoint = 0
        power = 1
        resultLabel.text = " " + "0"
        numberShowButton.setTitle("", forState: .Normal)
    }
}
