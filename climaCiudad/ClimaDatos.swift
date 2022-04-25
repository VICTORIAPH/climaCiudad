//
//  ClimaDatos.swift
//  climaCiudad
//
//  Created by Victoria on 23/04/22.
//

import Foundation

struct ClimaDatos: Decodable, Encodable{
    let name: String
    let main: Main
    let weather: [Weather]
}
//es decodable para poder extraer
struct Main: Decodable, Encodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Decodable, Encodable{
    let id: Int
    let description: String
}
