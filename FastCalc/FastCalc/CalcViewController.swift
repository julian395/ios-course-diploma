//
//  CalcViewController.swift
//  FastCalc
//
//  Created by Julian1 on 04.05.16.
//  Copyright © 2016 juliankob.com. All rights reserved.
//

import UIKit
import Spring
import AudioToolbox
import AVFoundation

class CalcViewController: UIViewController {

    var x : Double = 0.0
    var y : Double = 0.0
    
    @IBOutlet weak var resultLabel: SpringLabel!
    @IBOutlet weak var resultLabel2: SpringLabel!
    @IBOutlet weak var operationLabel: SpringLabel!
    @IBOutlet weak var voiceButton: SpringButton!

    
    //digital outlets for mainView
    @IBOutlet weak var digit1: SpringButton!
    @IBOutlet weak var digit2: SpringButton!
    @IBOutlet weak var digit3: SpringButton!
    @IBOutlet weak var digit4: SpringButton!
    @IBOutlet weak var digit5: SpringButton!
    @IBOutlet weak var digit6: SpringButton!
    @IBOutlet weak var digit7: SpringButton!
    @IBOutlet weak var digit8: SpringButton!
    @IBOutlet weak var digit9: SpringButton!
    @IBOutlet weak var digit0: SpringButton!
    
    //digital outlets for mainView2
    @IBOutlet weak var digit00: SpringButton!
    @IBOutlet weak var digit01: SpringButton!
    @IBOutlet weak var digit02: SpringButton!
    @IBOutlet weak var digit03: SpringButton!
    @IBOutlet weak var digit04: SpringButton!
    @IBOutlet weak var digit05: SpringButton!
    @IBOutlet weak var digit06: SpringButton!
    @IBOutlet weak var digit07: SpringButton!
    @IBOutlet weak var digit08: SpringButton!
    @IBOutlet weak var digit09: SpringButton!
    
    //Outlets for func button
    @IBOutlet weak var xCubeOutlet: SpringButton!
    @IBOutlet weak var logarifmOutlet: SpringButton!
    @IBOutlet weak var eilerToXOutlet: SpringButton!
    @IBOutlet weak var OneToXOutlet: SpringButton!
    @IBOutlet weak var sqrtXOutlet: SpringButton!
    @IBOutlet weak var xSquareOutlet: SpringButton!
    @IBOutlet weak var eilerOutlet: SpringButton!
    @IBOutlet weak var sinusOutlet: SpringButton!
    @IBOutlet weak var cosinusOutlet: SpringButton!
    @IBOutlet weak var tangensOutlet: SpringButton!
    @IBOutlet weak var piOutlet: SpringButton!
    
    //Operations outlets
    @IBOutlet weak var clearOutlet: SpringButton!
    @IBOutlet weak var inverseOutlet: SpringButton!
    @IBOutlet weak var percentOutlet: SpringButton!
    @IBOutlet weak var operation1: SpringButton!
    @IBOutlet weak var operation2: SpringButton!
    @IBOutlet weak var operation3: SpringButton!
    @IBOutlet weak var operation4: SpringButton!
    
    //Operations outlets vor mainView2
    @IBOutlet weak var clearOutletV2: SpringButton!
    @IBOutlet weak var inverseOutletV2: SpringButton!
    @IBOutlet weak var percentOutletV2: SpringButton!
    @IBOutlet weak var oper1OutletV2: SpringButton!
    @IBOutlet weak var oper2OutletV2: SpringButton!
    @IBOutlet weak var oper3OutletV2: SpringButton!
    @IBOutlet weak var oper4OutletV2: SpringButton!
    @IBOutlet weak var equalOutletV2: SpringButton!
    @IBOutlet weak var decimalOutletV2: SpringButton!
    @IBOutlet weak var equalOutlet: SpringButton!
    @IBOutlet weak var decimalOutlet: SpringButton!
    @IBOutlet weak var igrikToXOutlet: SpringButton!
    
    // view outlets
    @IBOutlet weak var mainView: SpringView!
    @IBOutlet weak var moreView: SpringView!
    @IBOutlet weak var mainView2: SpringView!
    
    @IBOutlet weak var numericButton: UIButton!
    @IBOutlet weak var btnChange: SpringButton!
    
    @IBOutlet weak var animateLabel: SpringLabel!
    @IBOutlet weak var animateImg: SpringImageView!
    
    //function buttons Outlets
    private var operationActive = 0
    private var enterFlag = 1
    private var igrikFlag = 1
    var decimalPoint = 0
    var power = 1
    var numberFormatter = NSNumberFormatter()
    var formatter = NSNumberFormatter()
    var numberLength = 0
    var voiceNumber = ""
    
    var soundPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Tock", ofType: "mp3")!)
    var soundPath2 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("buttonError", ofType: "mp3")!)
    var soundPath3 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("delete", ofType: "mp3")!)
    var soundPath4 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("negative", ofType: "mp3")!)
    var soundPath5 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("buttonTap3", ofType: "wav")!)
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    var soundID:SystemSoundID = 0

    func loadAnimationLeft(button : SpringButton!)
    {
        button.animation = "squeezeUp"
        button.curve = "easeIn"
        button.duration = 2.0
        button.animate()
    }
    func loadAnimationRigth(button : SpringButton!)
    {
        button.animation = "squeezeUp"
        button.curve = "easeIn"
        button.duration = 2.0
        button.animate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateImg.hidden = true
        animateLabel.hidden = true
        switch UIDevice().type {
        case .iPhone4:
            numberLength = 12
        case .iPhone4S:
            numberLength = 12
        case .iPhone5:
            numberLength  = 12
        case .iPhone5C:
            numberLength  = 12
        case .iPhone5S:
            numberLength  = 12
        case .iPhone6:
            numberLength  = 15
        case .iPhone6S:
            numberLength  = 15
        case .iPhone6Splus:
            numberLength  = 16
        case .iPhone6plus:
            numberLength  = 16
        default:
           numberLength = 20
        }
        voiceNumber = "0"
        resultLabel.text = "0"
        moreView.hidden = true
        mainView.hidden = true
        resultLabel.hidden = true
        //buttonBorder for v1
        buttonBorder(digit1)
        buttonBorder(digit2)
        buttonBorder(digit3)
        buttonBorder(digit4)
        buttonBorder(digit5)
        buttonBorder(digit6)
        buttonBorder(digit7)
        buttonBorder(digit8)
        buttonBorder(digit9)
        buttonBorder(digit0)
        buttonBorder(decimalOutlet)
        buttonBorder(clearOutlet)
        buttonBorder(operation1)
        buttonBorder(operation2)
        buttonBorder(operation3)
        buttonBorder(operation4)
        buttonBorder(percentOutlet)
        buttonBorder(inverseOutlet)
        buttonBorder(eilerToXOutlet)
        buttonBorder(xCubeOutlet)
        buttonBorder(logarifmOutlet)
        buttonBorder(OneToXOutlet)
        buttonBorder(sqrtXOutlet)
        buttonBorder(xSquareOutlet)
        buttonBorder(eilerOutlet)
        buttonBorder(sinusOutlet)
        buttonBorder(cosinusOutlet)
        buttonBorder(tangensOutlet)
        buttonBorder(piOutlet)
        buttonBorder(igrikToXOutlet)
        
        //buttonBorder for v2
        buttonBorder(digit01)
        buttonBorder(digit02)
        buttonBorder(digit03)
        buttonBorder(digit04)
        buttonBorder(digit05)
        buttonBorder(digit06)
        buttonBorder(digit07)
        buttonBorder(digit08)
        buttonBorder(digit09)
        buttonBorder(digit00)
        buttonBorder(decimalOutletV2)
        buttonBorder(clearOutletV2)
        buttonBorder(oper1OutletV2)
        buttonBorder(oper2OutletV2)
        buttonBorder(oper3OutletV2)
        buttonBorder(oper4OutletV2)
        buttonBorder(percentOutletV2)
        buttonBorder(inverseOutletV2)
        buttonBorder(equalOutletV2)
        btnChange.setImage(UIImage(named:"trigonometry-1"), forState: .Normal)
        let AnimDelay = 0.1 * Double(NSEC_PER_SEC)
        let timeAnim = dispatch_time(DISPATCH_TIME_NOW, Int64(AnimDelay))
        dispatch_after(timeAnim, dispatch_get_main_queue())
        {
        self.loadAnimationLeft(self.digit00)
        self.loadAnimationLeft(self.digit01)
        self.loadAnimationLeft(self.digit04)
        self.loadAnimationLeft(self.digit07)
        self.loadAnimationLeft(self.digit02)
        self.loadAnimationLeft(self.digit05)
        self.loadAnimationLeft(self.digit08)
        self.loadAnimationLeft(self.clearOutletV2)
        self.loadAnimationLeft(self.inverseOutletV2)
        }
        let AnimDelay2 = 0.1 * Double(NSEC_PER_SEC)
        let timeAnim2 = dispatch_time(DISPATCH_TIME_NOW, Int64(AnimDelay2))
        dispatch_after(timeAnim2, dispatch_get_main_queue())
        {
            self.loadAnimationRigth(self.digit03)
            self.loadAnimationRigth(self.digit06)
            self.loadAnimationRigth(self.digit09)
            self.loadAnimationRigth(self.oper1OutletV2)
            self.loadAnimationRigth(self.oper2OutletV2)
            self.loadAnimationRigth(self.oper3OutletV2)
            self.loadAnimationRigth(self.oper4OutletV2)
            self.loadAnimationRigth(self.equalOutletV2)
            self.loadAnimationRigth(self.decimalOutletV2)
            self.loadAnimationRigth(self.percentOutletV2)
        }

        let delay = 1.5 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue())
        {
             self.animateLabel.hidden = false
             self.animateImg.hidden = false
             self.animateLabel.animation = "squeezeRight"
             self.animateLabel.curve = "easeIn"
             self.animateLabel.duration = 1.0
             self.animateLabel.animate()
            
             self.animateImg.animation = "squeezeRight"
             self.animateImg.curve = "easeIn"
             self.animateImg.duration = 1.0
             self.animateImg.animate()
            
             let delay2 = 8.5 * Double(NSEC_PER_SEC)
             let time2 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay2))
             dispatch_after(time2, dispatch_get_main_queue())
             {
                self.animateLabel.animation = "pop"
                self.animateLabel.curve = "easeIn"
                self.animateLabel.duration = 1.0
                self.animateLabel.animate()
             }
            
             let delay = 15.5 * Double(NSEC_PER_SEC)
             let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
             dispatch_after(time, dispatch_get_main_queue())
             {
                self.animateLabel.animation = "zoomOut"
                self.animateLabel.curve = "easeIn"
                self.animateLabel.duration = 1.0
                self.animateLabel.animate()
                
                self.animateImg.animation = "zoomOut"
                self.animateImg.curve = "easeIn"
                self.animateImg.duration = 1.0
                self.animateImg.animate()
                
                let delay = 0.5 * Double(NSEC_PER_SEC)
                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                dispatch_after(time, dispatch_get_main_queue())
                {
                    self.animateLabel.hidden = true
                    self.animateImg.hidden = true
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func buttonBorder(button : UIButton)
    {
        button.layer.cornerRadius = 0;
        button.layer.borderWidth = 1;
    }
    
    @IBAction func digitalsV2(sender: AnyObject) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)
        switch sender.tag
        {
        case 0:
            buttonAnimation(digit00)
        case 1:
            buttonAnimation(digit01)
        case 2:
            buttonAnimation(digit02)
        case 3:
            buttonAnimation(digit03)
        case 4:
            buttonAnimation(digit04)
        case 5:
            buttonAnimation(digit05)
        case 6:
            buttonAnimation(digit06)
        case 7:
            buttonAnimation(digit07)
        case 8:
            buttonAnimation(digit08)
        case 9:
            buttonAnimation(digit09)
        default:
            buttonAnimation(digit00)
        }
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        
        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US") //formatter.locale = NSLocale.currentLocale()

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
                    resultLabel2.text = String(Int(t))
                    voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString((t))!)!
                default:
                    resultLabel2.text = t
                    voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString((t))!)!
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
                resultLabel2.text = String(Int(t))
                voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString((t))!)!
            default:
                resultLabel2.text = t
                voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString((t))!)!
            }
        }
        
        if resultLabel2.text?.characters.count > numberLength && resultLabel2.text?.characters.count < numberLength + 7
        {
            var temp = resultLabel2.text?.characters.count
            var result = CGFloat(100-(42 + Int(temp!)))
            resultLabel2.font = UIFont(name: (resultLabel2.font?.fontName)!, size: result)
        }
    }

    @IBAction func digitals(sender: AnyObject) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)
        switch sender.tag
        {
        case 0:
            buttonAnimation(digit0)
        case 1:
            buttonAnimation(digit1)
        case 2:
           buttonAnimation(digit2)
        case 3:
            buttonAnimation(digit3)
        case 4:
            buttonAnimation(digit4)
        case 5:
            buttonAnimation(digit5)
        case 6:
            buttonAnimation(digit6)
        case 7:
           buttonAnimation(digit7)
        case 8:
            buttonAnimation(digit8)
        case 9:
            buttonAnimation(digit9)
        default:
            buttonAnimation(digit0)
        }
        
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        
        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")
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
                resultLabel.text = String(Int(t))
                voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString((t))!)!
            default:
                resultLabel.text = t
                voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString((t))!)!
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
                resultLabel.text = String(Int(t))
                voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString((t))!)!
            default:
                resultLabel.text = t
                voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString((t))!)!
            }
        }
        if resultLabel.text?.characters.count > numberLength && resultLabel.text?.characters.count < 27
        {
            var temp = resultLabel.text?.characters.count
            var result = CGFloat(100-(42 + Int(temp!)))
            resultLabel.font = UIFont(name: (resultLabel.font?.fontName)!, size: result)
        }
    }
    
    @IBAction func numberEiler(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)

        
        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        buttonAnimation(eilerOutlet)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = 2.7182818285
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = t
        default:
            resultLabel.text = t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel.text!)!)!
    }
    
    
    @IBAction func xCube(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)

        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        buttonAnimation(xCubeOutlet)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = pow(x,3)
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = t
        default:
            resultLabel.text = t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel.text!)!)!
    }
    
    @IBAction func xSquare(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)

        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        buttonAnimation(xSquareOutlet)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = pow(x,2)
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = t
        default:
            resultLabel.text = t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel.text!)!)!
    }
    
    
    @IBAction func sqrtX(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)

        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        buttonAnimation(sqrtXOutlet)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        if x > -1
        {
        x = sqrt(x)
        }
        else
        {
            AudioServicesCreateSystemSoundID(soundPath2, &soundID)
            AudioServicesPlaySystemSound(soundID)
            let ZeroAlertView = UIAlertView(title: "Error", message: "You are trying to find root 0", delegate: self, cancelButtonTitle: "Close")
            ZeroAlertView.show()
        }
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = t
        default:
            resultLabel.text = t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel.text!)!)!
    }
    
    @IBAction func oneToX(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)

        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        buttonAnimation(OneToXOutlet)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        if x != 0
        {
            x = 1/x
        }
        else
        {
            AudioServicesCreateSystemSoundID(soundPath2, &soundID)
            AudioServicesPlaySystemSound(soundID)
            let ZeroAlertView = UIAlertView(title: "Error", message: "You are trying to divide by 0", delegate: self, cancelButtonTitle: "Close")
            ZeroAlertView.show()
        }
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = t
        default:
            resultLabel.text = t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel.text!)!)!
    }
    
    @IBAction func numberPi(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)
        
        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        buttonAnimation(piOutlet)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = 3.1415926536
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = t
        default:
            resultLabel.text = t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel.text!)!)!
    }
    
    @IBAction func sinus(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)

        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        buttonAnimation(sinusOutlet)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = sin(x)
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = t
        default:
            resultLabel.text = t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel.text!)!)!
    }
    
    
    @IBAction func logarifm(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)
        
        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        buttonAnimation(logarifmOutlet)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        if x != 0
        {
            x = log(x)
        }
        else
        {
            AudioServicesCreateSystemSoundID(soundPath2, &soundID)
            AudioServicesPlaySystemSound(soundID)
            let ZeroAlertView = UIAlertView(title: "Error", message: "You are trying to find ln 0", delegate: self, cancelButtonTitle: "Close")
            ZeroAlertView.show()
        }
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = t
        default:
            resultLabel.text = t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel.text!)!)!
    }
    
    
    @IBAction func eilerToX(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)
        
        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        buttonAnimation(eilerToXOutlet)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = pow(2.7182818285, x)
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = t
        default:
            resultLabel.text = t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel.text!)!)!
    }
    
    @IBAction func tangens(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)

        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        buttonAnimation(tangensOutlet)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = tan(x)
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = t
        default:
            resultLabel.text = t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel.text!)!)!
    }
    
    @IBAction func cosinus(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)

        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        buttonAnimation(cosinusOutlet)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = cos(x)
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = t
        default:
            resultLabel.text = t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel.text!)!)!
    }
    
    
    @IBAction func inverseV2(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)
        
        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        buttonAnimation(inverseOutletV2)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = -x
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel2.text = t
        default:
            resultLabel2.text = t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel2.text!)!)!
    }
    
    
    @IBAction func inverse(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)
        
        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        buttonAnimation(inverseOutlet)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = -x
        let t = numberFormatter.stringFromNumber(x)!
            switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = t
        default:
            resultLabel.text = t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel.text!)!)!
    }
    
    
    @IBAction func operationsV2(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)

        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        operationLabel.text = ""
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        if enterFlag != 1 && igrikFlag == 1
        {
            switch operationActive
            {
            case 1001:
                if x != 0
                {
                    x = y / x
                    let t = numberFormatter.stringFromNumber(x)!
                    let p = numberFormatter.stringFromNumber(y)!
                    switch t
                    {
                    case let z where z.hasSuffix(".0"):
                        operationLabel.text = String(Int(p)) + " / " + resultLabel2.text! + " = " + String(Int(t)) + " "
                    default:
                        operationLabel.text = p + " / " + resultLabel2.text! + " = " + t + " "
                    }
                }
                else
                {
                    AudioServicesCreateSystemSoundID(soundPath2, &soundID)
                    AudioServicesPlaySystemSound(soundID)
                    let ZeroAlertView = UIAlertView(title: "Error", message: "You are trying to divide by 0", delegate: self, cancelButtonTitle: "Close")
                    ZeroAlertView.show()
                }
            case 1002:
                x = y * x
                let t = numberFormatter.stringFromNumber(x)!
                let p = numberFormatter.stringFromNumber(y)!
                switch t
                {
                case let z where z.hasSuffix(".0"):
                    operationLabel.text = String(Int(p)) + " * " + resultLabel2.text! + " = " + String(Int(t)) + " "
                default:
                    operationLabel.text = p + " * " + resultLabel2.text! + " = " + t + " "
                }

            case 1003:
                x = y - x
                let t = numberFormatter.stringFromNumber(x)!
                let p = numberFormatter.stringFromNumber(y)!
                switch t
                {
                case let z where z.hasSuffix(".0"):
                    operationLabel.text = String(Int(p)) + " - " + resultLabel2.text! + " = " + String(Int(t)) + " "
                default:
                    operationLabel.text = p + " - " + resultLabel2.text! + " = " + t + " "
                }

            case 1004:
                x = y + x
                let t = numberFormatter.stringFromNumber(x)!
                let p = numberFormatter.stringFromNumber(y)!
                switch t
                {
                case let z where z.hasSuffix(".0"):
                    operationLabel.text = String(Int(p)) + " + " + resultLabel2.text! + " = " + String(Int(t)) + " "
                default:
                    operationLabel.text = p + " + " + resultLabel2.text! + " = " + t + " "
                }

            default:
                let t = numberFormatter.stringFromNumber(x)!
                switch t
                {
                case let z where z.hasSuffix(".0"):
                    resultLabel2.text = String(Int(t))
                    default:
                    resultLabel2.text = t
                }
                
            }
        }
        operationActive = sender.tag
        y = x
        igrikFlag = 1
        enterFlag = 1
        if sender.tag != 1005 && y != 0{
            equalOutletV2.animation = "swing"
            equalOutletV2.curve = "easeIn"
            equalOutletV2.force = 3.5
            equalOutletV2.duration = 1.5
            equalOutletV2.delay = 1.5
            equalOutletV2.animate()
        }
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel2.text = String(Int(t))
            voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString((t))!)!
        default:
            resultLabel2.text = t
            voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString((t))!)!
        }
        if resultLabel2.text?.characters.count > 10
        {
            resultLabel2.font.fontWithSize(45)
        }
        else
        {
            resultLabel2.font.fontWithSize(60)
        }
        power = 1
        decimalPoint = 0
    }
    
    @IBAction func operations(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)
        
        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        if enterFlag != 1 && igrikFlag == 1
        {
            switch operationActive
            {
                case 101:
                if x != 0
                {
                x = y / x
                }
                else
                {
                    AudioServicesCreateSystemSoundID(soundPath2, &soundID)
                    AudioServicesPlaySystemSound(soundID)
                    let ZeroAlertView = UIAlertView(title: "Error", message: "You are trying to divide by 0", delegate: self, cancelButtonTitle: "Close")
                    ZeroAlertView.show()
                }
                case 102:
                x = y * x
                case 103:
                x = y - x
                case 104:
                x = y + x
                case 110:
                if x != 0 && y > -1
                {
                    x = pow(y, 1/x)
                }
                else
                {
                    AudioServicesCreateSystemSoundID(soundPath2, &soundID)
                    AudioServicesPlaySystemSound(soundID)
                    
                    let ZeroAlertView = UIAlertView(title: "Error", message: "You are trying to find root 0", delegate: self, cancelButtonTitle: "Close")
                    ZeroAlertView.show()
                }
                default:
                    let t = numberFormatter.stringFromNumber(x)!
                    switch t
                    {
                    case let z where z.hasSuffix(".0"):
                        resultLabel.text = String(Int(t))
                    default:
                        resultLabel.text = t
                }
            }
        }
        operationActive = sender.tag
        y = x
        igrikFlag = 1
        enterFlag = 1
        if sender.tag != 105 && y != 0
        {
        equalOutlet.animation = "swing"
        equalOutlet.curve = "easeIn"
        equalOutlet.force = 3.5
        equalOutlet.duration = 1.5
        equalOutlet.delay = 1.5
        equalOutlet.animate()
        }
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = String(Int(t))
            voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString((t))!)!
        default:
            resultLabel.text = t
            voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString((t))!)!
        }
        if resultLabel.text?.characters.count > 10
        {
            resultLabel.font.fontWithSize(45)
        }
        else
        {
           resultLabel.font.fontWithSize(60)
        }
        power = 1
        decimalPoint = 0
    }
    
    
    @IBAction func divideButtonAnimation(sender: MyCustomButton) {
       buttonAnimation(operation1)

    }
    
    @IBAction func multiplyButtonAnimation(sender: MyCustomButton) {
        buttonAnimation(operation2)
       
    }
    
    @IBAction func minusButtonAnimation(sender: MyCustomButton) {
        buttonAnimation(operation3)

    }
    
    @IBAction func plusButtonAmination(sender: MyCustomButton) {
        buttonAnimation(operation4)

    }
    
    @IBAction func equalButtonAnimation(sender: MyCustomButton) {
        buttonAnimation(equalOutlet)

    }

    @IBAction func igrikToXAnimation(sender: MyCustomButton) {
        buttonAnimation(igrikToXOutlet)
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)

    }
    
    
    @IBAction func percentV2(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)

        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        operationLabel.text = ""
        buttonAnimation(percentOutletV2)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        operationLabel.text = numberFormatter.stringFromNumber(x)!
        x = x / 100
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel2.text = t
            operationLabel.text = operationLabel.text! + " % " + " = " + t
        default:
            resultLabel2.text = t
            operationLabel.text = operationLabel.text! + " % " + " = " + t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel2.text!)!)!
    }
    
    @IBAction func percent(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)
        
        formatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")

        buttonAnimation(percentOutlet)
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        x = x / 100
        let t = numberFormatter.stringFromNumber(x)!
        switch t
        {
        case let z where z.hasSuffix(".0"):
            resultLabel.text = t
        default:
            resultLabel.text = t
        }
        voiceNumber = formatter.stringFromNumber(numberFormatter.numberFromString(resultLabel.text!)!)!
    }
 
    @IBAction func decimal(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)

        buttonAnimation(decimalOutlet)
        if decimalPoint == 0
        {
            decimalPoint = 1
            resultLabel.text = resultLabel.text! + "."
            voiceNumber = voiceNumber + "."
        }
    }
    
    
    @IBAction func decimalV2(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath, &soundID)
        AudioServicesPlaySystemSound(soundID)

        buttonAnimation(decimalOutletV2)
        if decimalPoint == 0
        {
            decimalPoint = 1
            resultLabel2.text = resultLabel2.text! + "."
            voiceNumber = voiceNumber + "."
        }
    }
    
    func buttonAnimation(button: SpringButton!)
    {
        button.animation = "fadeIn"
        button.curve = "easeInCirc"
        button.duration = 0.5
        button.damping = 0.0
        button.velocity = 0.0
        button.animate()
    }
    
    

    @IBAction func clealrAllV2(sender: UIButton) {
        operationLabel.hidden = true
        buttonAnimation(clearOutletV2)
        if resultLabel2.text != "0" {
        AudioServicesCreateSystemSoundID(soundPath3, &soundID)
        AudioServicesPlaySystemSound(soundID)
        resultLabel2.animation = "flipX"
        resultLabel2.curve = "easeInOut"
        resultLabel2.force = 3.6
        resultLabel2.duration = 0.5
        resultLabel2.damping = 0.0
        resultLabel2.velocity = 0.0
        resultLabel2.animate()
            let delay = 0.2 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue())
            {
                self.resultLabel2.text = "0"
            }
        }
        else
        {
            AudioServicesCreateSystemSoundID(soundPath4, &soundID)
            AudioServicesPlaySystemSound(soundID)
        }
        resultLabel2.font = UIFont(name: (resultLabel2.font?.fontName)!, size: 50)
        x = 0
        y = 0
        operationActive = 0
        voiceNumber = "0"
        enterFlag = 1
        igrikFlag = 1
        decimalPoint = 0
        power = 1
        operationLabel.text = ""
        operationLabel.hidden = false
    }
    
    @IBAction func clearAll(sender: UIButton) {
        buttonAnimation(clearOutlet)
        if resultLabel.text != "0" {
            AudioServicesCreateSystemSoundID(soundPath3, &soundID)
            AudioServicesPlaySystemSound(soundID)
            resultLabel.animation = "flipX"
            resultLabel.curve = "easeInOut"
            resultLabel.force = 3.6
            resultLabel.duration = 0.5
            resultLabel.damping = 0.0
            resultLabel.velocity = 0.0
            resultLabel.animate()
            let delay = 0.2 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue())
            {
                self.resultLabel.text = "0"
            }
        }
        else
        {
            AudioServicesCreateSystemSoundID(soundPath4, &soundID)
            AudioServicesPlaySystemSound(soundID)
        }
        resultLabel.font = UIFont(name: (resultLabel.font?.fontName)!, size: 50)
        x = 0
        voiceNumber = "0"
        y = 0
        operationActive = 0
        enterFlag = 1
        igrikFlag = 1
        decimalPoint = 0
        power = 1
    }
    
    @IBAction func changeCalc(sender: UIButton) {
        AudioServicesCreateSystemSoundID(soundPath5, &soundID)
        AudioServicesPlaySystemSound(soundID)

        if moreView.hidden == true
        {
            btnChange.animation = "flipY"
            btnChange.curve = "easeInOut"
            btnChange.force = 3.6
            btnChange.duration = 0.5
            btnChange.damping = 0.0
            btnChange.velocity = 0.0
            btnChange.animate()
            
            moreView.animation = "zoomIn"
            moreView.curve = "easeInOut"
            moreView.duration = 2.9
            moreView.animate()
            
            moreView.hidden = false
            mainView.hidden = false
            resultLabel.hidden = false
            mainView2.hidden = true
            resultLabel2.hidden = true
            operationLabel.hidden = true
            resultLabel.text = resultLabel2.text
            let delay = 0.35 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue())
            {
                self.btnChange.setImage(UIImage(named: "math-2"), forState: .Normal)
            }
        }
        else if moreView.hidden == false
        {
            btnChange.animation = "shake"
            btnChange.curve = "easeInOut"
            btnChange.force = 3.6
            btnChange.duration = 0.5
            btnChange.damping = 0.0
            btnChange.velocity = 0.0
            btnChange.animate()
            
            moreView.animation = "fadeOut"
            moreView.curve = "easeInOut"
            moreView.duration = 2.9
            moreView.animate()
            
            let delay = 0.3 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue())
            {
                self.btnChange.setImage(UIImage(named: "trigonometry-1"), forState: .Normal)
            }
            let delay2 = 0.45 * Double(NSEC_PER_SEC)
            let time2 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay2))
            dispatch_after(time2, dispatch_get_main_queue())
            {
            self.moreView.hidden = true
            self.mainView.hidden = true
            self.resultLabel.hidden = true
            self.mainView2.hidden = false
            self.resultLabel2.hidden = false
            self.operationLabel.hidden = false
            self.resultLabel2.text = self.resultLabel.text
            }
        }
    }
    
    @IBAction func operation1004(sender: AnyObject) {
        buttonAnimation(oper1OutletV2)

    }
    
    @IBAction func operation1003(sender: AnyObject) {
        buttonAnimation(oper2OutletV2)

    }
    
    @IBAction func operation1002(sender: AnyObject) {
        buttonAnimation(oper3OutletV2)

    }
    
    
    @IBAction func operation1001(sender: AnyObject) {
        buttonAnimation(oper4OutletV2)

    }
    
    @IBAction func equalOperation(sender: AnyObject) {
        buttonAnimation(equalOutletV2)

    }
    
    @IBAction func showNumber(sender: UIButton)
    {
        if resultLabel.text?.characters.count > numberLength
        {
            AudioServicesCreateSystemSoundID(soundPath, &soundID)
            AudioServicesPlaySystemSound(soundID)
            let ShowNumberAlert = UIAlertView(title: "Your full number", message: "\(Double(x))", delegate: self, cancelButtonTitle: "Close")
            ShowNumberAlert.show()
        }
        else
        {
            numericButton.hidden = false
        }
    }
    
    @IBAction func voiceNumbers(sender: UIButton) {
        synth.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        animateLabel.animation = "zoomOut"
        animateLabel.curve = "easeIn"
        animateLabel.duration = 1.0
        animateLabel.animate()
        
        animateImg.animation = "zoomOut"
        animateImg.curve = "easeIn"
        animateImg.duration = 1.0
        animateImg.animate()
        buttonAnimation(voiceButton)
        let delay2 = 0.5 * Double(NSEC_PER_SEC)
        let time2 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay2))
        dispatch_after(time2, dispatch_get_main_queue())
        {
            self.animateLabel.hidden = true
            self.animateImg.hidden = true
        }
         myUtterance = AVSpeechUtterance(string: voiceNumber)
         myUtterance.rate = 0.4
         synth.speakUtterance(myUtterance)
        
    }
    
}


