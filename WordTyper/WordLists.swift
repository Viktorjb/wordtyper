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
    
    //currently typed string
    private var currentString : String = ""
    
    //for counting points as the game is running
    private var points : Int = 0
    
    //Fill up the gamelist with the easy words, and reset points
    func setUpEasyGame(){
        points = 0
        gameList = easyList.shuffled()
    }
    
    //Fill up the gamelist with the hard words, and reset points
    func setUpHardGame(){
        points = 0
        gameList = hardList.shuffled()
    }
    
    //Add a character (or substring) to the current string, get the full string back
    func typeCharacter(s: String) -> String{
        currentString = currentString + s
        return currentString
    }
    
    //clear the current string
    func clearCurrentString(){
        currentString = ""
    }
    
    //return the top word (if there is one)
    func getTopWord() -> String?{
        if (gameList.isEmpty){
            return nil
        } else{
            return gameList.first
        }
    }
    
    //remove the top word (if there is one)
    func removeTopWord(){
        if (gameList.isEmpty){
            return
        } else{
            gameList.removeFirst()
        }
    }
    
    //is the gamelist empty?
    func isGameListEmpty() -> Bool{
        return gameList.isEmpty
    }
    
    func gameOver(){
        //run when either timer runs out or gameList gets empty
        //if points is higher than the record in userdefaults, set as new record
        //return stuff to let the view know to go to results page (and populate it?)
    }
}

