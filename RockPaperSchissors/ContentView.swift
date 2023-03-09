//
//  ContentView.swift
//  RockPaperSchissors
//
//  Created by Andrea Angiolillo on 09/03/2023.
//

import SwiftUI

struct ContentView: View {
//    enum Moves {
//        case Rock, Paper, Scissors
//    }
    
    
    
    var possibleMoves = ["Rock", "Paper", "Scissors"]
    
    @State var cpuMoveChoice = Int.random(in: 0...2)
    @State var shouldUserWin = {
        if Bool.random() {
            return "Which move should you pick to win the game?"
        }
        
        return "Which move should you pick to lose the game?"
    }
    

    @State var userScore = 0
    
    
    
    var possibleMoves2 = ["Rock": "👊🏼", "Paper": "✋🏼", "Scissors": "✌🏼"]
    
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
                        Text(shouldUserWin())
                        Text(possibleMoves2[possibleMoves[cpuMoveChoice]] ?? "Rock")
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
                            Text("👊🏼")
                                .padding(10)
                            Text("✋🏼")
                                .padding(10)
                            Text("✌🏼")
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
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
