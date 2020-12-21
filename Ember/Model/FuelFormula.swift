//
//  Fuel.swift
//  Ember
//
//  Created by Vishal Singh on 12/21/20.
//  Copyright © 2020 Vishal Singh. All rights reserved.
//

import Foundation

struct FuelFormula{
    
    let fuelID: Int
    let carbon: Double
    let hydrogen: Double
    let oxygen: Double
    let nitrogen: Double
    
    init(fuelID: Int, carbon: Double, hydrogen: Double, oxygen: Double, nitrogen: Double){
        self.fuelID = fuelID
        self.carbon = carbon
        self.hydrogen = hydrogen
        self.oxygen = oxygen
        self.nitrogen = nitrogen
    }
    
}
