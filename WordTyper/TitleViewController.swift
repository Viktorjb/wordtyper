//
//  ViewController.swift
//  WordTyper
//
//  Created by Viktor on 2023-03-29.
//

import UIKit

class TitleViewController: UIViewController {

    //Game mode to start, 0 for easy, 1 for hard
    var gameModeToStart : Int = 0
    
    
    /*@IBAction func easyGameButton(_ sender: Any) {
        gameModeToStart = 0
    }
    
    @IBAction func hardGameButton(_ sender: Any) {
        gameModeToStart = 1
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "easyGameSegue"){
            let vc = segue.destination as! GameViewController
            vc.gameMode = 0
        } else if(segue.identifier == "hardGameSegue"){
            let vc = segue.destination as! GameViewController
            vc.gameMode = 1
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
