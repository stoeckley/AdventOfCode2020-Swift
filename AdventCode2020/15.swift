//
//  15.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 15/12/2020.
//

import Foundation

func solve15(_ iterations: Int, _ input: [Int]) -> Int {
    
    var last_spoken = input.last!
    var lasts = input.enumerated().reduce(into: [Int:(Int,Int)]()) {
        $0[$1.1] = ($1.0+1,$1.0+1)
    }
    
    for turn in lasts.count+1...iterations {
        let (one,two) = lasts[last_spoken]!
        let new = two - one
        if let (_, lastTwo) = lasts[new] {
            lasts[new] = (lastTwo, turn)
        } else {
            lasts[new] = (turn,turn)
        }
        last_spoken = new
    }
    return last_spoken
}
