//
//  2.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 02/12/2020.
//

import Foundation

func validPassword(_ line: [String]) -> Bool {
    let minmax = line[0].components(separatedBy: "-")
    var n = 0
    for char in line[2] where char == line[1].first! {
        n += 1
    }
    return n >= Int(minmax[0])! && n <= Int(minmax[1])!
}

func solve2(_ input: String) -> Int {
    let lines = readLinesSplitSpaces(input)
    var answer = 0
    for line in lines where validPassword(line){
        answer += 1
    }
    return answer
}

func validPasswordb(_ line: [String]) -> Bool {
    let minmax = line[0].components(separatedBy: "-")
    let min = Int(minmax[0])!
    let max = Int(minmax[1])!
    let letter = line[1].first!
    let password = Array(line[2])
    let a = password[min-1] == letter
    let b = password[max-1] == letter
    if a && b {
        return false
    }
    return a || b
}

func solve2b(_ input: String) -> Int {
    let lines = readLinesSplitSpaces(input)
    var answer = 0
    for line in lines where validPasswordb(line){
        answer += 1
    }
    return answer
}
