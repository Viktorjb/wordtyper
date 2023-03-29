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
    
    @IBAction func gamePlayEnterText(_ sender: UITextField) {
        
    }
    
    //Called whenever user changes anything in text field (i.e. on input)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //print(textField.text)
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
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.timeLeft = self.timeLeft - 1
            
            if(self.timeLeft < 0){
                //end game show results
                timer.invalidate()
                self.model.gameOver()
                self.performSegue(withIdentifier: "gameClearSegue", sender: Any?.self)
            }
            
            self.timeLabel.text = "Time left: " + String(self.timeLeft)
            
        }
        
        /*let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        
            var body: some View {
                Text("\(timeRemaining)")
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        }
                    }*/
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "gameClearSegue"){
            let vc = segue.destination as! ResultViewController
            vc.resultModel = model
        }
    }
    
}

