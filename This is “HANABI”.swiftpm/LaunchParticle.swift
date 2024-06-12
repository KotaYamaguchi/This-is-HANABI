//
//  LaunchParticle.swift
//  Hanabi_withSpriteKit
//
//  Created by 山口昂大 on 2024/02/04.
//
//
//  ParticleClass.swift
//  Hanabi_withSpriteKit
//
//  Created by 山口昂大 on 2024/01/06.
//

import Foundation
import SpriteKit

class LaunchParticle{
    
    var x:CGFloat
    var y:CGFloat
    var vX:CGFloat
    var vY:CGFloat
    var friction:CGFloat = 0.99
    var gravity:CGFloat
    var sk:SKScene
    var alpha:CGFloat = 1
    var color:SKColor
    var emitterNode = SKEmitterNode()
    var emitterNodeName:String
    var sharedValue = SharedValueClass()
    
    init(x: CGFloat, y: CGFloat, vX: CGFloat, vY: CGFloat, gravity: CGFloat, sk: SKScene, color: SKColor,emitterNodeName:String) {
        self.x = x
        self.y = y
        self.vX = vX
        self.vY = vY
        self.gravity = gravity
        self.sk = sk
        self.color = color
        self.emitterNodeName = emitterNodeName
    }
    func Drow(){
        emitterNode = SKEmitterNode(fileNamed: emitterNodeName)!
        emitterNode.particleAlpha = alpha
        emitterNode.targetNode = sk
        emitterNode.position = CGPoint(x: x, y: y)
        
        sk.addChild(emitterNode)
    }
    
    
    
    func update(){

        vX *= friction
        vY *= friction
        vY -= gravity
        alpha -= 0.005
        x += vX
        y += vY 
        
        emitterNode.position = CGPoint(x: x, y: y)
        emitterNode.particleAlpha = alpha
        if alpha <= 0 {
            sk.removeChildren(in: [emitterNode]) // エミッタノードを削除します
        }
    }

}
