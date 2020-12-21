//
//  FuelComposition.swift
//  Ember
//
//  Created by Vishal Singh on 12/21/20.
//  Copyright © 2020 Vishal Singh. All rights reserved.
//

import Foundation

struct FuelComposition{
    
    var fuelID = 0
    var alpha = 0.0
    var beta = 0.0
    var gamma = 0.0
    var delta = 0.0
    
    let fuelComposition = [
        FuelFormula(fuelID: 0, carbon: 1, hydrogen: 4, oxygen: 0, nitrogen: 0),
        FuelFormula(fuelID: 1, carbon: 7, hydrogen: 17, oxygen: 0, nitrogen: 0),
        FuelFormula(fuelID: 2, carbon: 14.4, hydrogen: 24.9, oxygen: 0, nitrogen: 0),
        FuelFormula(fuelID: 3, carbon: 1, hydrogen: 4, oxygen: 1, nitrogen: 0),
        FuelFormula(fuelID: 4, carbon: 1, hydrogen: 3, oxygen: 2, nitrogen: 1)
    ]
    
    // Carbon Content
    mutating func getalpha(fuelID: Int) -> Double {
        alpha = fuelComposition[fuelID].carbon
        return alpha
    }
    
    // Hydrogen Content
    mutating func getbeta(fuelID: Int) -> Double {
        beta = fuelComposition[fuelID].hydrogen
        return beta
    }
    
    // Oxygen Content
    mutating func getgamma(fuelID: Int) -> Double {
        gamma = fuelComposition[fuelID].oxygen
        return gamma
    }
    
    // Nitrogen Content
    mutating func getdelta(fuelID: Int) -> Double {
        delta = fuelComposition[fuelID].nitrogen
        return delta
        
    }
    
    // Molecular Weight
    func getmw(fuelID: Int) -> Double {
        let mw = (12.01*alpha)+(1.008*beta)+(16.00*gamma)+(14.01*delta)
        return mw
    }
    
}
