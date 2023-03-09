//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Kul Boonanake on 10/3/23.
//

import Foundation
import CoreLocation

let apikey = ""

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> Weather {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apikey)&units=metric") else {fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetchich weather data")}
        
        let decodedData = try JSONDecoder().decode(Weather.self, from: data)
        
        return decodedData
        
        
    }
}

