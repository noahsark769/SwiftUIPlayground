//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Noah Gilmore on 7/2/19.
//  Copyright © 2019 Noah Gilmore. All rights reserved.
//

import SwiftUI
`
struct ContentView : View {
    var body: some View {
        Text("Hello World")
            .background(Color.blue)
            .frame(width: 300, height: 200)
            .background(Color.red)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
