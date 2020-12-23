//
//  Error.swift
//  Ember
//
//  Created by Vishal Singh on 12/22/20.
//  Copyright © 2020 Vishal Singh. All rights reserved.
//

import Foundation

struct Error{
    let ierr : [Int:String] = [
        0: "success",
        1: "singular matrix",
        2: "maximal pivot error in gaussian elimination",
        3: "no solution in maximum number of iterations",
        4: "result failed consistency check sum(Y)=1",
        5: "failure to obtain initial guess for oxygen concentration",
        6: "negative oxygen concentration in initial guess calculation",
        7: "maximum iterations reached in initial guess solution",
        8: "temperature out of range",
        9: "pressure out of range",
        10:"equivalence ratio too lean",
        11:"equivalence ratio too rich, solid carbon will be formed for given fuel"
    ]
}
