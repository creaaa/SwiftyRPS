//
//  TitleSceneView.swift
//  SwiftyRPS
//
//  Created by crea on 2019/09/09.
//  Copyright © 2019 crea. All rights reserved.
//

import SwiftUI

struct TitleSceneView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Swifty RPS")
                    .font(.custom("TimesNewRomanPSMT", size: 40))
                Spacer()
                Image("titleimage")
                    .resizable()
                    .aspectRatio(1.626, contentMode: .fit)
                    .scaleEffect(1.3)
                Spacer()
                NavigationLink(destination: BattleSceneView(viewModel: BattleSceneViewModel())) {
                    Text("Battle Start")
                        .font(.custom("SFCompactDisplay-Light", size: 30))
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .padding(10)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(5)
                }
            }
            .padding(80)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TitleSceneView()
    }
}
