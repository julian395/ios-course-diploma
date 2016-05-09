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
        if resultLabel.text?.characters.count > 18
        {
            numberShowButton.setTitle("full number", forState: .Normal)
        }
    }
    
    @IBAction func numberEiler(sender: UIButton) {
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

        power = 0
        decimalPoint = 0
    }

    @IBAction func percent(sender: UIButton) {
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
        if decimalPoint == 0
        {
            decimalPoint = 1
            resultLabel.text = resultLabel.text! + "."
        }
    }
    
    @IBOutlet weak var moreChanged: UIButton!
    
    @IBAction func moreButton(sender: UIButton) {
        if hideIndicator == 0
        {
            hideIndicator = 1
           // moreChanged.setTitle("Hide", forState: .Normal) //uncomment this
            moreView.hidden = true
            moreChanged.frame = CGRect(x: 0, y: 19, width: moreChanged.frame.size.width, height: moreChanged.frame.size.height)
            resultLabel.frame = CGRect(x: 0, y: 19, width: resultLabel.frame.size.width, height: resultLabel.frame.size.height)
            mainView.frame = CGRect(x: 0, y: 94, width: mainView.frame.size.width, height: mainView.frame.size.height)
            numberShowButton.frame = CGRect(x: 278, y: 75, width: numberShowButton.frame.size.width, height: numberShowButton.frame.size.height)
        }
        else if hideIndicator == 1
        {
            hideIndicator = 0
         //   moreChanged.setTitle("More", forState: .Normal) // uncomment this
            moreView.hidden = false
            moreChanged.frame = CGRect(x: 0, y: 234, width: moreChanged.frame.size.width, height: moreChanged.frame.size.height)
            resultLabel.frame = CGRect(x: 0, y: 234, width: resultLabel.frame.size.width, height: resultLabel.frame.size.height)
            mainView.frame = CGRect(x: 0, y: 309, width: mainView.frame.size.width, height: mainView.frame.size.height)
            numberShowButton.frame = CGRect(x: 278, y: 290, width: numberShowButton.frame.size.width, height: numberShowButton.frame.size.height)
        }

    }
        
    @IBAction func clearAll(sender: UIButton) {
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
