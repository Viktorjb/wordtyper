//
//  ResultViewController.swift
//  WordTyper
//
//  Created by Viktor on 2023-03-29.
//

import UIKit

class ResultViewController: UIViewController {

    var resultModel = WordLists()
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "You scored: " + String(resultModel.getPoints())
        
        // Do any additional setup after loading the view.
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
