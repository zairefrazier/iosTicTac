//
//  AiTacView.swift
//  tictactoe
//
//  Created by Zaire on 10/3/22.
//

import SwiftUI

struct AiTacView: View {
    
    @StateObject private var viewModel = TacViewModel()

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: viewModel.columss, spacing: 15) {
                    ForEach(0..<9) { i in
                        ZStack {
                            GameSquareView(proxy: geometry)
                            PlayerId(systemImageName: viewModel.moves[i]?.indicator ?? "")
                        }
                        .onTapGesture {withAnimation(Animation.easeIn(duration: 0.25)){
                            viewModel.processPlayerMove(for: i)
                        }
                    }
                    }
                }
                Spacer()
            }
            .disabled(viewModel.isBoardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem, content: {alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {
                    viewModel.resetGame()
                }))
            })
        }
    }
}

enum Player {
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
        
    }
}
struct AiTacView_Previews: PreviewProvider {
    static var previews: some View {
        AiTacView()
    }
}

struct GameSquareView: View {
    
    var proxy: GeometryProxy
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.green).opacity(0.6)
            .frame(width: proxy.size.width/3-15, height: proxy.size.width/3-15)
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.green).opacity(0.6)
            .frame(width: proxy.size.width/3-15, height: proxy.size.width/3-15)
    }
}

struct PlayerId: View {
    
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 45, height: 45)
            .foregroundColor(.white)
    }
}
