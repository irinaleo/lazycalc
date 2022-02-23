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
    @State var stream = 0
    @State var operation = ""
    
    let buttons: [[myButton]] = [
        [.clear, .negate, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                    
                // total field
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 70))
                        .foregroundColor(.white)
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
        case .add, .subtract, .multiply, .divide:
            self.operation = button.rawValue
            self.stream = Int(self.value) ?? 0
        case .equal:
            let stream = self.stream
            let current = Int(self.value) ?? 0
            switch self.operation {
            case "+":
                self.value = "\(stream + current)"
            case "-":
                self.value = "\(stream - current)"
            case "×":
                self.value = "\(stream * current)"
            case "÷":
                self.value = "\(stream / current)"
            default:
                break
            }
            self.operation = ""
        case .decimal, .negate, .percent:
            break
        case .clear:
            self.value = "0"
            self.operation = ""
        default:
            let num = button.rawValue
            if self.value == "0" {
                value = num
            }
            else {
                if self.operation == "" {
                    self.value = "\(self.value)\(num)"
                }
                else {
                    self.value = num
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
