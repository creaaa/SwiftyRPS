//
//  BattleSceneViewModel.swift
//  SwiftyRPS
//
//  Created by crea on 2019/09/10.
//  Copyright © 2019 crea. All rights reserved.
//

import SwiftUI
import Combine

class BattleSceneViewModel: ObservableObject {
    
    // OUT
    @Published var enemyHandImage           = Image("hatena")
    @Published var playerHand:                Hand!
    @Published var shouldDisableButton      = false
    @Published var battleResult:              BattleResult!
    @Published var didEnterDraw             = false
    @Published var shouldPresentResultScene = false

    private var cancellables: [AnyCancellable] = []
    
    init() {
        $playerHand
            .sink { [weak self] hand in
                guard let hand = hand else { return }
                self?.judge(hand: hand)
            }
            .store(in: &cancellables)
    }
    
    private func judge(hand: Hand) {
        let _enemyHand      = enemyHand
        self.enemyHandImage = mapEnemyHandToImage(enemyHand: _enemyHand)
        self.battleResult   = Judge.judge(hand: hand, enemyHand: _enemyHand)
    }
    
    private var enemyHand: Hand {
        Hand.allCases.randomElement()!
    }
    
    private func mapEnemyHandToImage(enemyHand: Hand) -> Image {
        return Image(enemyHand.rawValue)
    }
    
    // get state back to the point before playing hand
    func reset(didEnterDraw: Bool = false) {
        self.enemyHandImage       = Image("hatena")
        self.shouldDisableButton  = false
        self.battleResult         = nil
        self.didEnterDraw         = didEnterDraw
    }
    
}
