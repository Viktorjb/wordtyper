//
//  ViewController.swift
//  WordTyper
//
//  Created by Viktor on 2023-03-30.
//

import UIKit

class HighscoresViewController: UIViewController {

    @IBOutlet weak var easyScoreLabel: UILabel!
    
    @IBOutlet weak var hardScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let hiscoreEasy = UserDefaults.standard.object(forKey: "easyHighScore") as? Int
        let hiscoreHard = UserDefaults.standard.object(forKey: "hardHighScore") as? Int
        
        if let scoreEasy = hiscoreEasy {
            easyScoreLabel.text = String(scoreEasy)
        }
        
        if let scoreHard = hiscoreHard {
            hardScoreLabel.text = String(scoreHard)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
