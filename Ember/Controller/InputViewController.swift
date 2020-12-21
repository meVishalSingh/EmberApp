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
    
    var fuelType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fuelSelection(_ sender: UIButton) {
        
        methaneButton.isSelected = false
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
        
        print(fuelType)
        
    }
    
    
    
}
