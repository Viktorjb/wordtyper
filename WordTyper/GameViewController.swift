//
//  ViewController.swift
//  WordTyper
//
//  Created by Viktor on 2023-03-27.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {

    let model = WordLists()
    var gameMode = Int()
    var timeLeft : Int = 30
    
    @IBOutlet weak var gamePlayWordLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var gamePlayTextField: UITextField!
    
    @IBAction func gamePlayEnterText(_ sender: UITextField) {
        
    }
    
    //Called whenever user changes anything in text field (i.e. on input)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        let fullString = model.typeCharacter(s: string)
        if(fullString == model.getTopWord()){ //If the word has been fully correctly typed
            model.removeTopWord()
            model.clearCurrentString()
            gamePlayWordLabel.text = model.getTopWord()
            textField.text = ""
            model.addPoints(pointsToAdd: 25)
            pointsLabel.text = "Points: " + String(model.getPoints())
            return false
        }
        if(model.checkTypo()){ //If the wrong key has been pressed
            print("MISTAAAAAKE")
            model.clearCurrentString()
            textField.text = ""
            model.addPoints(pointsToAdd: -12)
            pointsLabel.text = "Points: " + String(model.getPoints())
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if(gameMode == 0){
            model.setUpEasyGame()
        } else{
            model.setUpHardGame()
        }
        gamePlayWordLabel.text = model.getTopWord()
        pointsLabel.text = "Points: " + String(model.getPoints())
        
        timeLabel.text = "Time left: " + String(timeLeft)
        
        //set up timer
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            //subtract 1 from timeLeft every second
            self.timeLeft = self.timeLeft - 1
            
            //if no time left
            if(self.timeLeft < 0){
                //end game show results
                timer.invalidate() //stop timer
                self.model.gameOver()
                self.performSegue(withIdentifier: "gameClearSegue", sender: Any?.self)
            }
            
            self.timeLabel.text = "Time left: " + String(self.timeLeft)
            
        }
        //focus on the textfield automatically
        gamePlayTextField.becomeFirstResponder()
        
        
    }
    
    //sends the model with the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "gameClearSegue"){
            let vc = segue.destination as! ResultViewController
            vc.resultModel = model
        }
    }
    
}

