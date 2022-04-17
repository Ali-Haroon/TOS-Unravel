//
//  ScoreView.swift
//  TosUnravel
//
//  Created by Ali Haroon on 4/13/22.
//

import SwiftUI

struct ScoreView: View {
    var score: Int
    var body: some View {
        Text("score = \(score)/100")
            .foregroundColor(getColor(score: score))
    }
    func getColor(score:Int) -> Color{
        if score >= 0 && score < 51 {
            return .red
        }else if score > 51 && score < 66{
            return .yellow
        }else if score > 66 && score < 76{
            return .orange
        }else{
            return .green
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 92)
    }
}
