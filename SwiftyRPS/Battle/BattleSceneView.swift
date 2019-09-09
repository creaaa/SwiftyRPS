//
//  BattleSceneView.swift
//  SwiftyRPS
//
//  Created by crea on 2019/09/09.
//  Copyright © 2019 crea. All rights reserved.
//

import SwiftUI
import Combine

struct BattleSceneView: View {
    
    @ObservedObject private var viewModel: BattleSceneViewModel
    
    private var cancellables: [AnyCancellable] = []

    // 自動定義initではなく、わざわざ自前でinitを定義することで、privateなメンバーに対して外部から値を注入可能になる
    // (自動定義initではそれができない)
    init(viewModel: BattleSceneViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            BattleWindowView(enemyHandImage:    $viewModel.enemyHandImage,
                             battleResult:      $viewModel.battleResult,
                             didEnterDraw:      $viewModel.didEnterDraw)
            PlayerHandView(playerHand:          $viewModel.playerHand,
                           shouldDisableButton: $viewModel.shouldDisableButton)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity,
               minHeight: 0, maxHeight: .infinity,
               alignment: Alignment(horizontal: .center, vertical: .center))
        .background(LinearGradient(gradient: Gradient(colors: [.white, .black]),
                                   startPoint: .topLeading, endPoint: .bottomLeading)
        )
        .onReceive(viewModel.$battleResult) { result in
            guard let result = result else { return }
            switch result {
                case .win, .lose:
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                        self.viewModel.shouldPresentResultScene = true
                    }
                case .draw:
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                        self.viewModel.reset(didEnterDraw: true)
                    }
            }
        }
        .sheet(isPresented: $viewModel.shouldPresentResultScene,
               onDismiss: {
                self.viewModel.reset()
        }) {
            // ここのクロージャ、遷移が発動する瞬間になって初めてコールされる。
            // このビューの画面が開いたときに実行されるのではない。ふーん。マジか。
            // だから、viewModel.battleResult
            ResultSceneView(viewModel: ResultSceneViewModel(result: self.viewModel.battleResult))
        }
    }
    
}

struct BattleSceneView_Previews: PreviewProvider {
    static var previews: some View {
        BattleSceneView(viewModel: BattleSceneViewModel())
    }
}
