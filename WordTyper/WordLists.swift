//
//  WordLists.swift
//  WordTyper
//
//  Created by Viktor on 2023-03-27.
//

import Foundation

//Model class containing word lists and logic surrounding it
class WordLists {
    
    //keys for saving highscores
    let userDefaultsEasyKey = "easyHighScore"
    let userDefualtsHardKey = "hardHighScore"
    
    
    //Word lists
    private let easyList = ["crab", "cheese", "rocket", "hair", "cat", "dog", "soup",
    "rod", "bleak", "cough", "drink", "food", "style", "pick", "drool", "tough", "large",
    "small", "broad", "toy", "hammer", "wall", "soft", "wares", "fast", "cruel", "hippo",
    "land", "story", "legend", "rice", "screen", "phone", "false", "right", "happy",
    "ear", "sea", "depth", "water", "vision", "hall", "street", "roof", "human",
    "glare", "lid", "pan", "sword", "cow", "farm", "grass", "root", "know", "speed",
    "fork", "radio", "valley", "bath", "glove", "steel", "iron", "money", "oil", "pasta",
    "meter", "guest", "forget", "gone", "away", "acid", "fire", "battle", "thick", "thin"]
    private let hardList = ["shortcut", "preferences", "chocolate", "desktop", "cognitive",
    "gargantuan", "explosion", "everlasting", "wallpaper", "mountain", "samurai",
    "stigma", "draconic", "propeller", "climbing", "tangible", "uncontrollable",
    "truthful", "mouthful", "glorified", "ketchup", "daybreak", "storyboard",
    "breakage", "structural", "falsehood", "exciting", "virtual", "otherworldly",
    "illusion", "expansion", "dignified", "keyboard", "smartphone", "external",
    "marvelous", "magnified", "downwards", "container", "gnarled", "mirrored"]
    
    //previously played game mode (o for easy 1 for hard)
    private var lastGameMode : Int = 0
    
    //gameList, to be used when a game is active
    private var gameList : [String] = []
    
    //currently typed string
    private var currentString : String = ""
    
    //for counting points as the game is running
    private var points : Int = 0
    
    //Returns points
    func getPoints() -> Int{
        return points
    }
    
    //Change the amount of points
    func addPoints(pointsToAdd: Int){
        points = points + pointsToAdd
    }
    
    //Fill up the gamelist with the easy words, and reset points
    func setUpEasyGame(){
        points = 0
        gameList = easyList.shuffled()
        lastGameMode = 0
    }
    
    //Fill up the gamelist with the hard words, and reset points
    func setUpHardGame(){
        points = 0
        gameList = hardList.shuffled()
        lastGameMode = 1
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
    
    //check if the currently typed string has been mistyped
    func checkTypo() -> Bool{
        if (gameList.isEmpty){
            return false
        } else if(gameList.first?.prefix(currentString.count) ?? "" != currentString){
            return true
        } else{
            return false
        }
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
        
        currentString = ""
        saveHighscore(score: points)
    }
    
    func saveHighscore(score : Int){
        let defaults = UserDefaults.standard
        
        var previousScore = 0
        
        if(lastGameMode == 0){
            let savedScore = UserDefaults.standard.object(forKey: userDefaultsEasyKey) as? Int
            if let fetchedScore = savedScore {
                previousScore = fetchedScore
            }
        } else{
            let savedScore = UserDefaults.standard.object(forKey: userDefualtsHardKey) as? Int
            if let fetchedScore = savedScore {
                previousScore = fetchedScore
            }
        }
        
        
        if(lastGameMode == 0 && score > previousScore){
            defaults.set(score, forKey: userDefaultsEasyKey)
            defaults.synchronize()
        } else if(lastGameMode == 1 && score > previousScore){
            defaults.set(score, forKey: userDefualtsHardKey)
            defaults.synchronize()
        }
        
    }
}

