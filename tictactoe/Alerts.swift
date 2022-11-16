//
//  Alerts.swift
//  tictactoe
//
//  Created by Zaire on 10/4/22.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertConext {
    
    static let humanWin = AlertItem(title: Text("You Win"), message: Text("Congrats on Beating the Ai"), buttonTitle: Text("Play Again?"))
    static let computerWin = AlertItem(title: Text("You Lost"), message: Text("Ai Is Too Smart For You"), buttonTitle: Text("Play Again?"))
    static let noWin = AlertItem(title: Text("Draw"), message: Text("Even Steven"), buttonTitle: Text("Rematch?"))
    
}
