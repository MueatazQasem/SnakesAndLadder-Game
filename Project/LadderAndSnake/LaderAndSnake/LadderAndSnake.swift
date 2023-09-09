
import Foundation
class LadderAndSnake{
    
    var playerNames = [String]()
    var board = [Int]()
    var playerPosition = [Int]()
    
    init(number:Int){
        setBoard()
        playerNames = [String](repeating: "Name", count: number)
        playerPosition = [Int](repeating: -1, count: number)
        
        for  playerIndex in 0...number-1{
            getPlayerName(playerIndex: playerIndex)
        }
        
        sortPlayer()

        var welcomeMessage : String = "Welcome "
        
        for playerIndex in 0...playerNames.count-1{
            if playerIndex == 0 {
                welcomeMessage += playerNames[playerIndex]
            }else if playerIndex == playerNames.count-1 {
                welcomeMessage += " and " + playerNames[playerIndex]
            }else{
                welcomeMessage += "," + playerNames[playerIndex]
            }
        }
        welcomeMessage += " For Ladder and Snake Game."
        print(welcomeMessage)
        play()
        
    }

    func setBoard(){
        board = [Int](repeating: 0, count: 100)
        board[1-1] = 38 - 1
        board[4-1] = 14-4
        board[9-1] = 31-9
        board[16-1] = 6 - 16
        board[21-1] = 42-21
        board[28-1] = 84-28
        board[36-1] = 44-36
        board[48-1] = 30-48
        board[51-1] = 67-51
        board[64-1] = 60-64
        board[71-1] = 91-71
        board[79-1] = 19-79
        board[80-1] = 100-80
        board[93-1] = 68-93
        board[95-1] = 24-95
        board[97-1] = 76-97
        board[98-1] = 78-98
    }

    func play(){
        
        print("Game Start...")
        var isGameOver = checkPlayerWin()
        
        while(true){
            for playerIndex in 0...playerNames.count-1 {
                print(playerNames[playerIndex] + " Press any key")
            readLine()
            let diceResult = flipDice()
            print("Dice : " + String(diceResult))
            playerPosition[playerIndex] += diceResult
            if playerPosition[playerIndex] > 99{
                let returnStep = (playerPosition[playerIndex] - 99) * 2
                playerPosition[playerIndex] -= returnStep
            }
            playerPosition[playerIndex] += board[playerPosition[playerIndex]]
                    
            printPlayerPosition()
                
            isGameOver = checkPlayerWin()
            if isGameOver{
                break
            }
            }
            if isGameOver{
                break
            }
        }
    }
    
    func sortPlayer(){
        
        var unSortedPlayer :[String:Int] = [String:Int]()
        
        print("Now deciding which player will start playing")
        
        for playerIndex in 0...playerNames.count-1{
            print("\(playerNames[playerIndex] ) Flip dice : (press any key)")
            readLine()
            let random = flipDice()
            print(random)
            unSortedPlayer.updateValue(random * 100 , forKey: playerNames[playerIndex] )
        }
        var sortedPlayer = unSortedPlayer.sorted{ return $0.value > $1.value}
        
       while(sortPlayers(players: &sortedPlayer)){
            
        }
         sortedPlayer = sortedPlayer.sorted{ return $0.value > $1.value}
        var index: Int = 0
        for (key,value) in sortedPlayer {
            playerNames[index] = key
            index += 1
        }
    }

    func sortPlayers(players :inout Array<(key: String, value: Int)>) -> Bool{

        var duplicateNumber :[Int:Int] = [Int:Int]()
                var duplicateIndex = players.startIndex
        
        var checkDuplicate = false
        
        for playerIndex in 0...players.count-1{
            
            if duplicateNumber[players[duplicateIndex].value] == nil{
                duplicateNumber[players[duplicateIndex].value] = 1
            }
            else{
                duplicateNumber[players[duplicateIndex].value]! += 1
                checkDuplicate = true
            }
            
       
            duplicateIndex = players.index(after: duplicateIndex)
        }
        
        duplicateIndex = players.startIndex
        
        for playerIndex in 0...players.count-1{
            

            if duplicateNumber[players[duplicateIndex].value]! > 1{
                print("\(players[duplicateIndex].key) Flip dice : (press any key)")
                readLine()
                

                let random = flipDice()
                print(random)
                players[duplicateIndex].value += random
            }
            
            duplicateIndex = players.index(after: duplicateIndex)
        }
        
        return checkDuplicate
    }

   
    func printPlayerPosition(){
        var message : String = ""
        for playerIndex in 0...playerNames.count-1{
            
            message += playerNames[playerIndex] + " : " + String(playerPosition[playerIndex] + 1) + "  "
        }
        print(message)
    }

    func checkPlayerWin()-> Bool{
        var isGameOver = false
        for playerIndex in 0...playerNames.count-1{
            if playerPosition[playerIndex] == 99{
                isGameOver = true
                print("Winner is \(playerNames[playerIndex])")
            }
                
        }
        
        return isGameOver
    }
    
    func flipDice()-> Int{
        return Int.random(in: 1...6)
    }
    
    func getPlayerName(playerIndex:Int){
        print("Enter Player \(playerIndex + 1) name : ")
        playerNames[playerIndex] = readLine()!
    }
}
