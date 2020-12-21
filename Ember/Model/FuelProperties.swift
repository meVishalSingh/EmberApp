//
//  FuelProperties.swift
//  Ember
//
//  Created by Vishal Singh on 12/21/20.
//  Copyright © 2020 Vishal Singh. All rights reserved.
//

import Foundation

struct FuelProperties{
    
    var fuelID = 0
    var h = 0.0
    var s = 0.0
    var cp = 0.0
    var fsv = 0.0
    var ac = 0.0
    var T = 400
    
    let fuelData = [
        FuelData(fuelID: 0, a: 1.971324, b: 7.871586e-3, c: -1.048592e-06, d: -9.930422e+3, e: 8.873728, stoicRatio: 0.0584, availEnergy: 52420),
        FuelData(fuelID: 1, a: 4.0652, b: 6.0977e-2, c: -1.8801e-05, d: -3.588e+4, e: 1.545e+1, stoicRatio: 0.06548, availEnergy: 47870),
        FuelData(fuelID: 2, a: 7.971, b: 1.1954e-01, c: -3.6858e-05, d: -1.9385e+4, e:  -1.7879 , stoicRatio: 0.06907, availEnergy: 45730),
        FuelData(fuelID: 3, a: 1.779819, b: 1.262503e-02, c: -3.624890e-6, d: -2.525420e+4, e: 1.50884e+1, stoicRatio: 0.1555, availEnergy: 22680),
        FuelData(fuelID: 4, a: 1.412633, b: 2.0871e-02, c: -8.14213e-6, d: -1.02635e+4, e: 1.917126e+1, stoicRatio: 0.5924, availEnergy: 12430),
    ]
    
    mutating func getStoicRatio(fuelID: Int) -> Double{
        fsv = fuelData[fuelID].stoicRatio
        return fsv
    }
    
    mutating func getAvailEnergy(fuelID: Int) -> Double{
        ac = fuelData[fuelID].availEnergy
        return ac
    }
    
    mutating func getEnthalpy(fuelID: Int, T: Double) -> Double{
        h = (fuelData[fuelID].a) + (fuelData[fuelID].b/2*T) + (fuelData[fuelID].c/3*pow(T,2)) + (fuelData[fuelID].d/T)
        return h
    }
    
    mutating func getEntropy(fuelID: Int, T: Double) -> Double{
        s = (fuelData[fuelID].a*log(T)) + (fuelData[fuelID].b*T) + (fuelData[fuelID].c/2*pow(T,2)) + (fuelData[fuelID].e)
        return s
    }
    
    mutating func getSpecificHeat(fuelID: Int, T: Double) -> Double{
        cp = (fuelData[fuelID].a) + (fuelData[fuelID].b*T) + (fuelData[fuelID].c*pow(T,2))
        return cp
    }
    
}
