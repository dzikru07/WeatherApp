//
//  LoadingView.swift
//  WeatherApp
//
//  Created by dzikru arya on 17/12/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
    
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(2)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            
          

    }
}

#Preview {
    LoadingView()
}
