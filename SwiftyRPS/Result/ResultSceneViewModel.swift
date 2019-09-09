//
//  ResultSceneViewModel.swift
//  SwiftyRPS
//
//  Created by crea on 2019/09/12.
//  Copyright © 2019 crea. All rights reserved.
//


struct ResultSceneViewModel {
    
    private let result: BattleResult
    
    // 自動定義initではなく、わざわざ自前でinitを定義することで、privateなメンバーに対して外部から値を注入可能になる
    // (自動定義initではそれができない)
    init(result: BattleResult) {
        self.result = result
    }
    
    var resultText: String {
        switch self.result {
             case .win:  return "WIN!!"
             case .lose: return "LOSE..."
             case .draw: return "DRAW"
        }
    }
    
    var subheadlineText: String {
        switch self.result {
             case .win:  return "鮮やかな勝利だ!"
             case .lose: return "つぎは勝てるね"
             case .draw: return "続けて続けて..."
        }
    }
    
}
