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
    
//    let player = SKSpriteNode(imageNamed: "playerShip")
//
//    let lblMessage = SKLabelNode()
//    let lblCoins = SKLabelNode()
//    let lblBetCoins = SKLabelNode()
//    let lblJackpot = SKLabelNode()
//    let lblPlayerStats = SKLabelNode()
//
//    let stepper = SKSpriteNode(imageNamed: "playerShip")
//    let block1 = SKSpriteNode(imageNamed: "playerShip")
//    let block2 = SKSpriteNode(imageNamed: "playerShip")
//    let block3 = SKSpriteNode(imageNamed: "playerShip")
//    let item1 = SKSpriteNode(imageNamed: "playerShip")
//    let item2 = SKSpriteNode(imageNamed: "playerShip")
//    let item3 = SKSpriteNode(imageNamed: "playerShip")
//    let imgCharacter = SKSpriteNode(imageNamed: "playerShip")
//    let btnSpin = SKSpriteNode(imageNamed: "playerShip")
//    let btnReset = SKSpriteNode(imageNamed: "playerShip")
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
    
    override func didMove(to view: SKView) {

        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        background.zPosition = 0
        background.size = self.size
        self.addChild(background)
        
        let logo = SKSpriteNode(imageNamed: "Logo")
        logo.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.8)
        logo.setScale(0.54)
        logo.zPosition = 1
        self.addChild(logo)
        
        let block1 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        block1.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.4)
        block1.setScale(0.15)
        block1.zPosition = 1
        self.addChild(block1)
        
        let block2 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        block2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.4)
        block2.setScale(0.15)
        block2.zPosition = 1
        self.addChild(block2)
        
        let block3 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        block3.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.4)
        block3.setScale(0.15)
        block3.zPosition = 1
        self.addChild(block3)
        
        let coin = SKSpriteNode(imageNamed: "Coin_-_New_Super_Mario_Bros")
        coin.position = CGPoint(x: self.size.width * 0.07, y: self.size.height * 0.61)
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
        self.addChild(pow)
        
        let balloon = SKSpriteNode(imageNamed: "1265px-Speech_balloon.svg")
        balloon.position = CGPoint(x: self.size.width * 0.6, y: self.size.height * 0.25)
        balloon.size = CGSize(width: 480, height: 200)
        balloon.zPosition = 1
        self.addChild(balloon)
        
        let lblPlayerStats = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        lblPlayerStats.position = CGPoint(x: self.size.width * 0.6, y: self.size.height * 0.7)
        lblPlayerStats.zPosition = 1
        lblPlayerStats.text = "W:0 L:0 WR:0.0% T:0"
        lblPlayerStats.fontSize = 35
        lblPlayerStats.fontColor = SKColor.white
        self.addChild(lblPlayerStats)
        
        let lblCoins = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        lblCoins.position = CGPoint(x: self.size.width * 0.15, y: self.size.height * 0.6)
        lblCoins.zPosition = 1
        lblCoins.text = "x01"
        lblCoins.fontSize = 35
        lblCoins.fontColor = SKColor.white
        self.addChild(lblCoins)
        
        let lblJackpot = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        lblJackpot.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.6)
        lblJackpot.zPosition = 1
        lblJackpot.text = "Jackpot: 5000"
        lblJackpot.fontSize = 35
        lblJackpot.fontColor = SKColor.white
        self.addChild(lblJackpot)
        
        let lblGoodLuck = SKLabelNode(fontNamed: "Noteworthy-Bold")
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
            }
        }
    }

    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
