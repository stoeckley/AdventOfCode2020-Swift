//
//  6.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 06/12/2020.
//

import Foundation

func solve6(_ input: String) -> Int {
    return input.components(separatedBy: "\n\n")
        .map { $0.components(separatedBy: .newlines)}
        .reduce(0) {
            $0 + $1.reduce(Set<Character>()) { $0.union(Set($1)) }.count
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

/*
 
 particularly nice solution from:
 
 https://www.reddit.com/r/adventofcode/comments/k7ndux/2020_day_06_solutions/getpgnl/?utm_source=reddit&utm_medium=web2x&context=3
 
 // process groups
 let forms = input.components(separatedBy: .newlines).split(separator: "")
 
 // part 1
 forms.compactMap { f in Set(f.joined()).count }.reduce(0, +)
 
 // part 2
 forms.compactMap { g in g.reduce(Set(g.joined())) { r, e in r.intersection(Set(e)) }.count }.reduce(0, +)
 
 */
