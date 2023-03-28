//
//  ViewController.swift
//  WordTyper
//
//  Created by Viktor on 2023-03-27.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let model = WordLists()
    
    @IBOutlet weak var gamePlayWordLabel: UILabel!
    
    
    @IBAction func gamePlayEnterText(_ sender: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text)
        print(string)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.setUpHardGame()
        gamePlayWordLabel.text = model.getTopWord()
        
    }
    
}

