//
//  3-input.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 02/12/2020.
//

import Foundation

let input3 = """
.##.#.........#.....#....#...#.
.#.#.#...#.......#.............
......#..#....#.#...###.......#
.......###......#.....#..##..#.
..#...##.......#.......###.....
....###.#....###......#....#..#
......#..#....#...##...........
..#..#....#...#.....####.......
...#........#.#.......#..#...#.
......#...#........#...#..##...
#..#........#............#...##
..#..#.#....#...........#...###
#.#..#...........#.##.#.#....#.
.#.#....#...##.....#...........
.....##....#...#..............#
...#....#...#.#.#.#...#........
#....#....#.#.#..#....#..#..#..
.................#..#.....#....
#..###...#.#..#.#......#.......
...#..........#......#....#....
.#.#.........##..#.......#...#.
.#..........#...#..#...........
....##.#.......................
.......#...........#...#.......
...#...#..##...#....###..#....#
....#.#.....##...##.#.#........
...........#.#..#.#......#..#..
.....#.....#....#...#........#.
..#......#..#.........#.....#..
.........................#...#.
#...#...#....#........##....#..
#..#.#.............#..........#
.#.........#.....#..#.#.#..#.#.
#...#..#.......####.#....##....
##...##..#.#.#...#.#.....#..#.#
.#..#....#.##........#...#....#
#...#..##.#....##..#..#.#......
.#........#.....#.#....##.##.#.
...#...#........#..#.##.##.....
....................#.#.#.#...#
..####.#..##...#....#.....##...
#......#.....#.#......#.#..#.##
..#.....#..#...........##.#....
#....#........#............#...
..##....#..............#......#
..#......#.#.......####......#.
..............##....#....##.#..
.#...............#....#....#.#.
..#.#.#..#.......##.#..........
.#...#.......#.#....#.##.......
.....#.##...#...........#.#....
..#.#..#...#..##...#.#.......##
.#.....#....#.#......#.#.......
....##.........#.#.............
.......##.......#..............
..........#......#......#....##
..##.....#..#.#..........#.....
...#....#.......#....##........
.......#...........#...........
...#.#......#.#........#....#..
.....#...........#.#.#...#.#..#
.#.#...#.#.#..........#.....###
#........#...#.................
...##.....#.....#..#..#.......#
......##...........#..#....##..
.........#............##...#...
.....#.....##...##.............
.#....#..#.#.#.#...#..#..#.....
.....#..#.#..#....#..#.........
....#.....#......#...#.........
#..#..#.................#......
.###.....#...#.#........##.#...
..#...#....#.##..#.....#.#....#
..#...##.................#.#...
....##..........#..#..#..#....#
....#..##....##.....#.#....#...
.#.#.#.....##........#.##..##.#
....#..#......#..#........#....
.......#.....###.#....#.......#
#....#.......#......##.#.......
.##.#.........#.#..##..#....##.
......#........#.#....#...#....
.####.....#.........#.#......##
##....#......#....#..#.#....##.
...........###.#.....#..#......
.......#...........#...........
........###....#..#.#..........
....#........#......#..........
.........#......#..............
...#...............#......#...#
....#..##...#.........#...#....
##........#.#....#......###....
....#.......................#..
#................#.#..#......##
...#.#.....#...#...........#.##
.#....#.##......#...##.#....#..
#...#....#..............#..#..#
.......#....#.##............#.#
.....#.#.......#.#...#.........
...#.....#..##...##...#........
..#.......#..####..#..#...#....
#.#................##...##.#..#
.....#.....##.#.....#......#..#
....#.#...#.........#.........#
..#......#............#.....#..
.....#..........#.#..#..##...##
........#................#.#...
#...#.#....##...###...#.#......
.............##.#..##..........
#..#......#...........#......#.
#.#....#..........#.##....###..
.............#.........#....#..
#........#..#.#..#...#....#....
..............#..............##
.....#...#..............#.##...
#...##..#...........#..........
..#....#...#.#........#..#.#..#
..##......#...............#....
....#...#..###..#......###.#...
.......##..#.#........#....#...
..##...#.......#...#...........
.#.......#.....#.#...##..#....#
.............#.......#.#.#....#
#.......#..#..#...#.#......##..
#.##..#..#..#....##.#...###.#.#
...##...#..#..#........#.#..#..
#....##........................
##...#...#......#.#.....#..#...
......#............#....#......
#......#.......#.......##.#....
..................#..#..#.#....
..#..................##.#......
..##........#.#.....##..#..#.#.
#....#..............#....####..
#..#..........................#
..#.#.#.#....#.......#....#.#..
.....#.#........#..........#.#.
........#.....#.......#........
#.....#....#.###.....#.......#.
.....##.#...#.#..#...#.#.#.....
......##...#.#...##..........#.
.#............#.....#..#....#..
.#................#.#..#.......
....................##...##....
#.......##...#.....#..#........
.##....#.#.#.#...........#...#.
..#.#..#.#.........#...........
...#......#.....#...##.........
..........#.#.....###.#........
.............#.....##..........
.........#...####........#.####
...................#....#......
.....#.........#.#....#..#...#.
.##...#.......##.#...#.#.#..#..
.....##........#....#...#.##.#.
#...#...#.#....#..............#
#..#.##.............#..........
..#...#..#.#.##..............##
#......#.#...##..........#.##..
.##.#...#...#.........#.#......
......#........##.#..#.........
#..#.......#......#.#..#.#.....
.#..#...........#.#.##.....#...
.....................#..#.#....
........#...##......#.....##...
#.............#...##....##....#
#.#...........#....##.#......##
.....#.....#.#..........###..#.
....#...#....##....#..##.......
.#....#....#.......#.#.....#...
.#...#.......##...##........#..
......##.......#.##.#.###......
....##.......#......#..........
...................#..##.......
......................#...##...
...##....#.#..#..#.............
.#......##..........#...#......
....##..#....#..#...#...####.#.
...#.......#.......#........#.#
#.........#..#...#...##...#.#.#
....#...#.......#...#....#.....
...#.....#.##..##.#.......##.##
.......#....#........#.........
.....#...#....#..#....#....#...
.##....#...#........#...#.#...#
.......##............#..#...#..
#.#...#....#......#.#..........
.#.##...........#........#.....
.#....#.............#.#.##.....
#.......###..#...###.........#.
#..#.#.......#.........#...#..#
..........#......#........#...#
.#.#...#.##.......##...........
.....#.........#.....#.........
.........#.........#....##.#..#
.#.......##..##..#.....#...#...
.#.....##...#..#..............#
..##...#..#..#.#...#..........#
.#.......####......#......####.
##..##........#.....#........#.
..##.#..#.#....................
...........#..#...##....##.....
..#.#........#.........#....##.
..#...#..##..###.#..###........
......#..#.............#..##...
.##.........#.#..#...#.##.###..
.#...............#...........#.
.#....#........#....#........##
..#####.#.#..#.#........##...#.
###....#....#...#..............
.....#...##............#...#...
##...........##.#.##.....#.....
..............#..#.....#...#...
...................#...........
#..........##.........#........
...#.........#..#.....#..#..#..
....###.#......#......##....#..
#......#..........#...#........
...#.#...#..#..........##......
.....##.....#.#............##..
..#..#.###....#.#.#...##....#..
...#........#....##.......#....
.#.............#..##.......#...
..#.#..###..#.....#...##.......
.........#......##...#.#..#....
.............#....##....#.#....
#..#...#....#.#...#......##....
.............#.#......#.....###
#.##....#........#.............
.....#...#.####...#.....#......
....#....###....##.......#.....
..#....##..#....#.#.......#....
...#.....#....#.........#......
.#......#.#....#.#........#....
.......#......#.....#.#..#.....
#......#.........##.##.#...#...
..#.###...................#....
....#..#....##.#........#....#.
...........#..........#......#.
.#..#.#...###..........#..#...#
...#...##..#....#...#..........
.#........#.................##.
....#.......##....#...#........
#.#...##.##...#.#.......#...#..
.....#.#.##.#......#..#..##....
.....##...#.#.....#...#........
#.#.......#..#..........##.....
................#......#..#.#.#
#......#...#...................
...#.....##.#.........#.#..#..#
...#..##..##.......#....#......
....##...#....#..#...........#.
..#..#......#...#..#...........
...#.##....#...##.......#......
.......#....#..#..##..#..#....#
.#.................#.#...#.##..
.....#..................#..#.#.
...#......##...#...........#...
..#.........#....#..#...#.....#
..#...#.....#.........##.#.....
.....#.#....##...............#.
....#...#............#.........
.....#.....###............#....
..#.#.#.......#....#...........
...........##...##...#.......#.
.........###.#......#..........
.#.......#....#.....#.##..#...#
..#..................#..###....
..#....#...#......##.........#.
........#..#........#.........#
.#..#......#.........#.........
...#..##.....#....#....#.....#.
......#.#............###.....##
.......#........#.......#.#....
..#.............#..............
.............##..#.#.#....#....
.................#....#.#......
##..#.#.......#....#.....#.....
.##............##.#.......#.#..
#..#...........##......#.......
.##......#####..##.#....#.#....
.......##.....#...#........#...
.#.#.....##....#..#....#..#...#
............##.#.....##.#......
........##...###.#......#......
......#..#.#...#..#............
.........#...........#......#..
.#.........#............##.....
.#..#..#...#.#.............#...
......#.#..##...#.#...........#
#.##.......#...#.........#.....
.....#..#............#....##...
.#......#........#.............
..#...#....#..#.......###......
....#.......###.#.#...........#
.............#...##............
.##.#.#.#...........#...#....#.
............##.........#......#
...............#......#...#....
...#.....#..###..#...........#.
.#........#.....##........#.#..
....#.#.......#..#..#...##.#.#.
.......##...........#...#......
....#.#..##......#.......#.....
..#........#.#......#.#........
........#....#..#....#..##.....
.#.........##..........#.#.....
..##...##.....##......##..#....
.###.....##...........##.#...##
...#................#.......#..
#.......#.#.#..#.#.##..#...#...
.#.#.......#..#................
..#.#.#......#............#....
#.....#.###..#.#...#...........
#...........#..........#.#.#.##
..#.#...#......##.....#........
........#.......#.#...#...#....
..#..........#......###......#.
..........##.#....#.....#.##...
..#.....#......#.........#..##.
.#...#........#..#.#..#...##..#
..###........#......#.#........
..#.##.#....#.#....#.#...#.....
"""
