//
//  ContentView.swift
//  tictactoe
//
//  Created by Zaire on 10/3/22.
//

import SwiftUI

let colums: [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]

struct ContentView: View {
    
    @State var moves : [String] = Array(repeating: "", count: 9)
    
    @State var isPlaying = false
    
    var body: some View {
//        GeometryReader { geometry in
//            VStack {
//                Spacer()
//                LazyVGrid(columns: colums, spacing: 15) {
//                    ForEach(0..<9) { i in
//                        ZStack {
//
//                            RoundedRectangle(cornerRadius: 20)
//                                .stroke(.red).opacity(1.0)
//
//
//                            RoundedRectangle(cornerRadius: 20)
//                                .foregroundColor(.blue.opacity(moves[i] == "" ? 1 : 0))
//
//                                .frame(width: geometry.size.width/3-15, height: geometry.size.width/3-15)
//                            Text(moves[i])
//                                .font(.system(size: 55))
//                                .foregroundColor(.black)
//                                .fontWeight(.bold)
//
//                        }
//
//                        .rotation3DEffect(.init(degrees: moves[i] != "" ? 180 : 0), axis: (x: 0.0, y: 1.0, z: 0.0), anchor: .center, anchorZ: 0.0, perspective: 1.0)
//
//                        .onTapGesture {
//
//                            withAnimation(Animation.easeIn(duration: 0.75)){
//
//
//                                if moves[i] == ""{
//                                    moves[i] = isPlaying ? "X" : "O"
//                                    isPlaying.toggle()
//                                }
//
//                            }
//
//                        }
//
//                    }
//                }
//                Spacer()
//            }
//
//        }
        AiTacView()
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
