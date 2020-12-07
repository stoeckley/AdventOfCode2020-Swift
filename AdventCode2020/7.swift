//
//  7.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 07/12/2020.
//

import Foundation

func search(child: String, graph: [String:Set<String>]) -> Set<String> {
    return (graph[child] ?? []).reduce(into: Set<String>()) {
        $0.insert($1)
        $0.formUnion(search(child: $1, graph: graph))
    }
}

func solve7(_ input: String) -> Int {
    
    let rules = input.components(separatedBy: .newlines)
        .filter { !$0.contains("no other bags") }
        .map { $0.components(separatedBy: " bags contain ") }
    
    let graph = rules.reduce(into: [String : Set<String>]()) { graph, rule in
        let parent = rule.first!
        let children = rule[1].components(separatedBy: ",").map {
            $0.split(separator: " ")
        }
        for child in children {
            let color = child[1...2].joined(separator: " ")
            graph[color, default: Set()].insert(parent)
        }
    }
    
    return search(child: "shiny gold", graph: graph).count
}

// part 2

struct Contents: Hashable {
    let quantity: Int
    let color: String
}

func search2(parent: String, graph: [String:Set<Contents>]) -> Int {
    return (graph[parent] ?? []).reduce(1) {
        $0 + $1.quantity * search2(parent: $1.color, graph: graph)
    }
}

func solve7b(_ input: String) -> Int {
    
    let rules = input.components(separatedBy: .newlines)
        .filter { !$0.contains("no other bags") }
        .map { $0.components(separatedBy: " bags contain ") }
    
    let graph = rules.reduce(into: [String : Set<Contents>]()) { graph, rule in
        let parent = rule.first!
        let children = rule[1].components(separatedBy: ",").map {
            $0.split(separator: " ")
        }
        for child in children {
            let quantity = Int(child.first!)!
            let color = child[1...2].joined(separator: " ")
            graph[parent, default: Set()].insert(Contents(quantity: quantity, color: color))
        }
    }
    
    return search2(parent: "shiny gold", graph: graph) - 1
}
