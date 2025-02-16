//
//  CardModel.swift
//  MatchApp
//
//  Created by Daulet Omar on 12.12.2024.
//


import Foundation

class CardModel {
    
    
    func getCards() -> [Card] {
        
        // Declare an array to store the numbers that are already generated
        var generatedNumbersArray = [Int]()
        
        // Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        // Randomly generate pairs of cards
        while generatedNumbersArray.count < 8 {
            
            // Get a random number
            let randomNumber = arc4random_uniform(8) + 1      //gives us randoms from 0 to 7
            
            // Ensure that the random number is unique
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
                
                // Log the number
                print(randomNumber)
               
                // Store the number in the generatedNumbersArray
                generatedNumbersArray.append(Int(randomNumber))
                
                // Create the first card object
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)-0"
                cardOne.id = Int(randomNumber)
                generatedCardsArray.append(cardOne)

                // Create the second card object
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)-1"
                cardTwo.id = Int(randomNumber)
                generatedCardsArray.append(cardTwo)
            
            }
            
        }
        // Randomize the array
        for i in 0...generatedCardsArray.count - 1 {
            
            // Find a random index
            let randomNumber = Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
            
            // Swap two cards
            let temporaryStorage = generatedCardsArray[i]
            generatedCardsArray[i] = generatedCardsArray[randomNumber]
            generatedCardsArray[randomNumber] = temporaryStorage
        
        }
        // Return the array
        return generatedCardsArray
    }
}
