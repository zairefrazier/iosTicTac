//
//  OnevOne.swift
//  tictactoe
//
//  Created by Zaire on 10/13/22.
//

import SwiftUI

let colums: [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]

struct OnevOne: View {
    @State var moves : [String] = Array(repeating: "", count: 9)
    
    @State var isPlaying = true
    
    @State var gameOver = false
    
    @State var msg = ""
   
    
    var body: some View {
        
        
        
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: colums, spacing: 15) {
                    ForEach(0..<9) { i in
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.orange)
                                .frame(width: geometry.size.width/3-15, height: geometry.size.width/3-15)
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.yellow.opacity(moves[i] == "" ? 1 : 0))
                                .frame(width: geometry.size.width/3-15, height: geometry.size.width/3-15)
                            
                            Text(moves[i])
                                .font(.system(size: 55))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .rotation3DEffect(.init(degrees: moves[i] != "" ? 180 : 0), axis: (x: 0.0, y: 1.0, z: 0.0), anchor: .center, anchorZ: 0.0, perspective: 1.0)
                        
                        .onTapGesture {
                            
                            withAnimation(Animation.easeIn(duration: 0.25)){
                                
                                
                                if moves[i] == ""{
                                    moves[i] = isPlaying ? "X" : "O"
                                    isPlaying.toggle()
                                }
                                
                            }
                            
                        }
                        
                    }
                }
                Spacer()
            }
            .background(LinearGradient(colors: [Color("Color"),.red], startPoint: .trailing, endPoint: .top))
            .onChange(of: moves, perform: { value in
                
                checkWinner()
            })
            .alert(isPresented: $gameOver, content: {
                Alert(title: Text("Winner"), message: Text(msg), dismissButton: .destructive(Text("Play Again?"),action: {
                    withAnimation(Animation.easeIn(duration: 0.5)){
                        moves.removeAll()
                        moves = Array(repeating: "", count: 9)
                        isPlaying = true
                    }
                }))
            })
            
        }
    }
    func checkWinner(){
        if checkMoves(player: "X") {
            
            msg = "Player X Won"
            gameOver.toggle()
            
                        
        }
        else if checkMoves(player: "O") {
            msg = "Player O Won"
            gameOver.toggle()
            
        } else {
            let status = moves.contains{ (value) -> Bool in
                
                return value == ""
                
            }
            if !status{
                msg = "Game Over Tied!!!"
                gameOver.toggle()
            }
        }
        
    }
    
    func checkMoves(player: String)->Bool{
        for i in stride(from: 0, to: 9, by: 3) {
            if moves[i] == player && moves[i+1] == player && moves[i+2] == player {
                return true
            }
        }
        for i in 0...2 {
            if moves[i] == player && moves[i+3] == player && moves[i+6] == player {
                return true
            }
        }
        if moves[0] == player && moves[4] == player && moves[8] == player {
            return true
        }
        
        if moves[2] == player && moves[4] == player && moves[6] == player {
            return true
        }
        return false
    }
}




struct OnevOne_Previews: PreviewProvider {
    static var previews: some View {
        OnevOne()
    }
}
