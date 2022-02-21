//
//  ContentView.swift
//  betterMusicMenu
//
//  Created by Iain Zwiebel on 2/20/22.
//

import SwiftUI

struct ContentView: View {
    @State var isUpdated : Bool = false
    
    var body: some View {
        VStack{
            Text("Current Song")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            Image(systemName: "music.note").resizable().frame(width: 50, height: 75, alignment: .center)
            Text("Artist")
                .font(.headline)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func updateStatusBarTitle(title: String){
        AppDelegate.shared.statusBarItem?.button?.title = title
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
