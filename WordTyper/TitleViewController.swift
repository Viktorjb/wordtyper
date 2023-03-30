//
//  ViewController.swift
//  WordTyper
//
//  Created by Viktor on 2023-03-29.
//

import UIKit

class TitleViewController: UIViewController {

    
    
    
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
