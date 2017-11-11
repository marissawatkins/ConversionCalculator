//
//  Converter.swift
//  ConversionCalculator
//
//  Created by Marissa watkins on 11/11/17.
//  Copyright © 2017 Marissa Watkins. All rights reserved.
//

import Foundation

struct Converter {
    var label:String
    var inputUnit: String
    var outputUnit:String
    
    init(label: String, inputUnit: String, outputUnit: String){
        self.label = label
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
        
    }
}
