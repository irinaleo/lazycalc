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
    case multiply = "×"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negate = "⁺∕₋"
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .teal
        case .clear, .negate, .percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 43/255.0, green: 45/255.0, blue: 47/255.0, alpha: 1))
        }
    }
}

struct ContentView: View {
    
    @State var value = "0"
    
    let buttons: [[myButton]] = [
        [.clear, .negate, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        VStack {
            Spacer()
            
            // total field
            HStack {
                Spacer()
                Text(value)
                    .bold()
                    .font(.system(size: 70))
                    .foregroundColor(.black)
            }
            
            // button field
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { item in
                        Button(action: {
                            self.tapped(button: item)
                        }, label: {
                            Text(item.rawValue)
                                .font(.system(size: 35))
                                .frame(
                                    width: self.buttonWidth(item: item),
                                    height: self.buttonHeight()
                                )
                                .background(item.buttonColor)
                                .foregroundColor(.white)
                                .cornerRadius(self.buttonWidth(item: item)/2)
                        })
                    }
                }
                .padding(.bottom, 3)
            }
        }
        .padding()
    }
    
    func buttonWidth(item: myButton) -> CGFloat {
        if item == .zero {
            // make the zero button wider
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func tapped(button: myButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal, .decimal, .negate, .percent:
            break
        case .clear:
            self.value = "0"
        default:
            let number = button.rawValue
            if self.value == "0"{
                value = number
            }
            else if self.value.count < 8 {
                self.value = "\(self.value)\(number)"
            }
            else {
                break
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
