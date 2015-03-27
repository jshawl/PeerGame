// Playground - noun: a place where people can play

import UIKit

class Player {
    
    var health:Int = 100
    func isAlive() -> Bool {
        return health > 0
    }
    func attack() -> (message:String, damage:Int) {
        return (message:"Pow", damage:15)
    }
}

class GoodPlayer: Player {
    func roundHouseKick() -> (message:String, damage:Int) {
        return (message:"Whirl!", damage:17)
    }
    
    func upperCut() -> (message:String, damage:Int) {
        return(message:"Kapow!", damage:8)
    }
    
    func hadouken() -> (message:String, damage:Int) {
        return(message:"Hadouken!!", damage:12)
    }
    
    override func attack() -> (message:String, damage:Int) {
        
        var num = rand()%3
        if num == 0 {
          return roundHouseKick()
        } else if num == 1 {
          return upperCut()
        } else {
          return hadouken()
        }
    }
}

class BadPlayer: Player {
    func jubilee() -> (message:String, damage:Int) {
        return (message:"Peace, brother", damage:1)
    }
    
    func slapOnFace() -> (message:String, damage:Int) {
        return(message:"Whack!", damage:17)
    }
    
    func hyrouken() -> (message:String, damage:Int) {
        return(message:"Hyrouken!!", damage:12)
    }
    
    override func attack() -> (message:String, damage:Int) {
        
        var num = rand()%3
        if num == 0 {
            return jubilee()
        } else if num == 1 {
            return slapOnFace()
        } else {
            return hyrouken()
        }
    }

}


class Match {
    let playerOne:Player
    let playerTwo:Player
    init(playerOne: Player, playerTwo: Player){
      self.playerOne = playerOne
      self.playerTwo = playerTwo
    }
    func playGame(){
        var turn = 0

        while (self.playerOne.isAlive() && self.playerTwo.isAlive()) {
            var attacker:Player
            var attackee:Player
            if turn % 2 == 0{
                attacker = self.playerOne
                attackee = self.playerTwo
            } else {
                attackee = self.playerOne
                attacker = self.playerTwo
            }
            var attack = attacker.attack()
            attackee.health -= attack.damage
            println(attack.message)
            turn++
        }
        var winner = self.playerOne.isAlive() ? self.playerOne : self.playerTwo
        println("The winner is\(winner)!")
    }
}

var match = Match( playerOne: GoodPlayer(), playerTwo: BadPlayer() )
match.playGame()

































