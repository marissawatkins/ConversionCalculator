//
//  ConverterViewController.swift
//  ConversionCalculator
//
//  Created by Marissa watkins on 11/10/17.
//  Copyright © 2017 Marissa Watkins. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var converters:[Converter] = [
        Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
        Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
        Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
        Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")
    ]
    
    //var userText = false
    var notNegative = true
    var userInput = ""
    var userOutput = ""
    
    var presentCon = Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C")
    
    @IBAction func convertingButton(_ sender: Any) {
        //nil title means no overhead title above message
        let alert = UIAlertController(title: nil, message: "Choose a converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        //action button that handles when the converter button is pressed
        for converter in converters {
            alert.addAction(UIAlertAction(title: converter.label, style: UIAlertActionStyle.default) {
                (_) in
                self.inputDisplay.text = self.userInput + " " + converter.inputUnit
                self.outputDisplay.text = converter.outputUnit
                self.presentCon.label = converter.label
                self.presentCon.outputUnit = converter.outputUnit
                self.presentCon.inputUnit = converter.inputUnit
                if let input = Double(self.userInput){
                    self.outputDisplay.text = self.handleCalc(input: input, currentConverter: self.presentCon)
                }
            })
        }
        self.present(alert, animated: true, completion: nil)
    }  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputDisplay.text = presentCon.outputUnit
        inputDisplay.text = presentCon.inputUnit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //function to handle calculations
    func handleCalc(input: Double, currentConverter: Converter) -> String {
        var output = 0.0
        switch(currentConverter.label){
        case "fahrenheit to celcius":
            output = ((input - 32) * (5/9))
            break
        case "celcius to fahrenheit":
            output = (input * (9/5)) + 32
            break
        case "miles to kilometers":
            output = input * 1.609344
            break
        case "kilometers to miles":
            output = input * 0.6214
            break
        default:
            break
        }
        userOutput = String.localizedStringWithFormat("%.2f", output) + " " + currentConverter.outputUnit
        return userOutput
    }
    
    //action button that handles when the '-' is pressed
    @IBAction func negativeButton(_ sender: Any) {
        if notNegative {
            userInput = "-" + userInput
            notNegative = false
        }else {
            userInput.removeFirst()
            notNegative = true
        }
        if let input = Double(userInput){
            self.inputDisplay.text = userInput + " " + presentCon.inputUnit
            self.outputDisplay.text = handleCalc(input: input, currentConverter: presentCon)
        }
    }
    
    
    //action button that handles the clear button
    //only clears the numbers, not the label
    @IBAction func clearButton(_ sender: UIButton) {
        inputDisplay.text = "" + self.presentCon.inputUnit
        outputDisplay.text = "" + self.presentCon.outputUnit
        userInput = ""
        notNegative = true
    }
    
    //action button that handles number buttons
    @IBAction func numberTappedButton(_ sender: UIButton) {
        userInput.append(sender.currentTitle!)
        inputDisplay.text = userInput + " " + presentCon.inputUnit
        if let input = Double(userInput){
            self.outputDisplay.text = handleCalc(input: input, currentConverter: presentCon)
        }
    }
}
