//
//  BattleWindowView.swift
//  SwiftyRPS
//
//  Created by crea on 2019/09/09.
//  Copyright © 2019 crea. All rights reserved.
//

import SwiftUI

struct BattleWindowView: View {
    
    @Binding var enemyHandImage: Image
    @Binding var battleResult:   BattleResult?
    @Binding var didEnterDraw:   Bool

    var body: some View {
        VStack(spacing: 8) {
            Text(text)
            enemyHandImage
                .resizable()
                .frame(width: 200.0, height: 200.0)
                .aspectRatio(contentMode: .fit)
        }
    }
    
    private var text: String {
        if didEnterDraw {
            return battleResult == nil ? "あいこで、、" : "しょ!"
        } else {
            return battleResult == nil ? "じゃん、けん、、" : "ぽん!"
        }
    }

}

struct BattleWindowView_Previews: PreviewProvider {
    // https://stackoverflow.com/questions/56685964/swiftui-binding-initialize
    static var previews: some View {
        BattleWindowView(enemyHandImage: .constant(Image("rock")),
                         battleResult:   .constant(nil),
                         didEnterDraw:   .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
