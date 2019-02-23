//
//  GameScene.swift
//  MidTerm
//
//  Created by Rodrigo Silva on 2019-02-21.
//  Copyright © 2019 NoobJs. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // Utility Variables
    var jackpot = 5000
    var winnings = 0
    var turn = 0
    var winNumber = 0
    var lossNumber = 0
    var winRatio = Double(0)
    var itemsOut = false
    var isToad = true
    
    // Variable for result outcomes
    var boo = 0
    var mushroom = 0
    var flower = 0
    var leaf = 0
    var cherries = 0
    var coin = 0
    var star = 0
    var bowser = 0
    var betLine = [#imageLiteral(resourceName: "slot03"), #imageLiteral(resourceName: "slot03"), #imageLiteral(resourceName: "slot03")]
    
    var lblBet = SKLabelNode()
    var bet = 10
    var lblBetValue : Int {
        set(newBet) {
            self.bet = newBet
            lblBet.text = "Bet x\(newBet)"
        }
        get {
            return self.bet
        }
    }
    
    var item1 = SKSpriteNode()
    var item2 = SKSpriteNode()
    var item3 = SKSpriteNode()
    var block1 = SKSpriteNode()
    var block2 = SKSpriteNode()
    var block3 = SKSpriteNode()
    var lblPlayerStats = SKLabelNode()
    var lblGoodLuck = SKLabelNode()
    var lblCoins = SKLabelNode()
    var lblJackpot = SKLabelNode()
    
    var currentCoins : Int{
        guard let coins = lblCoins.text, !(lblCoins.text?.isEmpty)! else {
            return 0
        }
        return Int(coins.replacingOccurrences(of: "x", with: ""))!
    }
    
    override func didMove(to view: SKView) {

        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        background.zPosition = 0
        background.size = self.size
        self.addChild(background)
        
        let logo = SKSpriteNode(imageNamed: "Logo")
        logo.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.85)
        logo.setScale(0.54)
        logo.zPosition = 1
        self.addChild(logo)
        
        block1 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        block1.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.4)
        block1.setScale(0.15)
        block1.zPosition = 5
        self.addChild(block1)
        
        item1 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        item1.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.4)
        item1.setScale(0.15)
        item1.zPosition = 3
        self.addChild(item1)
        
        block2 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        block2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.4)
        block2.setScale(0.15)
        block2.zPosition = 5
        self.addChild(block2)
        
        item2 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        item2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.4)
        item2.setScale(0.15)
        item2.zPosition = 3
        self.addChild(item2)
        
        block3 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        block3.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.4)
        block3.setScale(0.15)
        block3.zPosition = 5
        self.addChild(block3)
        
        item3 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        item3.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.4)
        item3.setScale(0.15)
        item3.zPosition = 3
        self.addChild(item3)
        
        let coin = SKSpriteNode(imageNamed: "Coin_-_New_Super_Mario_Bros")
        coin.position = CGPoint(x: self.size.width * 0.07, y: self.size.height * 0.66)
        coin.setScale(0.03)
        coin.zPosition = 1
        self.addChild(coin)
        
        let toad = SKSpriteNode(imageNamed: "toad")
        toad.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.21)
        toad.setScale(0.13)
        toad.zPosition = 1
        self.addChild(toad)
        
        let life = SKSpriteNode(imageNamed: "1up")
        life.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.065)
        life.setScale(0.05)
        life.zPosition = 1
        self.addChild(life)
        
        let pow = SKSpriteNode(imageNamed: "POW_Block_-_New_Super_Mario_Bros_Wii")
        pow.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.065)
        pow.setScale(0.06)
        pow.zPosition = 1
        pow.name = "pow"
        self.addChild(pow)
        
        let balloon = SKSpriteNode(imageNamed: "1265px-Speech_balloon.svg")
        balloon.position = CGPoint(x: self.size.width * 0.6, y: self.size.height * 0.25)
        balloon.size = CGSize(width: 480, height: 200)
        balloon.zPosition = 1
        self.addChild(balloon)
        
        lblPlayerStats = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        lblPlayerStats.position = CGPoint(x: self.size.width * 0.6, y: self.size.height * 0.75)
        lblPlayerStats.zPosition = 1
        lblPlayerStats.text = "W:0 L:0 WR:0.0% T:0"
        lblPlayerStats.fontSize = 35
        lblPlayerStats.fontColor = SKColor.white
        self.addChild(lblPlayerStats)
        
        lblCoins = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        lblCoins.position = CGPoint(x: self.size.width * 0.15, y: self.size.height * 0.65)
        lblCoins.zPosition = 1
        lblCoins.text = "x01"
        lblCoins.fontSize = 35
        lblCoins.fontColor = SKColor.white
        self.addChild(lblCoins)
        
        lblJackpot = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        lblJackpot.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.65)
        lblJackpot.zPosition = 1
        lblJackpot.text = "Jackpot: 5000"
        lblJackpot.fontSize = 35
        lblJackpot.fontColor = SKColor.white
        self.addChild(lblJackpot)
        
        lblGoodLuck = SKLabelNode(fontNamed: "Noteworthy-Bold")
        lblGoodLuck.position = CGPoint(x: self.size.width * 0.6, y: self.size.height * 0.25)
        lblGoodLuck.zPosition = 2
        lblGoodLuck.text = "GOOD LUCK!"
        lblGoodLuck.fontSize = 35
        lblGoodLuck.fontColor = SKColor.blue
        self.addChild(lblGoodLuck)
        
        lblBet = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        lblBet.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.08)
        lblBet.zPosition = 2
        lblBet.text = "Bet x10"
        lblBet.fontSize = 35
        lblBet.fontColor = SKColor.white
        self.addChild(lblBet)
        
        let lblBetPlus = SKLabelNode(fontNamed: "HelveticaNeue")
        lblBetPlus.position = CGPoint(x: self.size.width * 0.55, y: self.size.height * 0.045)
        lblBetPlus.zPosition = 2
        lblBetPlus.text = "+"
        lblBetPlus.fontSize = 70
        lblBetPlus.fontColor = SKColor.white
        lblBetPlus.name = "plus"
        self.addChild(lblBetPlus)
        
        let lblBetMinus = SKLabelNode(fontNamed: "HelveticaNeue")
        lblBetMinus.position = CGPoint(x: self.size.width * 0.45, y: self.size.height * 0.043)
        lblBetMinus.zPosition = 2
        lblBetMinus.text = "-"
        lblBetMinus.fontSize = 80
        lblBetMinus.fontColor = SKColor.white
        lblBetMinus.name = "minus"
        self.addChild(lblBetMinus)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let pointOfTouch = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            
            if tappedNode.name == "plus" {
                lblBetValue = bet + 1
            } else if tappedNode.name == "minus" {
                if bet > 1 {
                    lblBetValue = bet - 1
                }
            } else if tappedNode.name == "pow" {
                showItems(up: false)
                spinWheel()
            }
        }
    }

    
    func spinWheel() {
        
        
//        if itemsOut {
//            let showitemAnimation = SKAction.moveTo(y: self.size.height * 0.4 + block1.size.height, duration: 0.7)
//            item1.run(showitemAnimation)
//            item2.run(showitemAnimation)
//            item3.run(showitemAnimation)
//        }
        
        Reels()
        
        turn = turn + 1
        itemsOut = true
        block1.texture = SKTexture(imageNamed: "Used")
        block2.texture = SKTexture(imageNamed: "Used")
        block3.texture = SKTexture(imageNamed: "Used")

        item1.texture = SKTexture(image: betLine[0])
        item2.texture = SKTexture(image: betLine[1])
        item3.texture = SKTexture(image: betLine[2])
        
        showItems(up: true)

        Model.instance.playSound(sound: Constant.smw_vine)
        self.determineWinnings()
        self.updatePlayerStatus()
        
    }
    
    func showItems(up: Bool) {
        if up {
            let showitemAnimation = SKAction.moveTo(y: self.size.height * 0.4 + block1.size.height, duration: 0.7)
            item1.run(showitemAnimation)
            item2.run(showitemAnimation)
            item3.run(showitemAnimation)
        } else {
            item1.position.y = self.size.height * 0.4
            item2.position.y = self.size.height * 0.4
            item3.position.y = self.size.height * 0.4
        }
        
        
    }
    
    /* This function calculates the player's winnings, if any */
    func determineWinnings() {
        if (bowser == 0) {
            if (boo == 3) {
                winnings = bet * 10
            }
            else if(mushroom == 3) {
                winnings = bet * 20
            }
            else if (flower == 3) {
                winnings = bet * 30
            }
            else if (leaf == 3) {
                winnings = bet * 40
            }
            else if (cherries == 3) {
                winnings = bet * 50
            }
            else if (coin == 3) {
                winnings = bet * 75
            }
            else if (star == 3) {
                winnings = bet * 100
            }
            else if (boo == 2) {
                winnings = bet * 2
            }
            else if (mushroom == 2) {
                winnings = bet * 2
            }
            else if (flower == 2) {
                winnings = bet * 3
            }
            else if (leaf == 2) {
                winnings = bet * 4
            }
            else if (cherries == 2) {
                winnings = bet * 5
            }
            else if (coin == 2) {
                winnings = bet * 10
            }
            else if (star == 2) {
                winnings = bet * 20
            }
            else if (star == 1) {
                winnings = bet * 5
            }
            else {
                winnings = bet * 1
            }
            
            winNumber = winNumber + 1
            Model.instance.playSound(sound: Constant.smw_1up)
            showWinMessage()
            
        } else {
            lossNumber = lossNumber + 1
            Model.instance.playSound(sound: Constant.smw_spring_jump)
            showLossMessage()
        }
        
    }
    
    /* Utility function to check if a value falls within a range of bounds */
    func checkRange(value: Int, lowerBounds: Int, upperBounds: Int) -> Int {
        if (value >= lowerBounds && value <= upperBounds) {
            return value
        }
        else {
            return 0
        }
    }
    
    /* When this function is called it determines the betLine results. */
    func Reels() {
        
        var outCome = [0, 0, 0]
        
        for spin in 0...2 {
            //outCome[spin] = Math.floor((Math.random() * 65) + 1)
            outCome[spin] = Int(arc4random_uniform(UInt32(8 * 8))) + 3
            switch (outCome[spin]) {
            case checkRange(value: spin, lowerBounds: 1, upperBounds: 27):
                bowser = bowser + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 1, upperBounds: 27):
                betLine[spin] = #imageLiteral(resourceName: "slot08")
                bowser = bowser + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 28, upperBounds: 37):
                betLine[spin] = #imageLiteral(resourceName: "slot07")
                boo = boo + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 38, upperBounds: 46):
                betLine[spin] = #imageLiteral(resourceName: "slot03")
                mushroom = mushroom + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 47, upperBounds: 54):
                betLine[spin] = #imageLiteral(resourceName: "slot04")
                flower = flower + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 55, upperBounds: 59):
                betLine[spin] = #imageLiteral(resourceName: "slot02")
                leaf = leaf + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 60, upperBounds: 62):
                betLine[spin] = #imageLiteral(resourceName: "slot05")
                cherries = cherries + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 63, upperBounds: 64):
                betLine[spin] = #imageLiteral(resourceName: "slot06")
                coin = coin + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 65, upperBounds: 65):
                betLine[spin] = #imageLiteral(resourceName: "slot01")
                star = star + 1
                break
            default:
                break
            }
        }
    }
    
    func updatePlayerStatus() {
        if turn > 0 {
            winRatio = (Double(winNumber) / Double(turn))
        }
        lblPlayerStats.text = "W: \(winNumber) L: \(lossNumber) WR: \(round((winRatio * 100)))% T: \(turn)"
    }
    
    /* Utility function to show a win message and increase player money */
    func showWinMessage() {
        Model.instance.updateCoins(label: self.lblCoins, coins: (currentCoins + winnings))
        lblGoodLuck.text = "YOU WON $\(winnings)"
        resetResultOutcomes()
        checkJackPot()
    }
    
    /* Utility function to show a loss message and reduce player money */
    func showLossMessage() {
        Model.instance.updateCoins(label: self.lblCoins, coins: (currentCoins - bet))
        lblGoodLuck.text = "TRY AGAIN..."
        resetResultOutcomes()
    }
    
    /* Check to see if the player won the jackpot */
    func checkJackPot() {
        /* compare two random values */
        //var jackPotTry = Math.floor(Math.random() * 51 + 1)
        //var jackPotWin = Math.floor(Math.random() * 51 + 1)
        //        let jackPotTry = 1
        //        let jackPotWin = 1
        let jackPotTry = Int(arc4random_uniform(UInt32(51))) + 1
        let jackPotWin = Int(arc4random_uniform(UInt32(51))) + 1
        if (jackPotTry == jackPotWin) {
            Model.instance.playSound(sound: Constant.star_theme)
            let alert = UIAlertController(title: "JACKPOT!!", message: "You won the $\(jackpot) Jackpot!!", preferredStyle: .alert)
            alert.addAction( UIAlertAction(title: "OK", style: .default, handler: { (_) in
                Model.instance.updateCoins(label: self.lblCoins, coins: (self.currentCoins + self.jackpot))
                self.jackpot = 1000
                self.lblJackpot.text = "Jackpot: \(self.jackpot)"
            }))
            //self.present(alert, animated: true, completion: nil)
        }
    }
    
    // Show Game Over alert and restart the game
    func gameOver(){
        Model.instance.playSound(sound: Constant.smw_game_over)
        let alert = UIAlertController(title: "Game Over", message: "You are out of coins! \nPlay Again?", preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.startSlothMachine()
        }))
        //self.present(alert, animated: true, completion: nil)
        self.resetResultOutcomes()
        self.resetPlayerStats()
    }
    
    func startSlothMachine(){
        if Model.instance.isFirstTime(){
            Model.instance.updateCoins(label: lblCoins, coins: 1000)
        } else {
            lblCoins.text = "x\(Model.instance.getLatestCoins())"
        }
        
        //stepper.maximumValue = Double(currentCoins)
        //betCoins = Int(stepper.value)
    }
    
    /* Utility function to reset all the previous result outcomes */
    func resetResultOutcomes() {
        boo = 0
        mushroom = 0
        flower = 0
        leaf = 0
        cherries = 0
        coin = 0
        star = 0
        bowser = 0
    }
    
    /* Utility function to reset the player stats */
    func resetPlayerStats() {
        jackpot = 5000
        lblJackpot.text = "Jackpot: \(jackpot)"
        winnings = 0
        turn = 0
        winNumber = 0
        lossNumber = 0
        winRatio = 0
        updatePlayerStatus()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
