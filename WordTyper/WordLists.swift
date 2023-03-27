//
//  WordLists.swift
//  WordTyper
//
//  Created by Viktor on 2023-03-27.
//

import Foundation

//Model class containing word lists and logic surrounding it
class WordLists {
    
    //Word lists
    private let easyList = ["crab", "cheese", "rocket", "hair"]
    private let hardList = ["shortcut", "preferences", "chocolate", "desktop", "cognitive"]
    
    //gameList, to be used when a game is active
    private var gameList : [String] = []
    
    //Fill up the gamelist with the easy words
    func setUpEasyGame(){
        gameList = easyList
    }
    
    //Fill up the gamelist with the hard words
    func setUpHardGame(){
        gameList = hardList
    }
}

