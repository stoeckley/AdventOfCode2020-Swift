//
//  6.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 06/12/2020.
//

import Foundation

func solve6(_ input: String) -> Int {
    return input.components(separatedBy: "\n\n").reduce(0) { result, group in
        result + group.components(separatedBy: "\n").reduce(Set<Character>()) { $0.union(Set($1))
        }.count
    }
}

// part 2

func solve6b(_ input: String) -> Int {
    return input.components(separatedBy: "\n\n").reduce(0) { result, group in
        let people = group.components(separatedBy: "\n")
        return result + people.reduce(Set(people.first!)) { $0.intersection(Set($1))
        }.count
    }
}
