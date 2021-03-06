//
//  ContentView.swift
//  DontSpeedApp
//
//  Created by gabi brown on 2021-12-14.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    @State var speedTravelled = 0.0
    
    @State var speedLimit = 0.0
    
    // MARK: Computed properties
    var speedDifference: Double {
        return speedTravelled - speedLimit
    }
    
    var feedback: String {
        switch speedTravelled {
        case ...(0 + speedLimit):
            return "You are going under the speed limit"
        case 1...20 + speedLimit:
                return "$100 fine"
        case 21...30 + speedLimit:
                return "$270 fine"
        case 30...150 + speedLimit:
                return "$500 fine"
        default:
            return "Travel safe."
        }
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Speed Limit")
                    .bold()
                
                Spacer()

            }
            
            // Input: Speed limit
            Slider(value: $speedLimit,
                   in: 0...200,
                   step: 0.1,
                   label: {
                Text("Speed limit")
            },
                   minimumValueLabel: {
                Text("0")
            },
                   maximumValueLabel: {
                Text("200")
            })
            
            HStack {
                Spacer()
                Text("\(String(format: "%.0f", speedLimit))")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            
            
            HStack {
                Text("Speed Travelled")
                    .bold()
                
                Spacer()

            }
            
            // Input: Speed travelled
            Slider(value: $speedTravelled,
                   in: 0...200,
                   step: 0.1,
                   label: {
                Text("Speed travelled")
            },
                   minimumValueLabel: {
                Text("0")
            },
                   maximumValueLabel: {
                Text("200")
            })
        
            HStack {
                Spacer()
                Text("\(String(format: "%.0f", speedTravelled))")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            
            //Output:Provide feedback on their fine
            Text(feedback)
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Speed radar")

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
