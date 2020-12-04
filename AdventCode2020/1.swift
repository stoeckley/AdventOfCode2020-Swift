//
//  1.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 01/12/2020.
//

import Foundation

func solve1(_ input: String) -> Int {
    let input = readLines(input)
    for i in 0..<input.count {
        for j in i+1..<input.count {
            let a = Int(input[i])
            let b = Int(input[j])
            if let a = a, let b = b, a + b == 2020 {
                return a * b
            }
        }
    }
    return 0
}

// part 2

func solve1b(_ input: String) -> Int {
    let input = readLines(input)
    for i in 0..<input.count {
        for j in i+1..<input.count {
            for k in j+1..<input.count {
                let a = Int(input[i])
                let b = Int(input[j])
                let c = Int(input[k])
                if let a = a, let b = b, let c = c, a + b + c == 2020 {
                    return a * b * c
                }
            }
        }
    }
    return 0
}
