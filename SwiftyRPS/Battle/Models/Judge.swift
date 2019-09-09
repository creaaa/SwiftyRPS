//
//  Judge.swift
//  SwiftyRPS
//
//  Created by crea on 2019/09/10.
//  Copyright © 2019 crea. All rights reserved.
//

struct Judge {
    static func judge(hand: Hand, enemyHand: Hand) -> BattleResult {
        switch (hand, enemyHand) {
        case (.rock,     .rock):     return .draw
        case (.rock,     .scissors): return .win
        case (.rock,     .paper):    return .lose
        case (.scissors, .rock):     return .lose
        case (.scissors, .scissors): return .draw
        case (.scissors, .paper):    return .win
        case (.paper,    .rock):     return .win
        case (.paper,    .scissors): return .lose
        case (.paper,    .paper):    return .draw
        }
    }
}
