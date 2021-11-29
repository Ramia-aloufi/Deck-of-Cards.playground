
enum Color{
    case red, blue,green
}
struct Card{
    var color:Color
    var roll :Int
    
    init(color:Color){
        self.color = color
        switch color {
        case .blue:
            self.roll = (1...2).randomElement()!
        case .green:
            self.roll = (3...4).randomElement()!
        case .red:
            self.roll = (5...6).randomElement()!
    }
  }
}



class Deck{
    var cards:[Card]
    init() {
      self.cards = []
        for _ in 1...10 {
            self.cards.append(.init(color: .blue))
            self.cards.append(.init(color: .green))
            self.cards.append(.init(color: .red))
        }
    }
    func deal() -> Card{
        return cards.removeLast()
    }
    func isEmpty()->Bool{
        return self.cards.isEmpty
    }
    func shuffle(){
        cards.shuffle()
    }
}

class Player{
    var name:String
    var hand:[Card]
    
    init(name:String) {
        self.name = name
        self.hand = []
    }
    
    func draw(deck:Deck) -> Card {
        let myCard = deck.cards.randomElement()
        self.hand.append(myCard!)
        return myCard!
    }
    
    func rollDice() -> Int {
        return (1...6).randomElement()!
    }
    
    func matchingCards(color:String, roll:Int) -> Int{
        var count = 0
       // print("hand.count:\(hand.count)")
        for i in 0...hand.count - 1{
            if "\(hand[i].color)" == color.lowercased()  && hand[i].roll == roll{
                count += 1
            }
        }
        return count
    }
}

var firstPlayer = Player(name: "ram")
print(firstPlayer.draw(deck: Deck()))
print(firstPlayer.draw(deck: Deck()))
print(firstPlayer.draw(deck: Deck()))
print(firstPlayer.draw(deck: Deck()))
print(firstPlayer.matchingCards(color: "Blue", roll: 1))


