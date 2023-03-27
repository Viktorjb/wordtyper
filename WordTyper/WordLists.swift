//
//  WordLists.swift
//  WordTyper
//
//  Created by Viktor on 2023-03-27.
//

import Foundation

class WordLists {
    
    private let easyList = ["crab", "cheese", "rocket", "hair"]
    private let hardList = ["shortcut", "preferences", "chocolate", "desktop", "cognitive"]
    
    private var gameList : [String] = []
    
    func setUpEasyGame(){
        gameList = easyList
    }
    
    func setUpHardGame(){
        gameList = hardList
    }
}

