//
//  ContentView.swift
//  RockPaperSchissors
//
//  Created by Andrea Angiolillo on 09/03/2023.
//
// Challenge:
// - Each turn of the game the app will randomly pick either rock, paper, or scissors.
// - Each turn the app will alternate between prompting the player to win or lose.
// - The player must then tap the correct move to win or lose the game.
// - If they are correct they score a point; otherwise they lose a point.
// - The game ends after 10 questions, at which point their score is shown.

import SwiftUI

struct ContentView: View {
    
    @State var cpuMoveChoice = Int.random(in: 0...2)
    @State var userScore = 0
    @State var shouldUserWin = Bool.random()
    @State var gameOver = false
    
    
    enum Moves {
        case Rock, Paper, Scissors
    }
    
    var possibleMoves = [ "👊🏼",  "✋🏼", "✌🏼"]
    
    
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(
                    colors: [.blue, .white, .green]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                
                
                VStack {
                    Spacer()
                    Text("Rock, Paper, Scissors")
                        .font(.title)
                    
                    
                    Spacer()
                    
                    
                    VStack (spacing: 30) {
                        Text(shouldUserWin ?
                             "Which move should you pick to win the game?" :
                                "Which move should you pick to lose the game?")
                        Text(possibleMoves[cpuMoveChoice])
                    }
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 10)
                    
                    
                    
                    Spacer()
                    
                    VStack{
                        Text("You Move:")
                        HStack {
                            Button("👊🏼") {
                                calculateScore(userMove: Moves.Rock)
                            }
                            .padding(10)
                            
                            Button("✋🏼") {
                                calculateScore(userMove: Moves.Paper)
                            }
                            .padding(10)
                            
                            Button("✌🏼") {
                                calculateScore(userMove: Moves.Scissors)
                            }
                            .padding(10)
                        }
                    }
                    
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 10)
                    
                    
                    Spacer()
                    Spacer()
                    Section {
                        Text("Score: \(userScore)")
                            .foregroundColor(.black)
                            .font(.title)
                    }
                }
            }
            .alert("Game Over", isPresented: $gameOver){
                Button("Play Again", action: reset)
            } message: {
                Text("Your score is \(userScore)")
            }
        }
    }
    
    func calculateScore(userMove: Moves) -> Void {
        userScore += shouldUserWin ? calculateScoreIncreamentWin(userMove: userMove) : calculateScoreIncreamentLose(userMove: userMove)
        shouldUserWin = Bool.random()
        cpuMoveChoice = Int.random(in: 0...2)
        gameOver = userScore == 10 ? true : false
    }
    
    
    func calculateScoreIncreamentWin(userMove: Moves) -> Int{
        if cpuMoveChoice == 0 {
            return userMove == .Paper ? 1 : 0
        }
        
        if cpuMoveChoice == 1 {
            return userMove == .Scissors ? 1 : 0
        }
        
        return userMove == .Rock ? 1 : 0
    }
    
    
    func calculateScoreIncreamentLose(userMove: Moves) -> Int{
        return calculateScoreIncreamentWin(userMove: userMove) == 0 ? 1 : 0
    }
    
    func reset() {
        shouldUserWin = Bool.random()
        cpuMoveChoice = Int.random(in: 0...2)
        gameOver = false
        userScore = 0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
