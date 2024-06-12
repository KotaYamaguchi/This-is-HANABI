
import SpriteKit
import SwiftUI

class GameScene:SKScene{
    var sharedValues: SharedValueClass
    init(sharedValues: SharedValueClass) {
        self.sharedValues = sharedValues
        super.init(size: CGSize(width: 2000, height: 3000))
        // Call designated initializer of SKScene
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var particles:[Particle] = []
    var launchparticles:[LaunchParticle] = []
    var rndNumber = 0
    var fireworksTimer: Timer?
    
    
    
    override func sceneDidLoad() {
        
        let colorSequence:[SKColor] = [
            SKColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1),
            SKColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1),
            SKColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        ]
        
        let rndX = Double.random(in: self.sharedValues.sceneSizeWidth*0.1...self.sharedValues.sceneSizeWidth*0.8)
        let rndY = Double.random(in: self.sharedValues.sceneSizeHeight*0.5...self.sharedValues.sceneSizeHeight*0.8)
        let rndLocation = CGPoint(x: rndX, y: rndY)
        let color:SKColor = self.sharedValues.colArray["\(self.sharedValues.colString)"]!
        let rndColor = SKColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        let power:CGFloat = self.sharedValues.size
        let launchSize = self.sharedValues.launchSize
        let particleCount = self.sharedValues.particleCount
        
        self.rndNumber = Int.random(in: 0...100)
        
        self.LaunchFireWorks(power: launchSize, location: CGPoint(x: rndX, y: rndY - 3000), color:  self.sharedValues.rndColorFlag ? rndColor : color)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            self.FireworksHiyuusei(power: power, location: rndLocation, color: self.sharedValues.rndColorFlag ? rndColor : color, particleCount: particleCount, colorSequence: colorSequence)
        }
    }
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor.darkText
        fireworksTimer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in
            
            let colorSequence:[SKColor] = [
                SKColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1),
                SKColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1),
                SKColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
            ]
            
            let rndX = Double.random(in: self.sharedValues.sceneSizeWidth*0.1...self.sharedValues.sceneSizeWidth*0.8)
            let rndY = Double.random(in: self.sharedValues.sceneSizeHeight*0.5...self.sharedValues.sceneSizeHeight*0.8)
            let rndLocation = CGPoint(x: rndX, y: rndY)
            let color:SKColor = self.sharedValues.colArray["\(self.sharedValues.colString)"]!
            let rndColor = SKColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
            let power:CGFloat = self.sharedValues.size
            let launchSize = self.sharedValues.launchSize
            let particleCount = self.sharedValues.particleCount
            
            self.rndNumber = Int.random(in: 0...100)
            
            self.LaunchFireWorks(power: launchSize, location: CGPoint(x: rndX, y: rndY - 3000), color:  self.sharedValues.rndColorFlag ? rndColor : color)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                
                switch self.rndNumber {
                case (0...20) :self.FireworksCircle(power: power, location:rndLocation, color:self.sharedValues.rndColorFlag ? rndColor : color, particleCount: particleCount, colorSequence: colorSequence)
                case (20...40) : self.FireworksHerat(power: power, location: rndLocation, color: self.sharedValues.rndColorFlag ? rndColor : color, particleCount: particleCount, colorSequence: colorSequence)
                case (20...60) : self.FireworksBotan(power: power, location: rndLocation, color:self.sharedValues.rndColorFlag ? rndColor : self.sharedValues.rndColorFlag ? rndColor : color, particleCount: particleCount, colorSequence: colorSequence)
                case (60...80) :self.FireworksHiyuusei(power: power, location: rndLocation, color: self.sharedValues.rndColorFlag ? rndColor : color, particleCount: particleCount, colorSequence: colorSequence)
                case (80...100) :self.FireworksSenrin(power: power, location: rndLocation, color: self.sharedValues.rndColorFlag ? rndColor : color, particleCount: particleCount, colorSequence: colorSequence)
                case (100...120) :self.Fireworksplanet(power: power, location:rndLocation, color:self.sharedValues.rndColorFlag ? rndColor : color, particleCount: particleCount, colorSequence: colorSequence)
                default:
                    print("No Selected")
                }
            }
        }
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        
        let colorSequence:[SKColor] = [
            SKColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1),
            SKColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1),
            SKColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        ]
        let color:SKColor = sharedValues.colArray["\(sharedValues.colString)"]!
        let rndColor = SKColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        let power:CGFloat = sharedValues.size
        let launchSize = sharedValues.launchSize
        let particleCount = sharedValues.particleCount
        
        rndNumber = Int.random(in: 0...120)
        
        LaunchFireWorks(power: launchSize, location: CGPoint(x: location.x, y: location.y - 3000), color:  self.sharedValues.rndColorFlag ? rndColor : color)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            switch self.rndNumber {
            case (0...20) :self.FireworksCircle(power: power, location:location, color:self.sharedValues.rndColorFlag ? rndColor : color, particleCount: particleCount, colorSequence: colorSequence)
            case (20...40) : self.FireworksHerat(power: power, location: location, color: self.sharedValues.rndColorFlag ? rndColor : color, particleCount: particleCount, colorSequence: colorSequence)
            case (20...60) : self.FireworksBotan(power: power, location: location, color:self.sharedValues.rndColorFlag ? rndColor : self.sharedValues.rndColorFlag ? rndColor : color, particleCount: particleCount, colorSequence: colorSequence)
            case (60...80) :self.FireworksHiyuusei(power: power, location: location, color: self.sharedValues.rndColorFlag ? rndColor : color, particleCount: particleCount, colorSequence: colorSequence)
            case (80...100) :self.FireworksSenrin(power: power, location: location, color: self.sharedValues.rndColorFlag ? rndColor : color, particleCount: particleCount, colorSequence: colorSequence)
            case (100...120) :self.Fireworksplanet(power: power, location:location, color:self.sharedValues.rndColorFlag ? rndColor : color, particleCount: particleCount, colorSequence: colorSequence)
            default:
                print("No Selected")
            }
            
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        particles.enumerated().forEach { (index, particle) in
            if particle.alpha <= 0 {
                // Store the position before removing:
                particle.emitterNode.removeFromParent()
                
            } else{
                particle.update()
            }
        }
        launchparticles.enumerated().forEach { (index, particle) in
            if particle.alpha <= 0 {
                // Store the position before removing:
                particle.emitterNode.removeFromParent()
            }else{
                particle.update()
            }
        }
    }
    
    func FireworksCircle(power:CGFloat,location:CGPoint,color:SKColor,particleCount:Double,colorSequence:[SKColor]){
        var changeSize: CGFloat = 0.2
        
        let power:CGFloat = power * 1.5
        
        for _ in (0..<5){
            
            for a in stride(from:0 , to: CGFloat.pi*2,by: CGFloat.pi*2/particleCount){
                let vx = sin(a)*power*changeSize
                let vy = cos(a)*power*changeSize
                let p = Particle(x: location.x, y: location.y, vX: vx, vY: vy, gravity: 0.03, sk: self,color: color, emitterNodeName:"Particle")
                let colorSequence = SKKeyframeSequence(keyframeValues: colorSequence,
                                                       times: [0, 0.15,0.2])
                colorSequence.interpolationMode = .linear
                
                
                p.Drow()
                
                if sharedValues.rndColorFlag == true{
                    p.emitterNode.particleColorSequence = colorSequence
                }else{
                    p.emitterNode.particleColorSequence = nil
                    p.emitterNode.particleColor = color
                }
                
                
                
                p.emitterNode.particleLifetime = 1
                particles.append(p)
                
            }
            changeSize += 0.2
            
        }
        
    }
    func Fireworksplanet(power:CGFloat,location:CGPoint,color:SKColor,particleCount:Double,colorSequence:[SKColor]){
        
        
        
        let power:CGFloat = power
        let rnd = Int.random(in: 0...1)
        let doubleParticleCount = particleCount * 2
        subCircle2(power: power, location: location, color: color, particleCount: particleCount, colorSequence: colorSequence)
        for a in stride(from:0 , to: CGFloat.pi*2,by: CGFloat.pi*2/doubleParticleCount){
            var vx = 0.0
            
            if rnd == 0 {
                vx = sin(a)*power + cos(a)*power
            }else{
                vx = sin(a)*power - cos(a)*power
            }
            
            let vy = cos(a)*power
            let p = Particle(x: location.x, y: location.y, vX: vx, vY: vy, gravity: 0.03, sk: self,color: color, emitterNodeName:"Particle")
            let colorSequence = SKKeyframeSequence(keyframeValues: colorSequence,
                                                   times: [0, 0.15,0.2])
            colorSequence.interpolationMode = .spline
            
            
            p.Drow()
            
            if sharedValues.rndColorFlag == true{
                p.emitterNode.particleColorSequence = colorSequence
            }else{
                p.emitterNode.particleColorSequence = nil
                p.emitterNode.particleColor = color
            }
            
            
            
            p.emitterNode.particleLifetime = 1
            particles.append(p)
            
        }
        
        
    }
    
    func FireworksHerat(power:CGFloat,location:CGPoint,color:SKColor,particleCount:Double,colorSequence:[SKColor]){
        let power:CGFloat = power * 0.005
        for a in stride(from:0, to: CGFloat.pi*2,by: CGFloat.pi*2/particleCount){
            let vx = 15*16*pow(sin(a), 3) * power
            let vy = 15*(13*cos(a) - 5*cos(2*a) - 2*cos(3*a) - cos(4*a))*power
            let p = Particle(x: location.x, y: location.y, vX: vx, vY: vy, gravity: 0.1, sk: self, color: color, emitterNodeName: "Particle")
            let colorSequence = SKKeyframeSequence(keyframeValues: colorSequence,
                                                   times: [0, 0.15,0.2])
            colorSequence.interpolationMode = .linear
            
            
            p.Drow()
            
            if sharedValues.rndColorFlag == true{
                p.emitterNode.particleColorSequence = colorSequence
            }else{
                p.emitterNode.particleColorSequence = nil
                p.emitterNode.particleColor = color
            }
            
            
            particles.append(p)
        }
        
    }
    
    func LaunchFireWorks(power:CGFloat,location:CGPoint,color:SKColor){
        let power:CGFloat = power
        let vx:CGFloat = 0
        let vy:CGFloat = power * 6
        let p = LaunchParticle(x: location.x, y: location.y, vX: vx, vY: vy, gravity: 0.1, sk: self, color: color, emitterNodeName:"Particle")
        
        p.Drow()
        
        p.emitterNode.particleColorSequence = nil
        p.emitterNode.particleColor = color
        
        p.emitterNode.particleLifetime = 1
        launchparticles.append(p)
    }
    
    func FireworksBotan(power:CGFloat,location:CGPoint,color:SKColor,particleCount:Double,colorSequence:[SKColor]){
        let power:CGFloat = power
        var change: CGFloat = 0
        var count = 0
        for _ in (0..<5){
            for a in stride(from:0 , to: CGFloat.pi*2,by: CGFloat.pi*2/particleCount){
                let vx = sin(a)*power*change
                let vy = cos(a)*power*change
                let p = Particle(x: location.x + vx, y: location.y + vy, vX: vx*1.1, vY: vy*1.1, gravity: 0.03, sk: self,color: color, emitterNodeName:"BotanParticle")
                
                p.Drow()
                p.alpha = 0.7
                p.emitterNode.particleColorSequence = nil
                p.emitterNode.particleColor = color
                particles.append(p)
                count += 1
            }
            change += 0.2
        }
        
    }
    
    
    func FireworksHiyuusei(power:CGFloat,location:CGPoint,color:SKColor,particleCount:Double,colorSequence:[SKColor]){
        
        let power:CGFloat = power / 5
        
        
        for _ in (0..<2){
            
            
            for a in stride(from: 0, to: .pi * 2, by: .pi * 2 / particleCount){
                let rndVelocity = Double.random(in: 1...10)
                let vx = sin(a) * rndVelocity * power
                let vy = cos(a) * rndVelocity * power
                let p = Particle(x: location.x, y: location.y, vX: vx , vY: vy , gravity: 0.03, sk: self,color: color, emitterNodeName:"Particle")
                let colorSequence = SKKeyframeSequence(keyframeValues: colorSequence,
                                                       times: [0, 0.15,0.2])
                colorSequence.interpolationMode = .linear
                
                p.Drow()
                
                if sharedValues.rndColorFlag == true{
                    p.emitterNode.particleColorSequence = colorSequence
                }else{
                    p.emitterNode.particleColorSequence = nil
                    p.emitterNode.particleColor = color
                }
                
                
                p.emitterNode.particleLifetime = 1
                particles.append(p)
                
            }
        }
        
    }
    
    func FireworksSenrin(power:CGFloat,location:CGPoint,color:SKColor,particleCount:Double,colorSequence:[SKColor]){
        
        var Pos :[CGPoint] = []
        for _ in (0...2){
            for a in stride(from: 0, to: .pi*2 , by: .pi * 2 / particleCount){
                let rnd = Double.random(in: -10...10)
                let x = sin(rnd * a) * power * 50
                let y = cos(rnd * a) * power * 50
                
                Pos.append(CGPoint(x: x, y: y))
            }
            
            for a in stride(from: 0, to: .pi*2 , by: .pi * 2 / particleCount){
                subCircle1(power: power, location: CGPoint(x: location.x + Pos[Int(a)].x, y: location.y + Pos[Int(a)].y), color: color, particleCount: particleCount, colorSequence: colorSequence)
                subCircle1(power: power, location: CGPoint(x: location.x - Pos[Int(a)].x, y: location.y - Pos[Int(a)].y), color: color, particleCount: particleCount, colorSequence: colorSequence)
                
            }
        }
    }
    func subCircle1(power:CGFloat,location:CGPoint,color:SKColor,particleCount:Double,colorSequence:[SKColor]){
        let power:CGFloat = power / 10
        
        
        for a in stride(from: 0, to: .pi * 2, by: .pi * 2 / 10.0){
            let rndVelocity = Double.random(in: -10...10)
            let vx = sin(a) * rndVelocity * power
            let vy = cos(a) * rndVelocity * power
            let p = Particle(x: location.x, y: location.y, vX: vx , vY: vy , gravity: 0.05, sk: self,color: color, emitterNodeName:"Particle")
            let colorSequence = SKKeyframeSequence(keyframeValues: colorSequence,
                                                   times: [0, 0.15,0.2])
            colorSequence.interpolationMode = .linear
            
            p.Drow()
            
            if sharedValues.rndColorFlag == true{
                p.emitterNode.particleColorSequence = colorSequence
            }else{
                p.emitterNode.particleColorSequence = nil
                p.emitterNode.particleColor = color
            }
            
            p.emitterNode.particleLifetime = 1
            particles.append(p)
            
        }
        
        
    }
    func subCircle2(power:CGFloat,location:CGPoint,color:SKColor,particleCount:Double,colorSequence:[SKColor]){
        let power:CGFloat = power
        var change: CGFloat = 0.2
        var count = 0
        for _ in (0..<3){
            for a in stride(from:0 , to: CGFloat.pi*2,by: CGFloat.pi*2/particleCount){
                let vx = sin(a)*power * change
                let vy = cos(a)*power * change
                let p = Particle(x: location.x + vx, y: location.y + vy, vX: vx*1.1, vY: vy*1.1, gravity: 0.03, sk: self,color: color, emitterNodeName:"Particle")
                
                p.Drow()
                p.alpha = 0.7
                p.emitterNode.particleColorSequence = nil
                p.emitterNode.particleColor = color
                particles.append(p)
                count += 1
            }
            change += 0.2
        }
        
    }
}

#Preview(body: {
    FireWorksView()
})
