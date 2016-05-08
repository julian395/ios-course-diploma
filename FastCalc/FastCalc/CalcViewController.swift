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
    
    @IBOutlet weak var resultLabel: UILabel!
    
    private var operationActive = 0
    private var enterFlag = 1
    private var igrikFlag = 1
    private var decimalPoint = 0
    var power = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func digitals(sender: AnyObject) {
        if enterFlag == 1
        {
            x = 0
            enterFlag = 0
        }
        if decimalPoint == 0
        {
            x = x * 10 + Double(sender.tag)
            switch String(x)
            {
            case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
            default:
            resultLabel.text = " " + String(x) + " "
            }
            
        }
        else
        {
            x = x + Double(sender.tag)/pow(10, Double(power))
            power += 1
            switch String(x)
            {
            case let z where z.hasSuffix(".0"):
                resultLabel.text = " " + String(Int(x)) + " "
            default:
                resultLabel.text = " " + String(x) + " "
            }

        }
    }
    
    @IBAction func numberEiler(sender: UIButton) {
        x = 2.7182818285
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
        default:
            resultLabel.text = " " + String(x) + " "
        }

    }
    
    
    @IBAction func xCube(sender: UIButton) {
        x = pow(x,3)
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
        default:
            resultLabel.text = " " + String(x) + " "
        }

    }
    
    @IBAction func xSquare(sender: UIButton) {
        x = pow(x,2)
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
        default:
            resultLabel.text = " " + String(x) + " "
        }

    }
    
    
    @IBAction func sqrtX(sender: UIButton) {
        x = sqrt(x)
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
        default:
            resultLabel.text = " " + String(x) + " "
        }

    }
    
    @IBAction func oneToX(sender: UIButton) {
        x = 1/x
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
        default:
            resultLabel.text = " " + String(x) + " "
        }

    }
    
    @IBAction func numberPi(sender: UIButton) {
        x = 3.1415926536
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
        default:
            resultLabel.text = " " + String(x) + " "
        }

    }
    
    @IBAction func sinus(sender: UIButton) {
        x = sin(x)
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
        default:
            resultLabel.text = " " + String(x) + " "
        }

    }
    
    
    @IBAction func logarifm(sender: UIButton) {
        x = log(x)
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
        default:
            resultLabel.text = " " + String(x) + " "
        }

    }
    
    
    @IBAction func eilerToX(sender: UIButton) {
        x = pow(2.7182818285, x)
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
        default:
            resultLabel.text = " " + String(x) + " "
        }

    }
    
    @IBAction func tangens(sender: UIButton) {
        x = tan(x)
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
        default:
            resultLabel.text = " " + String(x) + " "
        }

    }
    
    @IBAction func cosinus(sender: UIButton) {
        x = cos(x)
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
        default:
            resultLabel.text = " " + String(x) + " "
        }
    }
    
    @IBAction func inverse(sender: UIButton) {
        x = -x
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
        default:
            resultLabel.text = " " + String(x) + " "
        }

    }
    
    @IBAction func operations(sender: UIButton) {
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
                    switch String(x)
                    {
                    case let z where z.hasSuffix(".0"):
                        resultLabel.text = " " + String(Int(x)) + " "
                    default:
                        resultLabel.text = " " + String(x) + " "
                }

            }
        }
        operationActive = sender.tag
        y = x
        igrikFlag = 1
        enterFlag = 1
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
        default:
            resultLabel.text = " " + String(x) + " "
        }

        power = 0
        //decimalPoint = 0
    }

    @IBAction func percent(sender: UIButton) {
        x = x / 100
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = " " + String(Int(x)) + " "
        default:
            resultLabel.text = " " + String(x) + " "
        }

    }
 
    @IBAction func decimal(sender: UIButton) {
        
        if decimalPoint == 0
        {
            decimalPoint = 1
            resultLabel.text = resultLabel.text! + "."
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

        resultLabel.text = " " + "0" + " "
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
