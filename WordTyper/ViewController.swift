//
//  ViewController.swift
//  WordTyper
//
//  Created by Viktor on 2023-03-27.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var gamePlayWordLabel: UILabel!
    
    
    @IBAction func gamePlayEnterText(_ sender: UITextField) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let model = WordLists()
        model.setUpHardGame()
        gamePlayWordLabel.text = model.getTopWord()
        
    }
    
}

