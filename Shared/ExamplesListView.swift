//
//  ExamplesListView.swift
//  SwiftUIPlayground
//
//  Created by Noah Gilmore on 7/21/19.
//  Copyright © 2019 Noah Gilmore. All rights reserved.
//

import SwiftUI

enum ExampleType: String, CaseIterable {
    case contextMenus = "Context Menus"
    case dragAndDrop = "Drag and Drop"
    case layout = "Layout"

    var destinationView: AnyView {
        switch self {
        case .contextMenus: return AnyView(ContextMenuView())
        case .dragAndDrop: return AnyView(Color.pink)
        case .layout: return AnyView(LayoutExamplesView())
        }
    }
}

#if os(macOS)
struct ExamplesListViewMac: View {
    @State var currentType: ExampleType = .contextMenus

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Header")) {
                    ForEach(ExampleType.allCases, id: \ExampleType.rawValue) { exampleType in
                        Text(exampleType.rawValue)
                            .background(self.currentType == exampleType ? Color.red : Color.clear)
                            .tapAction {
                                self.currentType = exampleType
                            }
                    }
                }.background(Color.blue)
            }.listStyle(.sidebar)
            self.currentType.destinationView
        }
    }
}
typealias ExamplesListView = ExamplesListViewMac
#elseif os(iOS)
struct ExamplesListViewiOS : View {
    var body: some View {
        NavigationView {
            List(ExampleType.allCases, id: \.rawValue) { exampleType in
                NavigationLink(destination: exampleType.destinationView) {
                    Text(exampleType.rawValue)
                }
            }
                .navigationBarTitle("Examples")
            Color.pink
        }
    }
}
typealias ExamplesListView = ExamplesListViewiOS
#endif

#if DEBUG
struct ExamplesListView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesListView()
    }
}
#endif
