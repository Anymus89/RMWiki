//
//  NetworkManager.swift
//  RM Wiki
//
//  Created by Manuel Martinez on 20/07/22.
//

import Foundation

class NetworkManager {
    
    func getCharacters(stringUrl: String, completion: @escaping(Request) ->()) {
            
            guard let url = URL(string: stringUrl) else {
                fatalError("MAMASTE CON EL LINK")
            }
            
            URLSession.shared.dataTask(with: url) { datos, respuesta, error in
                
                guard let data = datos, error == nil, let response = respuesta as? HTTPURLResponse else {
                    return
                }
                
                if response.statusCode == 200 {
                    
                    print("Conexion exitosa con el servidor")
                    
                    do {
                        
                        let characters = try JSONDecoder().decode(Request.self, from: data)
                        
                        DispatchQueue.main.async {
                            completion(characters)
                        }
                        
                    } catch let error {
                        print(error.localizedDescription)
                        print("Error al decodificar")
                    }
                    
                }
            }.resume()
            
        }

    
}

