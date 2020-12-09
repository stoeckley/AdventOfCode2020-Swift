//
//  9.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 09/12/2020.
//

import Foundation

func findNumber(_ nums: [Int], preamble: Int) -> Int {
    
    let chunks = (preamble..<nums.count-1).map {
        Array(nums[$0-preamble...$0])
    }
    
    nextchunk: for chunk in chunks {
        for i in 0..<preamble-1 {
            for j in i+1..<preamble {
                if chunk[i]+chunk[j] == chunk.last! { continue nextchunk }
            }
        }
        return chunk.last!
    }
    
    return 0
}

func solve9(_ input: String, _ preamble: Int) -> Int {
    return findNumber(input.components(separatedBy: .newlines).map {Int($0)!}, preamble: preamble)
}

// part 2

func solve9b(_ input: String, _ preamble: Int) -> Int {
    let nums = input.components(separatedBy: .newlines).map {Int($0)!}
    let invalid = findNumber(nums, preamble: preamble)
    for i in 0..<nums.count-1 {
        for j in i+1..<nums.count {
            let range = nums[i...j]
            if range.reduce(0,+) == invalid {
                return range.max()! + range.min()!
            }
        }
    }
    return 0
}
