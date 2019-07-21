//
//  ContextMenuView.swift
//  SwiftUIPlayground
//
//  Created by Noah Gilmore on 7/21/19.
//  Copyright © 2019 Noah Gilmore. All rights reserved.
//

import SwiftUI

struct ContextMenuView: View {
    @State var color: Color = .pink

    var body: some View {
        VStack {
            Text("This square has context menu actions.")
            self.color
                .frame(width: 100, height: 100)
                .contextMenu {
                    Button("Red") {
                        self.color = .red
                    }
                    Button("Blue") {
                        self.color = .blue
                    }
                    Button("Green") {
                        self.color = .green
                    }
                }
        }
    }
}

#if DEBUG
struct ContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuView()
    }
}
#endif
