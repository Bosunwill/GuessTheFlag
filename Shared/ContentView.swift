//
//  ContentView.swift
//  Shared
//
//  Created by Gui Ndikum on 2/24/21.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled() //Randomize order in array of country images so that first country is not always Estonia
    @State private var country = ""
    @State private var correctAnswer = Int.random(in: 0 ... 2) // Picks 3 random #
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreAnswer = 0
    @State private var turns = 0
    
    var body: some View{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.gray, .blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            //Color.blue.edgesIgnoringSafeArea(.all)
        VStack(spacing: 30){
        VStack{
            Text("Tap the flag of")
                .foregroundColor(.white)
                .fontWeight(.bold)
            Text(countries[correctAnswer]) // Any one of first 3 countries is picked atfer shuffled
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.black)
        }
        ForEach(0 ..< 3){
            number in Button(action: {
                self.flagTapped(number)
            }) {
                Image(self.countries[number]) //Display first 3 images the way they featured in array
                    .renderingMode(.original)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.purple, lineWidth: 5))
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 6, y: 9)
            }
        }
                Text("\(scoreAnswer)/\(turns)")
                    .foregroundColor(.green)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    //.clipShape(Circle())
                    //.overlay(Circle().stroke(Color.yellow, lineWidth: 3))
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 6, y: 9)
            Spacer()
        }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text("\(scoreTitle)! That is the flag of \(country)"), message:
                    Text("Your score is \(scoreAnswer)/\(turns)???"), dismissButton: .default(Text("Continue")){
                self.askQuestion()
            })
        }
        
    }
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreAnswer = scoreAnswer + 1
            turns = turns + 1
            country = countries[correctAnswer]
        } else {
            scoreTitle = "Wrong"
            country = countries[number]
            turns = turns + 1
        }
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
