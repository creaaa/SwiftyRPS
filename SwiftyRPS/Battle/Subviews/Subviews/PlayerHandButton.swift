//
//  PlayerHandButton.swift
//  SwiftyRPS
//
//  Created by crea on 2019/09/09.
//  Copyright © 2019 crea. All rights reserved.
//

import SwiftUI

struct PlayerHandButton: View {
    
    let handType: Hand
    
    @Binding var playerHand: Hand!
    @Binding var shouldDisableButton: Bool
        
    var body: some View {
        // Render mode をちゃんとしないと、tintcolorで塗りつぶされてしまうので、変更しておく
        // https://stackoverflow.com/questions/56820779/how-can-i-create-a-button-with-image-in-swiftui
        Button(
            action: {
                self.playerHand          = self.handType
                self.shouldDisableButton = true
            },
            label: {
                Image(handType.rawValue)
                .renderingMode(.init(Image.TemplateRenderingMode.original))
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .scaleEffect(0.3)
            }
        )
    }
    
}

struct PlayerHandButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayerHandButton(handType: .rock,
                         playerHand: .constant(nil),
                         shouldDisableButton: .constant(false))
    }
}
