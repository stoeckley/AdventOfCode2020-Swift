//
//  11.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 11/12/2020.
//

import Foundation

func solve11(_ input: String) -> Int {
    var seats = input.components(separatedBy: .newlines).map { Array($0) }
    
    func nOccupied(_ row: Int, _ col: Int) -> Int {
        var n = 0
        for r in -1...1 {
            for c in -1...1 {
                if r == 0 && c == 0 { continue }
                if (0..<seats.count).contains(row + r) &&
                    (0..<seats.first!.count).contains(col + c) &&
                    seats[row+r][col+c] == "#" {
                    n += 1
                }
            }
        }
        return n
    }
    
    func iterate() {
        var copy = seats
        for row in 0..<seats.count {
            for col in 0..<seats.first!.count {
                let n = nOccupied(row, col)
                if copy[row][col] == "L" && n == 0 {
                    copy[row][col] = "#"
                } else if copy[row][col] == "#" && n>=4{
                    copy[row][col] = "L"
                }
            }
        }
        seats = copy
    }
    
    var last = [[String.Element]]()
    var nIterations = 0
    while seats != last {
        last = seats
        iterate()
        nIterations += 1
    }
    
    return seats.reduce(0) { res, row in
        res + row.filter { $0 == "#" }.count
    }
}

// part 2

func solve11b(_ input: String) -> Int {
    var seats = input.components(separatedBy: .newlines).map { Array($0) }
    
    func look(_ row: Int, _ col: Int, _ r: Int, _ c: Int) -> Character? {
        if (0..<seats.count).contains(row + r) &&
            (0..<seats.first!.count).contains(col + c) {
            return seats[row+r][col+c]
        } else {
            return nil
        }
    }
    
    func nOccupied(_ row: Int, _ col: Int) -> Int {
        var n = 0
        for r in -1...1 {
            for c in -1...1 {
                if r == 0 && c == 0 { continue }
                guard let ch = look(row,col,r,c) else {continue}
                if ch == "#" {
                    n += 1
                } else if ch == "."{
                    var mult = 2
                    while true {
                        guard let ch = look(row,col,r*mult,c*mult),
                              ch != "L" else { break }
                        if ch == "#" {
                            n+=1
                            break
                        } else {
                            mult += 1
                        }
                    }
                }
            }
        }
        return n
    }
    
    func iterate() {
        var copy = seats
        for row in 0..<seats.count {
            for col in 0..<seats.first!.count {
                let n = nOccupied(row, col)
                if copy[row][col] == "L" && n == 0 {
                    copy[row][col] = "#"
                } else if copy[row][col] == "#" && n >= 5 {
                    copy[row][col] = "L"
                }
            }
        }
        seats = copy
    }
    
    var last = [[String.Element]]()
    var nIterations = 0
    while seats != last {
        last = seats
        iterate()
        nIterations += 1
    }
    
    return seats.reduce(0) { res, row in
        res + row.filter { $0 == "#" }.count
    }
}
