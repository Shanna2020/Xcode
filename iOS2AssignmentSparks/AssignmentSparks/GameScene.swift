//
//  GameScene.swift
//  AssignmentSparks
//
//  Created by user214013 on 2/13/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var count=0;
        var isTouched = false
        let particleEffect = SKEmitterNode(fileNamed: "ParticleEffect.sks")
        let myParticle = SKEmitterNode(fileNamed: "MyParticle.sks")
        let myBokenParticle = SKEmitterNode(fileNamed: "BokenParticle.sks")
        let mySnow = SKEmitterNode(fileNamed: "SnowParticle.sks")
        let mySpark = SKEmitterNode(fileNamed: "SparkParticle.sks")
    
    //initializer//////////////////////////////////////
    override init(size: CGSize) {
        super.init(size: size)
      
        particleEffect?.position = CGPoint(x: size.width / 2.0, y: 220.0)
       
        addChild(particleEffect!)
        
    }
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      
        if(count==0){
              //remove particleEffect
                particleEffect!.run(SKAction.removeFromParent())
    
            //add myParticle
                self.addChild(myParticle!)
       
                myParticle?.position = CGPoint(x: size.width / 2.0, y: 220.0)
              //  myParticle?.run(SKAction.sequence([SKAction.move(by: CGVector(dx: 5.0, dy: 5.0), duration: 0.4)]))
                count+=1
            
            }else if(count==1){
     
                //remove myParticle
                myParticle?.run(SKAction.removeFromParent())
                
                //Add myBrokenParticle
               self.addChild(myBokenParticle!)
                myBokenParticle?.position = CGPoint(x: size.width / 2.0, y: 220.0)
               // myBokenParticle?.run(SKAction.sequence([SKAction.move(by: CGVector(dx: 5.0, dy: 5.0), duration: 0.4)]))
                
             self.run(SKAction.sequence([SKAction.colorize(with: .purple, colorBlendFactor: 1.0, duration: 2.0),
                                     
                                                SKAction.colorize(with: .clear, colorBlendFactor: 1.0, duration: 2.0)]))
                    count+=1
                    
        }else if(count==2){
            //remove particleEffect
            myBokenParticle!.run(SKAction.removeFromParent())
  
          //add myParticle
          self.addChild(mySnow!)
     
            mySnow?.position = CGPoint(x: 0, y: size.height )
           // mySnow?.run(SKAction.sequence([ SKAction.scale(by: 1.0, duration: 3.0)]))
            
            self.run(SKAction.sequence([SKAction.colorize(with: .systemGreen, colorBlendFactor: 2.0, duration: 2.0),
                                        SKAction.colorize(with: .systemYellow, colorBlendFactor: 2.0, duration: 2.0),
                                               SKAction.colorize(with: .clear, colorBlendFactor: 1.0, duration: 2.0)]))
            
            count+=1;
          
          
            }else if(count==3){
                //remove particleEffect
                mySnow!.run(SKAction.removeFromParent())
      
              //add myParticle
              self.addChild(mySpark!)
         
                mySpark?.position = CGPoint(x: size.width / 2.0, y:  size.height / 2.0)
             //   mySpark?.run(SKAction.sequence([SKAction.move(by: CGVector(dx: 5.0, dy: 5.0), duration: 0.4) ,SKAction.scale(by: 1.0, duration: 3.0)]))
                  count+=1;
              
            }else{
                //remove particleEffect
                mySpark!.run(SKAction.removeFromParent())
      
              //add myParticle
                particleEffect?.position = CGPoint(x: size.width / 2.0, y: 220.0)
                
                addChild(particleEffect!)
                  
                count=0;
            }
        
        
    // }
  //   */
   
    }//end began touch
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
