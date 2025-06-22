//
//  HomeView.swift
//  chronos
//
//  Created by Jintao Yu on 2025/6/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            HStack{
                NavigationLink {
                    EventRegisterView()
                        .navigationTitle("")
                } label: {
                    Label(" ", systemImage: "plus")
                        .foregroundColor(.blue)
                }
                .buttonStyle(PlainButtonStyle())

                NavigationLink {
                    EventRegisterView()
                        .navigationTitle("")
                } label: {
                    Label(" ", systemImage: "info.circle")
                        .foregroundColor(.blue)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity, alignment: .topTrailing)
            
            VStack {
                // study button
                Button {
                    // action here
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue)
                        
                        Text("Study")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                .buttonStyle(PlainButtonStyle())
                
                // study button
                Button {
                    // action here
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue)
                        
                        Text("Work out")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                .buttonStyle(PlainButtonStyle())
                
                // study button
                Button {
                    // action here
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue)
                        
                        Text("Misc")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(10)
    }
}

#Preview {
    HomeView()
}
