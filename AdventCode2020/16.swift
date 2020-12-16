//
//  16.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 16/12/2020.
//

import Foundation

func solve16(_ input: String) -> Int {
    let groups = input.components(separatedBy: "\n\n")
    let fieldLines = groups.first!.components(separatedBy: .newlines)
    let fieldRanges = fieldLines.map {Array($0).drop{$0 != ":"}.dropFirst(2) }
    var validNums = Set<Int>()
    for line in fieldRanges {
        let space1 = line.firstIndex(of: " ")!
        let space2 = line.lastIndex(of: " ")!
        let dash1 = line.firstIndex(of: "-")!
        let dash2 = line.lastIndex(of: "-")!
        let n1 = Int(String(line[..<dash1]))!
        let n2 = Int(String(line[dash1+1..<space1]))!
        let n3 = Int(String(line[space2+1..<dash2]))!
        let n4 = Int(String(line[(dash2+1)...]))!
        validNums.formUnion(n1...n2)
        validNums.formUnion(n3...n4)
    }
    
    var invalids = [Int]()
    for line in groups.last!.components(separatedBy: .newlines).dropFirst()
    {
        let nums = line.split(separator: ",").map { Int($0)! }
        for num in nums {
            if !validNums.contains(num) {
                invalids.append(num)
            }
        }
    }
    return invalids.reduce(0,+)
}

// part 2

func solve16b(_ input: String) -> Int {
    let groups = input.components(separatedBy: "\n\n")
    let fieldLines = groups.first!.components(separatedBy: .newlines)
    let fieldRanges = fieldLines.map {Array($0).drop{$0 != ":"}.dropFirst(2) }
    
    let myticket = groups[1].components(separatedBy: .newlines)[1].split(separator: ",").map {Int($0)!}
    
    let fields = fieldLines.map { elm -> String in
        let colon = Array(elm).firstIndex(of: ":")!
        return String(Array(elm).prefix(colon))
    }
    var validNums = Set<Int>()
    var fieldsDict = [String: Set<Int>]()
    for (n,line) in fieldRanges.enumerated() {
        let space1 = line.firstIndex(of: " ")!
        let space2 = line.lastIndex(of: " ")!
        let dash1 = line.firstIndex(of: "-")!
        let dash2 = line.lastIndex(of: "-")!
        let n1 = Int(String(line[..<dash1]))!
        let n2 = Int(String(line[dash1+1..<space1]))!
        let n3 = Int(String(line[space2+1..<dash2]))!
        let n4 = Int(String(line[(dash2+1)...]))!
        let s = Set(n1...n2).union(Set(n3...n4))
        fieldsDict[fields[n]] = s
        validNums.formUnion(n1...n2)
        validNums.formUnion(n3...n4)
    }
    
    var validTickets = [[Int]] ()
    findValids:
    for line in groups.last!.components(separatedBy: .newlines).dropFirst()
    {
        let nums = line.split(separator: ",").map { Int($0)! }
        for num in nums {
            if !validNums.contains(num) {
                continue findValids
            }
        }
        validTickets.append(nums)
    }
    
    func fieldOptionsForTicket(_ ticket: [Int]) -> [Set<String>] {
        return ticket.map { num in
            fieldsDict.reduce(into: Set<String>()) {
                if $1.value.contains(num) {
                    $0.insert($1.key)
                }
            }
        }
    }
    
    let ticketsFieldsOptions = validTickets.map(fieldOptionsForTicket)

    var reducedOptions = ticketsFieldsOptions.first!
    for ticket in ticketsFieldsOptions.dropFirst() {
        for (i,s) in ticket.enumerated() {
            reducedOptions[i] = reducedOptions[i].intersection(s)
        }
    }
    
    while reducedOptions.filter({$0.count > 1}).count > 1 {
        for idx in 0..<reducedOptions.count {
            if reducedOptions[idx].count == 1 {
                for i in 0..<reducedOptions.count {
                    if i != idx {
                        reducedOptions[i] = reducedOptions[i].subtracting([reducedOptions[idx].first!])
                    }
                }
            }
        }
    }
    
    var departures = [Int]()
    for (idx,option) in reducedOptions.map({$0.first!}).enumerated() {
        if option.contains("departure") {
            departures.append(idx)
        }
    }
    
    return departures.reduce(1) {
        $0 * myticket[$1]
    }
}
