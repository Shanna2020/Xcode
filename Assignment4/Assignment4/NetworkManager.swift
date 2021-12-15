//
//  NetworkManager.swift
//  Assignment4
//
//  Created by user199511 on 12/8/21.
//

import  UIKit

class NetworkManager{
    
    ///////////////////////////////////////////////////////////////////////////////////////
    static var shared = NetworkManager()
    func getCocktailPackage(name: String, handler: @escaping ([Info])->Void){
 
    let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="+name
 
    let urlObj = URL(string: urlString)!
 
    let task =  URLSession.shared.dataTask(with: urlObj) { data, apiresponse, error in
        
        if let error = error {
            print(error)
            handler([Info]())
        }
        // check response code
        else if let correct_data = data {
            do{
             let decoder = JSONDecoder() //result.self
                let resultFromDeconder = try decoder.decode(result.self,from: correct_data)
                handler(resultFromDeconder.drinks)
            }catch {
                print(error)
            }
        }
    }
    task.resume()
}
////////////////////////////////////////////////////////////////////////////////

func getImage(url : String, handler: @escaping (Result<UIImage,Error>)->Void ){
    let urlObj = URL(string: url)!

    let task =  URLSession.shared.dataTask(with: urlObj) { data, apiresponse, error in
        if let error = error {
            print(error)
            handler(.failure(error))
        }
        else if let correct_data = data {
            let img = UIImage(data: correct_data)
            handler(.success(img!))
    }
}
    task.resume()
}
}
