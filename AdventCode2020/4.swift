//
//  4.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 03/12/2020.
//

import Foundation

func solve4(_ input: String) -> Int{
    let passports = input.components(separatedBy: "\n\n")
    let required = Set(["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"])
    return passports.filter {
        Set($0.split(separator: "\n").flatMap {
            $0.split(separator: " ").map {
                String($0.split(separator: ":").first!)
            }
        }).intersection(required) == required
    }.count
}

// part 2

func validateYear(_ value: String.SubSequence, low: Int, high: Int) -> Bool {
    if let year = Int(value) {
        return (low...high).contains(year)
    }
    return false
}

func validateHeight(_ value: String.SubSequence, low: Int, high: Int) -> Bool {
    if let value = Int(value.prefix(value.count-2)) {
        return (low...high).contains(value)
    }
    return false
}

func validateHair(_ value: String.SubSequence) -> Bool {
    let valueContents = Set(value.dropFirst())
    return value.first! == "#" && value.count == 7 &&
        valueContents.intersection(Set("0123456789abcdef")).count == valueContents.count
}

func validField(_ field: Substring.SubSequence) -> String? {
    let parts = field.split(separator: ":")
    let field = String(parts.first!)
    let value = parts.last!
    let valid: Bool = {
        switch field {
        case "byr" : return validateYear(value, low: 1920, high: 2002)
        case "iyr" : return validateYear(value, low: 2010, high: 2020)
        case "eyr": return validateYear(value, low: 2020, high: 2030)
        case "hgt":
            switch value.suffix(2) {
            case "cm": return validateHeight(value, low: 150, high: 193)
            default : return validateHeight(value, low: 59, high: 76)
            }
        case "hcl": return validateHair(value)
        case "ecl":
            return Set(["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]).contains(value)
        case "pid": return value.count == 9 && Int(value) != nil
        case "cid": return true
        default: return false
        }
    }()
    return valid ? field : nil
}

func solve4b(_ input: String) -> Int{
    let passports = input.components(separatedBy: "\n\n")
    let required = Set(["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"])
    return passports.filter {
        Set($0.split(separator: "\n").flatMap {
            $0.split(separator: " ").map { validField($0) }
        }.compactMap{ $0 })
        .intersection(required) == required
    }.count
}
