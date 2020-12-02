//
//  utils.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 01/12/2020.
//

import Foundation

func readLines(_ input: String) -> [String] {
    return input.components(separatedBy: "\n")
}

func readLinesSplitSpaces(_ input: String) -> [[String]] {
    let lines = readLines(input)
    var output = [[String]]()
    for line in lines {
        output.append(line.components(separatedBy: " "))
    }
    return output
}
