//
//  ContentView.swift
//  tictactoe
//
//  Created by Zaire on 10/3/22.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color("Color"),.red], startPoint: .trailing, endPoint: .top)
                    .ignoresSafeArea()
                Circle()
                    .fill(.brown)
                    .blur(radius: 90)
                    .offset(x: 200, y: 150)
                                
                VStack{
                    Home()
                        .navigationTitle("Tic Tac Toe")
                        .offset(y: -100)
                    
                    HStack{
                        NavigationLink(destination: OnevOne(), label: {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(height:70)
                                    .opacity(0.2)
                                    .foregroundColor(.white)
                                Text("One vs One")
                                    .font(.title)
                                    .bold()
                                .foregroundColor(.white)
                            }
                        })
                        Spacer()
                        NavigationLink(destination: AiTacView() , label: {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(height:70)
                                    .opacity(0.2)
                                    .foregroundColor(.white)
                                Text("One vs CPU")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                            }

                        })
                    }
                    .padding(.horizontal)
                }
            }
        }
        .preferredColorScheme(.dark)
        
    }
    
}

struct Home: View {
    var body: some View {
    
        VStack(spacing: 20){
            Text("Game of X's and O's!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            .multilineTextAlignment(.center)
        }
        .padding(.horizontal)
        
        VStack(spacing: 20){
            Text("Play Tic Tac Toe!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            .multilineTextAlignment(.center)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
