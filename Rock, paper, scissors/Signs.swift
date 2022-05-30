//
//  Signs.swift
//  Rock, paper, scissors
//
//  Created by Lore P on 25/05/2022.
//

import Foundation

enum Sign {
    case rock, paper, scissors
    
    func emoji() -> String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    func gameState(_ opponentsign: Sign) -> GameState {
        if self == opponentsign {
            return .draw
        }
        
        switch self {
        case .rock:
            if opponentsign == .scissors {
                return .win
            }
        case .paper:
            if opponentsign == .rock {
                return .win
            }
        case .scissors:
            if opponentsign == .paper {
                return .win
            }
        }
        
        
        return .lose
    }
    
}

func randomSign() -> Sign {
    let sign = Int.random(in: 0 ... 2)
    
    if sign == 0 { return .rock }
    else if sign == 1 { return .paper}
    else { return . scissors }
    
}
