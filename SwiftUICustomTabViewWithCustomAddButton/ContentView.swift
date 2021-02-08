//
//  ContentView.swift
//  SwiftUICustomTabViewWithCustomAddButton
//
//  Created by ramil on 08.02.2021.
//

import SwiftUI

enum Tab {
    case first
    case second
}

struct TabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
}

struct ContentView: View {
    @State private var selectedTab: Tab = .first
    
    var body: some View {
        VStack {
            switch selectedTab {
            case .first:
                NavigationView {
                    FirstView()
                }
            case .second:
                NavigationView {
                    SecondView()
                }
            }
            CustomTabView(selectedTab: $selectedTab)
                .frame(height: 50)
        }
    }
}

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                selectedTab = .first
            }, label: {
                VStack {
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    Text("First")
                        .font(.caption2)
                }.foregroundColor(selectedTab == .first ? .primary : .secondary)
            })
            Spacer()
            Button(action: {
                
            }, label: {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80)
                        .shadow(radius: 2)
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(.primary)
                        .frame(width: 72, height: 72)
                }
                .offset(y: -32)
            }).buttonStyle(TabButtonStyle())
            Spacer()
            Button(action: {
                selectedTab = .second
            }, label: {
                VStack {
                    Image(systemName: "chart.bar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    Text("Second")
                        .font(.caption2)
                }.foregroundColor(selectedTab == .second ? .primary : .secondary)
            })
            Spacer()
        }
    }
}

struct FirstView: View {
    var body: some View {
        Color(.systemGray5)
            .ignoresSafeArea()
            .navigationTitle("First")
    }
}

struct SecondView: View {
    var body: some View {
        Color(.systemGray4)
            .ignoresSafeArea()
            .navigationTitle("Second")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
