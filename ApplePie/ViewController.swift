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
var totalWins = 0
var totalLosses = 0
class ViewController: UIViewController {

 
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var scoreWordLable: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }

    var currentGame: Game!
    func newRound() {
      let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaning: incorrectMovesAllowed , guessedLetters: [])
        updateUI()
    }
    
    func updateUI() {
        scoreWordLable.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaning)")
        
    }
   
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
        
       
    }
    
}

