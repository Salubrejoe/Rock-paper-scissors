//
//  GameState.swift
//  Rock, paper, scissors
//
//  Created by Lore P on 25/05/2022.
//

import Foundation

enum GameState {
    case start, win, draw, lose
    
    var status: String {
        switch self {
        case .start:
            return "Choose one!"
        case .win:
            return "Congratulation you got lucky!"
        case .draw:
            return "Draw"
        case .lose:
            return "You lose!"
        }
    }

}
