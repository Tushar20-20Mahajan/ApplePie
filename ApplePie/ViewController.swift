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
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        
        sender.isEnabled = false
    }
    
}

