//
//  ContentView.swift
//  LazyCalc
//
//  Created by Irina Bejan on 1/24/22.
//

import SwiftUI

enum myButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
}

struct ContentView: View {
    
    let buttons: [[myButton]] = [
        [.seven, .eight, .nine]
    ]
    
    
    var body: some View {
        VStack {
            // total
            HStack {
                Spacer()
                Text("0")
                    .bold()
                    .font(.system(size: 60))
                    .foregroundColor(.black)
            }
            .padding()
            
            
            // buttons
            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        Button(action: {
                            
                        }, label: {
                            Text(item.rawValue)
                                .font(.system(size: 35))
                                .frame(width: 70, height: 70)
                                .background(Color.teal)
                                .foregroundColor(.white)
                                .cornerRadius(35)
                        })
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
