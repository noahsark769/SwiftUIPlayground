//
//  LayoutExamplesView.swift
//  SwiftUIPlayground
//
//  Created by Noah Gilmore on 7/31/19.
//  Copyright © 2019 Noah Gilmore. All rights reserved.
//

import SwiftUI

enum LayoutExample: String, CaseIterable {
    case hStackRelativeWidth = "HStack Relative Width"
    case anyViewLayoutDifferences = "AnyView differences"

    var view: AnyView {
        switch self {
        case .hStackRelativeWidth: return AnyView(LayoutExamplesHStackRelativeWidthView())
        case .anyViewLayoutDifferences: return AnyView(AnyViewLayoutDifferencesView())
        }
    }
}

struct LayoutExamplesView: View {
    var body: some View {
        return NavigationView {
            List {
                ForEach(LayoutExample.allCases, id: \LayoutExample.rawValue) { example in
                    NavigationLink(destination: example.view) {
                        Text(example.rawValue)
                    }
                }
            }
        }
    }
}

struct LayoutExamplesHStackRelativeWidthView: View {
    @State var hStackRelativeWidth: CGFloat = 1

    var title: String { "HStack relative width" }

    var body: some View {
        VStack {
            Text("The views in this horizontal stack are square and take up the entire width of their parent, divided evenly.")
            Text("Drag this slider to adjust the width - the views will stay square.")
            Slider(value: $hStackRelativeWidth, from: 0, through: 1)
                .padding([.leading, .trailing], 200)
            HStack(alignment: .top) {
                GeometryReader { geometry in
                    Color.red
                        .frame(height: geometry.size.width)
                }
                GeometryReader { geometry in
                    Color.blue
                        .frame(height: geometry.size.width)
                }
            }.relativeWidth(self.hStackRelativeWidth)
                .background(Color.yellow)
            HStack(alignment: .top) {
                GeometryReader { geometry in
                    AnyView(Color.red
                        .frame(height: geometry.size.width))
                }
                GeometryReader { geometry in
                    AnyView(Color.blue
                        .frame(height: geometry.size.width))
                }
            }.relativeWidth(self.hStackRelativeWidth)
                .background(Color.yellow)
        }.background(Color.green)
    }
}

struct AnyViewLayoutDifferencesView: View {
    @State var width: CGFloat = 200

    var body: some View {
        VStack {
            Text("These two red views are the same, but one is erased to AnyView. Drag the slider to adjust their width/height.")
                .lineLimit(nil)
            Slider(value: $width, from: 200, through: 700)
                .padding([.leading, .trailing], 200)
            HStack {
                GeometryReader { geometry in
                    AnyView(Color.red)
                        .frame(height: geometry.size.width)
                }.frame(width: width)
                    .background(Color.yellow)
                GeometryReader { geometry in
                    Color.red
                        .frame(height: geometry.size.width)
                }.frame(width: width)
                    .background(Color.yellow)
            }
        }.background(Color.green)
            .padding()
    }
}

#if DEBUG
struct LayoutExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutExamplesView()
    }
}
#endif
