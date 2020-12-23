//
//  CalculationBrain.swift
//  Ember
//
//  Created by Vishal Singh on 12/21/20.
//  Copyright © 2020 Vishal Singh. All rights reserved.
//

import Foundation

struct CalculationBrain{
    
    let fuelID = 0
    let T = 0.0
    let P = 0.0
    let phi = 0.0
    
    var combustionProduct = CombustionProducts(co2: 0, h20: 0, n2: 0, o2: 0, co: 0, h2: 0, h: 0, o: 0, oh: 0, no: 0)
    var h = 0.0
    var u = 0.0
    var s = 0.0
    var v = 0.0
    var r = 0.0
    var cp = 0.0
    var mw = 0.0
    var dvdT = 0.0
    var dvdP = 0.0
    
    // Solution Parameters
    let prec = 1e-3
    let maxIter = 20
    
    var guessFunction = GuessFunction()
    
    mutating func getComposition (T: Double, P: Double, phi: Double, fuelID: Int) -> CombustionProducts {
    
        combustionProduct.n2 = guessFunction.getComposition(T: T, phi: P, P: phi, fuelID: fuelID).y3
        combustionProduct.o2 = guessFunction.getComposition(T: T, phi: P, P: phi, fuelID: fuelID).y4
        combustionProduct.co = guessFunction.getComposition(T: T, phi: P, P: phi, fuelID: fuelID).y5
        combustionProduct.h2 = guessFunction.getComposition(T: T, phi: P, P: phi, fuelID: fuelID).y6
        
        return combustionProduct
        
    }

}
