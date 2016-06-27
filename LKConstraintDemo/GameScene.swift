//
//  GameScene.swift
//  LKConstraintDemo
//
//  Created by Huy Nguyen on 6/27/16.
//  Copyright (c) 2016 Huy Nguyen. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var sprite = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = SKColor.blackColor()
        
        sprite = SKSpriteNode(imageNamed:"Spaceship")
        sprite.yScale = 0.15
        sprite.xScale = 0.15
        sprite.position = CGPointMake(100, 100)
        self.addChild(sprite)
        
        let followSprite = SKSpriteNode(imageNamed:"Spaceship")
        followSprite.xScale = 0.15
        followSprite.yScale = 0.15
        followSprite.position = CGPointMake(150, 150)
        followSprite.color = SKColor.redColor()
        followSprite.colorBlendFactor = 0.8
        self.addChild(followSprite)
        
        let rangeToSprite = SKRange(lowerLimit: 100, upperLimit: 150)
        
        let distanceConstraint = SKConstraint.distance(rangeToSprite, toNode: sprite)
        
        let rangeForOrientation = SKRange(lowerLimit: CGFloat(M_2_PI * 7), upperLimit: CGFloat(M_2_PI * 7))
        
        let orientConstraint = SKConstraint.orientToNode(sprite, offset: rangeForOrientation)
        
        followSprite.constraints = [distanceConstraint, orientConstraint]
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let action = SKAction.moveTo(location, duration: 1)
            sprite.runAction(action)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
