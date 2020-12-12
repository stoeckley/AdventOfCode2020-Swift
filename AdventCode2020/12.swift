//
//  12.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 12/12/2020.
//

import Foundation

func solve12(_ input: String) -> Int {
    let steps = input.components(separatedBy: .newlines).map {
        ($0.first!,$0.dropFirst())
    }
    
    enum Direction: Character {
        case north = "N"; case south="S"; case east="E"; case west="W"
        
        mutating func moveLeft(_ distance: Int) {
            var distance = distance
            while distance > 0 {
                switch self {
                case .north: self = .west
                case .south: self = .east
                case .east: self = .north
                case .west: self = .south
                }
                distance -= 90
            }
        }
        
        mutating func moveRight(_ distance: Int) {
            var distance = distance
            while distance > 0 {
                switch self {
                case .north: self = .east
                case .south: self = .west
                case .east: self = .south
                case .west: self = .north
                }
                distance -= 90
            }
        }
        
    }
    
    var dir = Direction.east
    var northsouth = 0, eastwest = 0
    
    func move(_ direction: Direction, _ distance: Int) {
        switch direction {
        case .north: northsouth += distance
        case .south: northsouth -= distance
        case .east: eastwest += distance
        case .west: eastwest -= distance
        }
    }
    
    for step in steps {
        let distance = Int(step.1)!
        switch step.0 {
        case "L": dir.moveLeft(distance)
        case "R": dir.moveRight(distance)
        case "F": move(dir,distance)
        default: move(Direction(rawValue: step.0)!, distance)
        }
    }
    
    return abs(northsouth) + abs(eastwest)
}

// part 2

func solve12b(_ input: String) -> Int {
    let steps = input.components(separatedBy: .newlines).map {
        ($0.first!,$0.dropFirst())
    }
    
    var waynorthsouth = 1, wayeastwest = 10
    var northsouth = 0, eastwest = 0
    
    func moveWay(_ char: Character, _ distance: Int) {
        switch char {
        case "N": waynorthsouth += distance
        case "S": waynorthsouth -= distance
        case "E": wayeastwest += distance
        case "W": wayeastwest -= distance
        default: break
        }
    }
    
    func rotateLeft(_ angle: Int) {
        var angle = angle
        while angle > 0 {
            let wayn = waynorthsouth
            let waye = wayeastwest
            waynorthsouth = waye; wayeastwest = -wayn
            angle -= 90
        }
    }
    
    func rotateRight(_ angle: Int) {
        var angle = angle
        while angle > 0 {
            let wayn = waynorthsouth
            let waye = wayeastwest
            waynorthsouth = -waye; wayeastwest = wayn
            angle -= 90
        }
    }
    
    for step in steps {
        let distance = Int(step.1)!
        switch step.0 {
        case "L": rotateLeft(distance)
        case "R": rotateRight(distance)
        case "F":
            northsouth += waynorthsouth * distance
            eastwest += wayeastwest * distance
        default: moveWay(step.0, distance)
        }
    }
    
    return abs(northsouth) + abs(eastwest)
}

