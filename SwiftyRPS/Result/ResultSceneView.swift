//
//  ResultSceneView.swift
//  SwiftyRPS
//
//  Created by crea on 2019/09/10.
//  Copyright © 2019 crea. All rights reserved.
//

import SwiftUI

struct ResultSceneView: View {
    
    let viewModel: ResultSceneViewModel
    
    var body: some View {
        VStack {
            Text(self.viewModel.resultText)
                .font(.custom("SFCompactDisplay-Light", size: 75))
                .foregroundColor(.black)
            Text(self.viewModel.subheadlineText)
                .font(.custom("SFCompactDisplay-Light", size: 16))
                .foregroundColor(.white)
                .offset(x: 0, y: 20)
        }
        .frame(minWidth: 0, maxWidth: .infinity,
               minHeight: 0, maxHeight: .infinity,
               alignment: Alignment(horizontal: .center, vertical: .center))
        .background(LinearGradient(gradient: Gradient(colors: [.white, .black]),
                                   startPoint: .topLeading, endPoint: .bottomLeading)
        )
    }
}

struct ResultSceneView_Previews: PreviewProvider {
    static var previews: some View {
        ResultSceneView(viewModel: ResultSceneViewModel(result: .win))
    }
}
