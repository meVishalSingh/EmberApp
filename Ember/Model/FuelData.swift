//
//  FuelData.swift
//  Ember
//
//  Created by Vishal Singh on 12/21/20.
//  Copyright © 2020 Vishal Singh. All rights reserved.
//

import Foundation

struct FuelData{
    
    let fuelID: Int
    
    // Curve fit coefficients for thermodynamic properties
    let a: Double
    let b: Double
    let c: Double
    let d: Double
    let e: Double
    
    // Stoichiometric Fuel-Air ratio
    let stoicRatio: Double
    
    // Available energy for combustion
    let availEnergy: Double
    
    init(fuelID: Int, a: Double, b: Double, c: Double, d: Double, e:Double, stoicRatio: Double, availEnergy: Double){
        self.fuelID = fuelID
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.stoicRatio = stoicRatio
        self.availEnergy = availEnergy
    }
    
}
