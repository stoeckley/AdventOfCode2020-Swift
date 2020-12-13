//
//  13.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 12/12/2020.
//

import Foundation

func solve13(_ input: String) -> Int {
    let lines = input.components(separatedBy: .newlines)
    let time = Int(lines[0])!
    let ids = lines[1].split(separator: ",").filter { $0 != "x" }
    
    let ans = ids.map {
        (id: String.SubSequence) -> (Int, Int) in
        let id = Int(id)!
        let mod = time % id
        return (time + (id - mod),id)
    }
    
    let sorted = ans.sorted {
        l,r in l.0 < r.0
    }
    
    return sorted.first!.1 * (sorted.first!.0 - time)
}

// part 2

func solve13b(_ input: String) -> Int {
    let lines = input.components(separatedBy: .newlines)
    let ids = lines[1].split(separator: ",").map {
        (id: String.SubSequence) -> Int in id == "x" ? 1 : Int(id)!
    }
    var inc = ids.first!
    var index = 1
    var t = inc
    while index < ids.count {
        if (t + index) % ids[index] == 0 {
            inc *= ids[index]
            index += 1
        } else {
            t += inc
        }
    }
    return t
}
