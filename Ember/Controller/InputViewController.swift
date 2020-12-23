//
//  InputViewController.swift
//  Ember
//
//  Created by Vishal Singh on 12/21/20.
//  Copyright © 2020 Vishal Singh. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    @IBOutlet weak var methaneButton: UIButton!
    @IBOutlet weak var gasolineButton: UIButton!
    @IBOutlet weak var dieselButton: UIButton!
    @IBOutlet weak var methanolButton: UIButton!
    @IBOutlet weak var nitromethaneButton: UIButton!
    @IBOutlet weak var temperatureTextField: UITextField!
    @IBOutlet weak var pressureTextField: UITextField!
    @IBOutlet weak var equivRatioTextField: UITextField!
    
    var fuelType = 0
    var calculationBrain = CalculationBrain()
    var combustionProducts = CombustionProducts(co2: 0, h20: 0, n2: 0, o2: 0, co: 0, h2: 0, h: 0, o: 0, oh: 0, no: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fuelSelection(_ sender: UIButton) {
        
        methaneButton.isSelected = true
        gasolineButton.isSelected = false
        dieselButton.isSelected = false
        methanolButton.isSelected = false
        nitromethaneButton.isSelected = false
        
        sender.isSelected = true
        
        let fuelName = sender.currentTitle!
        
        switch fuelName{
            
        case "Methane":
            fuelType = 0
            
        case "Gasoline":
            fuelType = 1
            
        case "Diesel":
            fuelType = 2
            
        case "Methanol":
            fuelType = 3
            
        case "Nitromethane":
            fuelType = 4
            
        default:
            print("Error in fuel selection")
            
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        
        let Ttext = temperatureTextField.text!
        let Ptext = pressureTextField.text!
        let phitext = equivRatioTextField.text!
        
        if Ttext != ""{
            if Ptext != ""{
                if phitext != ""{
                    let T = Double(Ttext)
                    let P = Double(Ptext)
                    let phi = Double(phitext)
                    
                    combustionProducts = calculationBrain.getComposition(T: T!, P: P!, phi: phi!, fuelID: fuelType)
                    
                    print(String(format: "%.2f", combustionProducts.n2))
                    print(String(format: "%.2f", combustionProducts.o2))
                    print(String(format: "%.2f", combustionProducts.co))
                    print(String(format: "%.2f", combustionProducts.h2))
                }
            }
        }
        
        
    }
    
    
    
}
