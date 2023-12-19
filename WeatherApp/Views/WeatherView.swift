//
//  WeatherView.swift
//  WeatherApp
//
//  Created by dzikru arya on 19/12/23.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name!)
                        .bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer().frame(height: 80)
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather?.first?.main ?? "No Description")
                                .font(.title)
                                .fontWeight(.light)
                            
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        var tempStatus : String = weather.main?.temp?.roundDouble() ?? "0"
                        Text("\(tempStatus)°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                        
                    }
                    
                    Spacer()
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_640.png") ) {
                        image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                }
                
                Spacer()
                
                
                
            }
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Now")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack{
                        WeatherRow(
                            logo: "wind",
                            name: "Wind Speed",
                            value: "\(weather.wind?.speed?.roundDouble() ?? "0") m/s")
                        Spacer()
                        WeatherRow(
                            logo: "drop",
                            name: "Humidity",
                            value: "\(Double(weather.main?.humidity ?? Int(0.0)).roundDouble()) %")
                    }
                    
                    HStack{
                        WeatherRow(
                            logo: "thermometer",
                            name: "Max Temp",
                            value: "\(weather.main?.tempMax?.roundDouble() ?? "0")°")
                        Spacer()
                        WeatherRow(
                            logo: "thermometer",
                            name: "Min Temp",
                            value: "\(weather.main?.tempMin?.roundDouble() ?? "0")°")
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.345))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                
            }
            
        }.edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.713, saturation: 0.894, brightness: 0.751))
            .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
