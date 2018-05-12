//
//  ViewController.swift
//  GeoConverter
//
//  Created by Holger Hinzberg on 03.05.18.
//  Copyright © 2018 Holger Hinzberg. All rights reserved.
//

import Cocoa

class ViewController: NSViewController
{
    @IBOutlet weak var inputDegreeTextfield:NSTextField!
    @IBOutlet weak var inputMinutesTextfield:NSTextField!
    @IBOutlet weak var inputSecondsTextfield:NSTextField!
    @IBOutlet weak var outputDegreeTextfield:NSTextField!
    @IBOutlet weak var outputRadiantsTextfield:NSTextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let formatter = NumericOnlyInputFormatter()
        self.inputDegreeTextfield.formatter = formatter
        self.inputMinutesTextfield.formatter = formatter
        self.inputSecondsTextfield.formatter = formatter
        
        let numberFormatter = NumberFormatter()
        numberFormatter.formatterBehavior = NumberFormatter.Behavior.behavior10_4
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 3
        numberFormatter.minimumFractionDigits = 3
        numberFormatter.locale = NSLocale.current
        self.outputDegreeTextfield.formatter = numberFormatter
        self.outputRadiantsTextfield.formatter = numberFormatter
    
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func calculateButtonClicked(sender:AnyObject)
    {
        var resultDegrees:Double
        var resultRadiants:Double
        
        let inDegrees = self.inputDegreeTextfield.doubleValue
        let inMinutes = self.inputMinutesTextfield.doubleValue
        let inSeconds = self.inputSecondsTextfield.doubleValue
        
        resultDegrees = inDegrees + (inMinutes / 60.0) + (inSeconds / 3600.0)
        resultRadiants = resultDegrees / 180.0 * Double.pi
        
        self.outputDegreeTextfield.doubleValue = resultDegrees
        self.outputRadiantsTextfield.doubleValue = resultRadiants
        
        // self.outputDegree.stringValue = String(format: "%.3f", resultDegrees)
        // self.outputRadiants.stringValue = String(format: "%.3f", resultRadiants)
    }
    
    @IBAction func deleteButtonClicked(sender:AnyObject)
    {
        self.inputDegreeTextfield.stringValue = ""
        self.inputMinutesTextfield.stringValue = ""
        self.inputSecondsTextfield.stringValue = ""
        self.outputDegreeTextfield.stringValue = ""
        self.outputRadiantsTextfield.stringValue = ""
    }
}

