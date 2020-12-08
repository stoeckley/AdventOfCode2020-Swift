//
//  8.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 08/12/2020.
//

import Foundation

func solve8(_ input: String) -> Int {
    let lines = input.components(separatedBy: "\n")
    var codes = lines.map { line -> (String, Int, Int) in
        let line = line.split(separator: " ")
        return (String(line[0]), Int(line[1])!, 0)
    }
    
    var acc = 0
    var index = 0
    while true {
        let (code, value, n) = codes[index]
        if n == 1 { break }
        codes[index].2 += 1
        switch code {
        case "acc": acc += value; index += 1
        case "jmp": index += value
        default: index += 1
        }
    }
    
    return acc
}

// part 2

func run(_ codes: inout [(String, Int, Int)]) -> Int? {
    var acc = 0
    var index = 0
    while true {
        if index == codes.count { break }
        let (code, value, n) = codes[index]
        if n == 1 { return nil }
        codes[index].2 += 1
        switch code {
        case "acc": acc += value; index += 1
        case "jmp": index += value
        default: index += 1
        }
    }
    
    return acc
}

func solve8b(_ input: String) -> Int {
    let lines = input.components(separatedBy: "\n")
    let codes = lines.map { line -> (String, Int, Int) in
        let line = line.split(separator: " ")
        let code = line[0]
        let value = Int(line[1])!
        return (String(code),value, 0)
    }
    
    for (index,(code, _, _)) in codes.enumerated() {
        if code == "nop" {
            var newcodes = codes
            newcodes[index].0 = "jmp"
            if let acc = run(&newcodes) {
                return acc
            }
        } else if code == "jmp" {
            var newcodes = codes
            newcodes[index].0 = "nop"
            if let acc = run(&newcodes) {
                return acc
            }
        }
    }
    return 0
}
