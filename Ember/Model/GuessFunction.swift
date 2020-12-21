//
//  GuessFunction.swift
//  Ember
//
//  Created by Vishal Singh on 12/21/20.
//  Copyright © 2020 Vishal Singh. All rights reserved.
//

import Foundation

struct GuessFunction{
    
    var fuelComposition = FuelComposition()
    var equilibriumCoefficient = EquilibriumCoefficient()
    
    var y3 = 0.0
    var y4 = 0.0
    var y5 = 0.0
    var y6 = 0.0
    
    // Estimation for the number of moles
    var n = Array(repeating: 0.0, count: 6)
    
    mutating func getComposition (T: Double, phi: Double, P: Double, fuelID: Int) -> (y3: Double, y4: Double, y5: Double, y6: Double){
        
        let alpha = fuelComposition.getalpha(fuelID: fuelID)
        let beta = fuelComposition.getbeta(fuelID: fuelID)
        let gamma = fuelComposition.getgamma(fuelID: fuelID)
        let delta = fuelComposition.getdelta(fuelID: fuelID)
        
        let c5 = equilibriumCoefficient.returnCValue(P: P).c5
        let c6 = equilibriumCoefficient.returnCValue(P: P).c6
        
        // Stoichiometric Air-Fuel Ratio
        let afr = alpha + (beta/4) - (gamma/2)
        
        if phi <= 1{        // Lean Mixture
            n[1] = alpha
            n[2] = beta/2
            n[3] = delta/2 + (3.76*afr/phi)
            n[4] = afr*(1/phi - 1)
            
        }else{              // Rich Mixture
            let d1 = 2*afr*(1-1/phi)
            let z = T/1000
            let KK = exp( 2.743 - 1.761/z - 1.611/pow(z,2) + 0.2803/pow(z,3))
            
            let aa = 1-KK
            let bb = beta/2 + alpha*KK - d1*(1-KK)
            let cc = -alpha*d1*KK
            
            n[5] = (-bb + pow((pow(bb,2) - 4*aa*cc),0.5))/(2*aa)
            n[1] = alpha - n[5]
            n[2] = beta/2 - d1 + n[5]
            n[3] = delta/2 + 3.76*afr/phi
            n[6] = d1 - n[5]
        }
        
        let totalN = n.reduce(0, +)
        var ox = 1.0                      // Solving for a reasonable value of oxygen mole fraction
        let iterations = 40
        
        for _ in 1...iterations{
            
            let f = (2*totalN*ox) - gamma - (2*afr)/phi + (alpha*(2*c6*pow(ox,0.5) + 1))/(c6*pow(ox,0.5) + 1) + (beta*c5*pow(ox,0.5))/(2*c5*pow(ox,0.5) + 2)
            
            if f < 0 {
                break
            }else{
                ox = ox*0.1
            }
            
        }
        
        // Actual oxygen mole fraction using Newton-Raphson Method
        
        for _ in 1...iterations{
            
            var f = 2*totalN*ox
            f = f - gamma
            f = f - (2*afr)/phi
            f = f + (alpha*(2*c6*pow(ox,0.5) + 1))/(c6*pow(ox,0.5) + 1)
            f = f + (beta*c5*pow(ox,0.5))/(2*c5*pow(ox,0.5) + 2)
            
            var df = 2*totalN
            df = df - (beta*pow(c5,2))/pow((2*c5*pow(ox,0.5) + 2),2)
            df = df + (alpha*c6)/(pow(ox,0.5)*(c6*pow(ox,0.5) + 1))
            df = df + (beta*c5)/(2*pow(ox,0.5)*(2*c5*pow(ox,0.5) + 2))
            df = df - (alpha*c6*(2*c6*pow(ox,0.5) + 1))/pow(2*pow(ox,0.5)*(c6*pow(ox,0.5) + 1),2)
            
            let dox = f/df;
            ox = ox - dox;
            
            if abs(dox/ox) < 0.001 {
                break
            }
            
            y3 = 0.5*(delta + afr/phi*2*3.76)/totalN;
            y4 = ox;
            y5 = alpha/totalN/(1+c6*pow(ox,0.5));
            y6 = beta/2/totalN/(1+c5*pow(ox,0.5));
            
        }
        
        return (y3, y4, y5, y6)
        
    }
    
    
}
