//
//  EquillibriumCoefficient.swift
//  Ember
//
//  Created by Vishal Singh on 12/21/20.
//  Copyright © 2020 Vishal Singh. All rights reserved.
//

import Foundation

struct EquilibriumCoefficient {
    
    var i = 0
    var K = Array(repeating: 0.0, count: 6)
    var c = Array(repeating: 0.0, count: 6)
    var T = 0.0
    var P = 0.0
    
    let Kp = [
        EquilibriumConstant(a: 0.432168, b: -0.112464e+5, c: 0.267269e+1, d: -0.745744e-4, e: 0.242484e-8),
        EquilibriumConstant(a:  0.310805, b: -0.129540e+5, c: 0.321779e+1, d: -0.738336e-4, e: 0.344645e-8),
        EquilibriumConstant(a: -0.141784, b: -0.213308e+4, c: 0.853461, d: 0.355015e-4, e: -0.310227e-8 ),
        EquilibriumConstant(a: 0.150879e-1, b: -0.470959e+4, c: 0.646096, d: 0.272805e-5, e: -0.154444e-8),
        EquilibriumConstant(a: -0.752364, b: 0.124210e+5, c: -0.260286e+1, d: 0.259556e-3, e: -0.162687e-7),
        EquilibriumConstant(a: -0.415302e-2, b: 0.148627e+5, c: -0.475746e+1, d: 0.124699e-3, e: -0.900227e-8),
    ]
    
    mutating func calculateK (T: Double){
        
        for i in 0...5 {
            let log10Ki = (Kp[i].a*log(T/1000)) + (Kp[i].b/T) + (Kp[i].c) + (Kp[i].d*T) + (Kp[i].e*pow(T,2))
            K[i] = pow(10,log10Ki)
    }
        
    }
    
    mutating func returnCValue(P: Double) -> (c1: Double, c2: Double, c3: Double, c4: Double, c5: Double, c6: Double){
       
        let sqp = pow(P/101.325, 0.5)
        
        c[1] = K[1]/sqp
        c[2] = K[2]/sqp
        c[3] = K[3]
        c[4] = K[4]
        c[5] = K[5]*sqp
        c[5] = K[5]*sqp
        
        return (c[1], c[2], c[3], c[4], c[5], c[6])
    }
    
}
