//
//  TacViewModel.swift
//  tictactoe
//
//  Created by Zaire on 10/11/22.
//

import Foundation
import SwiftUI


final class TacViewModel: ObservableObject {
    
    let columss:  [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),]
    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var isHumanTurn = true
    @Published var isBoardDisabled = false
    @Published var alertItem: AlertItem?
    
    
    //HUMAN PLAYER MOVE
    func processPlayerMove(for position: Int) {
        if isSquaredTaken(in: moves, forIndex: position) {return}
                moves[position] = Move(player: .human, boardIndex: position)
        
        
        
        if checkWinCondition(for: .human, in: moves) {
            alertItem = AlertConext.humanWin
                return
        }
        
        if checkDraw(in: moves) {
            alertItem = AlertConext.noWin
            return
        }
        
        isBoardDisabled = true
        
        
        //COMPUTER MOVES
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            let computerPostion = computerMoves(in: moves)
            moves[computerPostion] = Move(player: .computer, boardIndex: computerPostion)
                isBoardDisabled = false
            
            if checkWinCondition(for: .computer, in: moves) {
                alertItem = AlertConext.computerWin
                    return
            }
            
            if checkDraw(in: moves) {
                print("Draw")
                return
            }
            
        }
    }
    
    
    func isSquaredTaken(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: {$0?.boardIndex == index})
    }
    
    func computerMoves(in moves: [Move?]) -> Int {
        
        
        //Allowd Ai to win if they can
        
        //Checks all possible win indexes
        //[0,1,2]
        //[3,4,5]
        //[6,7,8]
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        
        
        //removes nil from moves
        let computerMoves = moves.compactMap{$0}.filter{ $0.player == .computer}
        
        let computerPostions = Set(computerMoves.map {$0.boardIndex })
        
        for pattern in winPatterns {
            let winPostions = pattern.subtracting(computerPostions)
            
            if winPostions.count == 1 {
                let isAvailable = !isSquaredTaken(in: moves, forIndex: winPostions.first!)
                if isAvailable {return winPostions.first!}
            }
        }
        
        //lets Ai block if it cant win
        let humanMoves = moves.compactMap{$0}.filter{ $0.player == .human}
        
        let humanPostions = Set(humanMoves.map {$0.boardIndex })
        
        for pattern in winPatterns {
            let winPostions = pattern.subtracting(humanPostions)
            
            if winPostions.count == 1 {
                let isAvailable = !isSquaredTaken(in: moves, forIndex: winPostions.first!)
                if isAvailable {return winPostions.first!}
            }
        }
        
        let centerSquare = 4
        if !isSquaredTaken(in: moves, forIndex: centerSquare) {
            return centerSquare
        }
        
        
        var movePostion = Int.random(in: 0..<9)
        
        while isSquaredTaken(in: moves, forIndex: movePostion) {
            movePostion = Int.random(in: 0..<9)
            
        }
        
        return movePostion
        
        
    }
    
    
    func checkWinCondition(for player: Player, in moves: [Move?]) -> Bool {
        
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        
        let playerMoves = moves.compactMap{$0}.filter{ $0.player == player}
        
        let playerPostions = Set(playerMoves.map {$0.boardIndex })
        
        
        for pattern in winPatterns where pattern.isSubset(of: playerPostions) {
            return true
        }
        
        
        return false
        
    }
    
    func checkDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap{$0}.count == 9
    }
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
    }
    
    
}
