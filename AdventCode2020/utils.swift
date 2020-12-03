//
//  utils.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 01/12/2020.
//

import Foundation

func readLines(_ input: String) -> [Substring] {
    return input.split(separator: "\n")
}

func readLinesToChars(_ input: String) -> [[Substring.Element]] {
    return readLines(input).map { Array($0) }
}

func readLinesSplitSpaces(_ input: String) -> [[Substring]] {
    return readLines(input).map { $0.split(separator: " ")}
}
