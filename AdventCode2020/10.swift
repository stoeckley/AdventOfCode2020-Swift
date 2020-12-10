//
//  10.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 09/12/2020.
//

import Foundation

func solve10(_ input: String) -> Int {
    let nums = input.components(separatedBy: .newlines).map({ Int($0)! }).sorted()
    var last = 0, n1 = 0, n3 = 0
    for num in nums + [nums.last! + 3] {
        if num - last == 1 {
            n1 += 1
        } else {
            n3 += 1
        }
        last = num
    }
    return n1 * n3
}

// part 2

func solve10b (_ input: String) -> Int {
    let nums = input.components(separatedBy: .newlines).map({ Int($0)! }).sorted()
    var dict = [0:1]
    for num in nums {
        dict[num] = dict[num-1, default: 0] + dict[num-2, default: 0] + dict[num-3, default: 0]
    }
    return dict[nums.last!] ?? 0
}
