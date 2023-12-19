//
//  ContentView.swift
//  WeatherApp
//
//  Created by dzikru arya on 17/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if locationManager.haveLocation == true {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: locationManager.latitude, longitude: locationManager.latitude)
                              
                            } catch {
                                print(error)
                            }
                        }
                }
//                VStack(spacing: 20){
//                    Image(systemName: "location.fill")
//                         .resizable()
//                         .frame(width: 100, height: 100)
//                         .foregroundColor(.white)
//                    Text("you share your location")
//                         .bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                         .foregroundColor(.white)
//                        
//                } .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.713, saturation: 0.894, brightness: 0.751))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
       
    }
}

#Preview {
    ContentView()
}
