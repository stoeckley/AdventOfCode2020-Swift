//
//  14.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 14/12/2020.
//

import Foundation

func shift(mask: Array<Character>, num: Int) -> Int {
    var num = num
    for shift in 0...35 {
        if mask[shift] == "1" {
            num = num | NSDecimalNumber(decimal: pow(2,shift)).intValue
        } else if mask[shift] == "0" {
            num = num & ~(1 << shift)
        }
    }
    return num
}

func solve14(_ input: String) -> Int {
    let lines = input.components(separatedBy: .newlines)
    var mask = String.SubSequence()
    var dict = [Int:Int]()
    
    for line in lines {
        if line.contains("X") {
            mask = line.suffix(36)
            continue
        }
        let indexStr = line.dropFirst(4).prefix(while: { $0 != "]"})
        let index = Int(indexStr)!
        let equalsIndex = Array(line).firstIndex(of: "=")
        let numStr = line.suffix(line.count-equalsIndex! - 2)
        let num = Int(numStr)!
        dict[index] = shift(mask: Array(mask.reversed()), num: num)
    }
    return dict.reduce(0) { r, kv in r + kv.value}
}

// part 2

func genMask(mask: Array<Character>, address: Int) -> Array<Character> {
    let str = String(address, radix: 2, uppercase: true)
    let padding = String(repeating: "0", count: 36-Array(str).count)
    var address = Array(padding+str)
    for idx in 0...35 {
        if mask[idx] == "1" {
            address[idx] = "1"
        } else if mask[idx] == "X" {
            address[idx] = "X"
        }
    }
    return address
}

func genAddresses(_ arr: Array<Character>) -> [Int] {
    var ret = [Int] ()
    let x = arr.firstIndex(of: "X")
    if let index = x {
        var a = arr, b = arr
        a[index] = "1"
        b[index] = "0"
        let ag = genAddresses(a), bg = genAddresses(b)
        ret += ag
        ret += bg
    } else {
        return [Int(strtoul(String(arr), nil, 2))]
    }
    return ret
}

func solve14b(_ input: String) -> Int {
    let lines = input.components(separatedBy: .newlines)
    var mask = String.SubSequence()
    var dict = [Int:Int]()
    
    for line in lines {
        if line.contains("X") {
            mask = line.suffix(36)
            continue
        }
        
        let indexStr = line.dropFirst(4).prefix(while: { $0 != "]"})
        let index = Int(indexStr)!
        let equalsIndex = Array(line).firstIndex(of: "=")
        let numStr = line.suffix(line.count-equalsIndex! - 2)
        let num = Int(numStr)!
        
        let masker = genMask(mask: Array(mask), address: index)
        let addies = genAddresses(masker)
        for addy in addies {
            dict[addy] = num
        }
    }
    return dict.reduce(0) { r, kv in r + kv.value}
}
