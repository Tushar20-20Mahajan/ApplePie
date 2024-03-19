//
//  ViewController.swift
//  ApplePie
//
//  Created by student on 26/02/24.
//

import UIKit

var listOfWords = ["buccaneer", "swift","glorious",
"incandescent","bug", "program"]

let incorrectMovesAllowed = 7

class ViewController: UIViewController {

 
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var scoreWordLable: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    func enableLetterButtons(_ enable: Bool) {
      for button in letterButtons {
        button.isEnabled = enable
      }
    }
    

    var currentGame: Game!
    func newRound() {
        if !listOfWords.isEmpty {
                let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaning: incorrectMovesAllowed, guessedLetters: [])
                enableLetterButtons(true)
                updateUI()
            } else {
                enableLetterButtons(false)
            }
        

        
    }
    var totalWins = 0{
        didSet {
            newRound()
        }
    }

    var totalLosses = 0{
        didSet {
                newRound()
            }

    }
    
    func updateUI() {
//        correctWordLable.text = currentGame.formattedWord
        var letters = [String]()
            for letter in currentGame.formattedWord {
                letters.append(String(letter))
            }
            let wordWithSpacing = letters.joined(separator: " ")
        correctWordLable.text = wordWithSpacing
        

        
        scoreWordLable.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaning)")
        
    }
    func updateGameState() {
      if currentGame.incorrectMovesRemaning == 0 {
        totalLosses += 1
      } else if currentGame.word == currentGame.formattedWord {
        totalWins += 1
      } else {
        updateUI()
      }
    }
    
//    @IBAction func letterButtonPressed(_ sender: UIButton) {
//        
//        sender.isEnabled = false
//        let letterString = sender.title(for: .normal)!
//        
//            let letter = Character(letterString.lowercased())
//            currentGame.playerGuessed(letter: letter)
//            updateGameState()
//       
//       
//    }
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        guard let letterString = sender.title(for: .normal) else {
            return // If the title is nil, exit the function
        }
        
        
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }

}

