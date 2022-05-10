//
//  ClimaManager.swift
//  climaCiudad
//
//  Created by Victoria on 23/04/22.
//

import Foundation
protocol ClimaManagerDelegado {
    func actualizarClima(clima: ClimaModelo)
}

struct ClimaManager {
    let climaURL =
        "https://api.openweathermap.org/data/2.5/weather?appid=3a070b3c882763234cc91cae8a6ce2bf&units=metric&lang=es"
    //quien sea delegado debera implementar este protocolo
    var delegado: ClimaManagerDelegado?
    
    func buscarClima(ciudad: String){
        let urlString = "\(climaURL)&q=\(ciudad)"
        realizarSolicitud(urlString: urlString)
    }
    
    func realizarSolicitud(urlString: String){
     //1.- crear la url
        if let url = URL(string: urlString){
            //2.- crear una URLSession
            let session = URLSession(configuration: .default)
            //3.- Asignarle una tarea a la URLSession
            let tarea = session.dataTask(with: url) { (datos, respuesta, error) in
                if error != nil {
                    print("Error al obtener los datos: \(error!)")
                    return
                }
                if let datosSeguros = datos{
                    //mostrar en consola
                    //let datosString = String(data: datosSeguros, encoding: .utf8)
                    //print(datosString!)
                    //parsear JSON
                    if let objClima = self.parsearJSON(datosClima: datosSeguros){
                        //mandar el objeto al view controler principal
                        //let ClimaVC = ViewController()
                        //ClimaVC.actualizarClima(objClima: objClima)
                        
                        //designar un delegado
                        self.delegado?.actualizarClima(clima: objClima)
                    }
                    
                }
                
            }
            //4.- iniciar la tarea
            tarea.resume()
        }
    }
        
    func parsearJSON(datosClima: Data) -> ClimaModelo?{
        //crearun decodificador JSON
        let decodificador = JSONDecoder()
        do {
            let datosDecodificados =  try decodificador.decode(ClimaDatos.self, from: datosClima)
            //imprimir los datos de la API
            let condicionID = datosDecodificados.weather[0].id
           let id = datosDecodificados.weather[0].id
            let ciudad = datosDecodificados.name
            let temp = datosDecodificados.main.temp
            let temp_min = datosDecodificados.main.temp_min
            let temp_max = datosDecodificados.main.temp_max
            
            let objClima = ClimaModelo( condicionID: condicionID, temp: temp, temp_min: temp_min, temp_max: temp_max, nombreCiudad: ciudad, id: id)
            print(objClima.condicionClima)
            print(objClima.temp_min)
            print(objClima.temp_max)
            return objClima
            
        } catch  {
            print("Error al decodificar los datos \(error.localizedDescription)")
            return nil
        }
    }
    
    }
