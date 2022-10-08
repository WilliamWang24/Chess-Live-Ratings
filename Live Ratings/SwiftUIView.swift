//
//  SwiftUIView.swift
//  Live Ratings
//
//  Created by William Wang on 11/20/22.
//

import SwiftUI

struct SwiftUIView: View {
    @State var isShowingSheet = false
    @State var timeFormat = 0

    var body: some View {
        Button {
            isShowingSheet = true
        } label: {
            Text("Show the sheet!")
        }
        .sheet(isPresented: $isShowingSheet) {
            VStack {
   
                HStack {
                    Text("Time Format")
                        .bold()
                }.padding(.bottom, 8)
                HStack {
                    Spacer()
                    Button {timeFormat = 0} label: {
                        Text("♞")
                            .foregroundColor(.brown)
                            .font(.title)
                        Text("Classical")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Button {timeFormat = 1} label: {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.yellow)
                        Text("Blitz")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Button {timeFormat = 2} label: {
                        Image(systemName: "timer")
                            .foregroundColor(.green)
                        Text("Rapid")
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
            }
            .presentationDetents([.height(200)])
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
