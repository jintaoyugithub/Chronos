//
//  EventRegisterView.swift
//  chronos
//
//  Created by Jintao Yu on 2025/6/21.
//

import SwiftUI

struct EventRegisterView: View {
    @StateObject var viewModel = EventRegisterViewModel()
    
    var body: some View {
        VStack{
            Form {
                TextField("", text: $viewModel.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 5)
                

                Picker("", selection: $viewModel.level) {
                    ForEach(Level.allCases, id: \.self) {
                        value in
                        Text(value.localizedName).tag(value)
                    }
                }
                .padding(.bottom, 5)
                
                Picker("", selection: $viewModel.mat) {
                    ForEach(Mat.allCases, id: \.self) {
                        value in
                        Text(value.localizedName).tag(value)
                    }
                }
                .padding(.bottom, 5)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(10)
            
            HStack{
                // Register Button
                Button {
                    // action func here
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue)
                        
                        Text("Register")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                .buttonStyle(PlainButtonStyle())
                
                // Cancel Button
                Button {
                    // action func here
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.red)
                        
                        Text("Cancel")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
            .frame(maxWidth: .infinity, maxHeight: 20, alignment: .center)
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    EventRegisterView()
}
