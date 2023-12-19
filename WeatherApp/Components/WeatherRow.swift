//
//  WeatherRow.swift
//  WeatherApp
//
//  Created by dzikru arya on 19/12/23.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    var body: some View {
        HStack{
            Image(systemName: logo)
                .font(.system(size: 40))
                .foregroundColor(.black)
                .padding()
                .background(Color(hue: 0.561, saturation: 0.0, brightness: 0.0, opacity: 0.1))
                .cornerRadius(100)
            
            VStack(alignment: .leading, spacing: 10){
                Text(name)
                    .font(.caption)
                    .fontWeight(.light)
                
                Text(value)
                    .font(.title)
                    .fontWeight(.bold)
            }
           
        }
    }
}

#Preview {
    WeatherRow(
        logo: "sun.max",
        name: "Temperature",
        value: "25°")
}
