//
//  GameObject.swift
//  MidTerm
//
//  Created by Rodrigo Silva on 2019-02-22.
//  Copyright © 2019 NoobJs. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameObject : SKSpriteNode {
    // common GameObject variables
    var width: CGFloat?
    var height: CGFloat?
    var scale: CGFloat?
    var image: SKTexture?
    
    
    // Initializers
    init(imageString: String, sceneSize: CGSize, initialScale: CGFloat, initialPositionX: CGFloat, initialPOsitionY: CGFloat, initialPOsitionZ: CGFloat) {
        // initialize the GameObject with an image
        image = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: image!, color: color, size: image!.size())
        self.setNewScale(scale: initialScale)
        self.position = CGPoint(x: sceneSize.width * initialPositionX, y: sceneSize.height * initialPOsitionY)
        self.zPosition = initialPOsitionZ
    }
    
    init(imageString: String, sceneSize: CGSize, initialScale: CGFloat, initialPositionX: CGFloat, initialPOsitionY: CGFloat, initialPOsitionZ: CGFloat, name: String) {
        image = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: image!, color: color, size: image!.size())
        self.setNewScale(scale: initialScale)
        self.position = CGPoint(x: sceneSize.width * initialPositionX, y: sceneSize.height * initialPOsitionY)
        self.zPosition = initialPOsitionZ
        self.name = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNewScale(scale:CGFloat) {
        setScale(scale)
        self.scale = scale
        self.width = image!.size().width * self.scale!
        self.height = image!.size().height * self.scale!
    }
}
