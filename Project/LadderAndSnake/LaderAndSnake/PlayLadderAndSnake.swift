
import Foundation
class PlayLadderAndSnake{
    
    
    func main(){
        var number          : Int = -1
        var numberOfTries   : Int = 4;
        
        print("Enter number of players - The number must be between 2 and 4 inclusively :")

        repeat{
            numberOfTries -= 1
            let input:String = readLine()!

            if Int(input) != nil{
                number = Int(input)!
            }
            
            if number < 2 || number > 4 {
                var message = "Bad Attempt \(4 - numberOfTries) - Invalid Input"
                message += (numberOfTries == 0) ? "! You have exhausted all your chances. The program will terminate!" : " Enter number of players. Please enter a number between 2 and 4 inclusively:"
                print(message);
            } else{
                numberOfTries = 0
            }
                
            
        } while numberOfTries > 0
        
        if number >= 2 && number <= 4{
            
            let game = LadderAndSnake(number: number)
        } else{
        }
    }
}
