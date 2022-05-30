//
//  ViewController.swift
//  Rock, paper, scissors
//
//  Created by Lore P on 25/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(for: .start)
    }
    
    @IBAction func rockChoice(_ sender: Any) {
        play(with: .rock)
    }
    @IBAction func paperChoice(_ sender: Any) {
        play(with: .paper)
    }
    @IBAction func scissorsChoice(_ sender: Any) {
        play(with: .scissors)
    }
    
    @IBAction func playAgainAction(_ sender: Any) {
        updateUI(for: .start)
    }
    
    
    func updateUI(for state: GameState) {
        statusLabel.text = state.status
        
        switch state {
        case .win:
            view.backgroundColor = UIColor(red: 0.65, green: 0.79, blue: 0.65, alpha: 1)
        case .draw:
            view.backgroundColor = UIColor(red: 0.66, green: 0.66, blue: 0.66, alpha: 1)
        case .lose:
            view.backgroundColor = UIColor(red: 0.85, green: 0.42, blue: 0.41, alpha: 1)
        case .start:
            view.backgroundColor = .darkGray
            computerLabel.text = "🤖"
            
            playAgainButton.isHidden = true
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            
        }
        
    }
    
    func play(with userSign: Sign) {
        let computerSign = randomSign()
        
        computerLabel.text = computerSign.emoji()
        
//        if userSign == computerSign { updateUI(for: .draw)}
//
//        switch userSign {
//        case .rock:
//            scissorsButton.isHidden = true
//            paperButton.isHidden = true
//            if computerSign == .scissors {
//                updateUI(for: .win)
//            }
//        case .paper:
//            rockButton.isHidden = true
//            scissorsButton.isHidden = true
//            if computerSign == .rock {
//                updateUI(for: .win)
//            }
//        case .scissors:
//            rockButton.isHidden = true
//            paperButton.isHidden = true
//            if computerSign == .paper {
//                updateUI(for: .win)
//            }
//        }
        
        let gameState = userSign.gameState(_ : computerSign)
        updateUI(for: gameState)
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        playAgainButton.isHidden = false
        
        switch userSign {
        case .rock:
            scissorsButton.isHidden = true
            paperButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
        }
        
        
    }
    
}

