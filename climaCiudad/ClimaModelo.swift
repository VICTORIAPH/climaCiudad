//
//  ClimaModelo.swift
//  climaCiudad
//
//  Created by Victoria on 24/04/22.
//

import Foundation
struct ClimaModelo {
    let condicionID: Int
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let nombreCiudad: String
    let id: Int
    
    
    //propiedades calculadas
    //imprimir temp con un decimal
    var tempString: String{
        //convertir de double a string
        return String(format: "%.1f", temp)
        
    }

    var temp_minString: String{
        //convertir de double a string
        return String(format: "%.1f", temp_min)
        
    }

    var temp_maxString: String{
        //convertir de double a string
        return String(format: "%.1f", temp_max)
        
    }

    var condicionClima : String{
        switch id{
        
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.haild"
        case 500...531:
            return "cloud.sleet"
        case 600...622:
            return "snow"
        case 701...781:
            return "sun.dust"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.sun"
        default:
            return "cloud"
            
            
      
        }
       
    }
    var fondoCondicion: String{
            switch condicionID{
            case 200...232:
                return "tormenta"
            case 300...321:
                return "llovizna"
            case 500...531:
                return "lluvia"
            case 600...622:
                return "nevando"
            case 700...781:
                return "soleado"
            case 800:
                return "despejado"
            case 801...831:
                return "nubes"
            default:
                return "cloud.png"
            }
        }
    

            
    
    
}
