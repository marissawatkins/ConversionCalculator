//
//  ConverterViewController.swift
//  ConversionCalculator
//
//  Created by Marissa watkins on 11/10/17.
//  Copyright © 2017 Marissa Watkins. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    let converters:[Converter] = [
        Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
        Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
        Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
        Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")
    ]
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    @IBAction func convertingButton(_ sender: UIButton) {
        //nil title means no overhead title above message
        let alert = UIAlertController(title: nil, message: "Choose a converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        for converter in converters {
            alert.addAction(UIAlertAction(title: converter.label, style: UIAlertActionStyle.default, handler: {
                (alertAction) -> Void in
                self.inputDisplay.text = converter.inputUnit
                self.outputDisplay.text = converter.outputUnit
                
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultConverter = converters[0]
        inputDisplay.text = defaultConverter.inputUnit
        outputDisplay.text = defaultConverter.outputUnit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
