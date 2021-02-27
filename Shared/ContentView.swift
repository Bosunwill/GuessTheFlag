//
//  ContentView.swift
//  Shared
//
//  Created by Gui Ndikum on 2/24/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
        VStack(alignment: .leading) {
            /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
            HStack(spacing: 20){
                Text("1.0")
                Text("1.1")
            }
        }
            Spacer()
            Text("FAVORITE")
            VStack(alignment: .leading) {
                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
            }
            .padding()
            ZStack{
                //To build a text on text
                Text("FirstText")
                Text("Second text")
            }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
