//
//  ViewController.swift
//  climaCiudad
//
//  Created by Victoria on 22/04/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ClimaManagerDelegado {
   
    

    var climaManager = ClimaManager()
    
    
    @IBOutlet weak var ciudadTextField: UITextField!
    
    @IBOutlet weak var temp_minLabel: UILabel!
    
    @IBOutlet weak var temp_maxLabel: UILabel!
    @IBAction func mapaButton(_ sender: UIButton) {
    }
    
    @IBAction func buscarButton(_ sender: UIButton) {
        
        //ocultar teclado
        ciudadTextField.endEditing(true)
        //imprimir nombre
        //print(ciudadTextField.text!)
        //ciudadLabel.text = ciudadTextField.text
        //para borra en el textfield
        //ciudadTextField.text = ""
    }
    
    
    @IBOutlet weak var climaImageView: UIImageView!
    
    @IBOutlet weak var temperaturaLabel: UILabel!

    @IBOutlet weak var ciudadLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Establecer esta clase como el delegado del climaManager
        climaManager.delegado = self
        ciudadTextField.delegate = self
        
    }
    //Metodos del delegado
    //darle codigo al boton "ir" del teclado virtual
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //ocultar teclado
       ciudadTextField.endEditing(true)
       //print(ciudadTextField.text!)
        
       // ciudadLabel.text = ciudadTextField.text
        //para borrar en el textfield
        //ciudadTextField.text = ""
        return true
    }
    //deberia permitir de editar el textfield
    //evitar que el usuario continue sin escribir lgo
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if ciudadTextField.text != "" {
            return true
        }else  {
            ciudadTextField.placeholder = "Escribe algo"
            return false
        }
       
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        climaManager.buscarClima(ciudad: ciudadTextField.text!)
        //limpiar el textfield
        ciudadLabel.text = ciudadTextField.text
        ciudadTextField.text = ""
    }
    
    func actualizarClima(clima: ClimaModelo) {
        DispatchQueue.main.async {
            
            self.temperaturaLabel.text = clima.tempString
            self.temp_minLabel.text = clima.temp_minString
            self.temp_maxLabel.text = clima.temp_maxString
            self.ciudadLabel.text = clima.nombreCiudad
            self.climaImageView.image = UIImage(systemName: clima.condicionClima)
        }
    }
 
    
}

