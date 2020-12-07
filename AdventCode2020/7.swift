//
//  7.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 07/12/2020.
//

import Foundation

func search(child: String, dict: [String:Set<String>]) -> Set<String> {
    var result = Set<String>()
    if let parents = dict[child] {
        for parent in parents {
            result.insert(parent)
            result.formUnion(search(child: parent, dict: dict))
        }
    }
    return result
}

func solve7(_ input: String) -> Int {
    let rules = input.components(separatedBy: .newlines)
        .filter { !$0.contains("no other bags") }
        .map { $0.components(separatedBy: " bags contain ") }
    let dict = rules.reduce(into: [String: Set<String>]()) { dict, rule in
        let parent = rule.first!
        let children = rule[1].components(separatedBy: ",").map {
            $0.split(separator: " ")
        }
        for child in children {
            let color = child[1...2].joined(separator: " ")
            dict[color, default: Set()].insert(parent)
        }
    }
    return search(child: "shiny gold", dict: dict).count
}

// part 2

struct Contents: Hashable {
    let quantity: Int
    let color: String
}

func search2(parent: String, dict: [String:Set<Contents>]) -> Int {
    var n  = 1
    if let children = dict[parent] {
        for child in children {
            n += child.quantity * search2(parent: child.color, dict: dict)
        }
    }
    return n
}

func solve7b(_ input: String) -> Int {
    let rules = input.components(separatedBy: .newlines)
        .filter { !$0.contains("no other bags") }
        .map { $0.components(separatedBy: " bags contain ") }
    let dict = rules.reduce(into: [String : Set<Contents>]()) { dict, rule in
        let parent = rule.first!
        let children = rule[1].components(separatedBy: ",").map {
            $0.split(separator: " ")
        }
        for child in children {
            let quantity = Int(child.first!)!
            let color = child[1...2].joined(separator: " ")
            dict[parent, default: Set()].insert(Contents(quantity: quantity, color: color))
        }
    }
    return search2(parent: "shiny gold", dict: dict) - 1
}
