//
//  PlayerHandView.swift
//  SwiftyRPS
//
//  Created by crea on 2019/09/09.
//  Copyright © 2019 crea. All rights reserved.
//

import SwiftUI

struct PlayerHandView: View {
        
    @Binding var playerHand: Hand!
    @Binding var shouldDisableButton: Bool
    
    var body: some View {
        HStack {
            PlayerHandButton(handType:            .rock,
                             playerHand:          $playerHand,
                             shouldDisableButton: $shouldDisableButton)
            PlayerHandButton(handType:            .scissors,
                             playerHand:          $playerHand,
                             shouldDisableButton: $shouldDisableButton)
            PlayerHandButton(handType:            .paper,
                             playerHand:          $playerHand,
                             shouldDisableButton: $shouldDisableButton)
        }
        .disabled(shouldDisableButton)
    }
        
}

struct PlayerHandView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerHandView(playerHand:          .constant(nil),
                       shouldDisableButton: .constant(false)
        )
    }
}
