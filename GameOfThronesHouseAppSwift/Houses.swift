//
//  Houses.swift
//  GameOfThronesHouseAppSwift
//
//  Created by Hau Hoang on 2023-08-10.
//

import Foundation

class Houses {
    
    var houseArray: [HouseInfo] = []
    var url = "https://www.anapioficeandfire.com/api/houses?page=1&pageSize=50"
    var pageNumber = 1
    
    func getData(completed: @escaping () -> ()){
        let urlString = url
        print("We are accessing the url \(urlString)")
        
        // create a url - if you need an apikey, you'd add it here, along with any other data for the call
        guard let url = URL(string: urlString) else {
            print("Could not create a URL from \(urlString)")
            completed()
            return
        }
        
        // create session
        let session = URLSession.shared
        
        // get data with .dataTask method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error.localizedDescription)")
            }
            // deal with the data
            do {
                self.houseArray = try JSONDecoder().decode([HouseInfo].self, from: data!)
                print("Here is what you returned: \(self.houseArray)")
                
            } catch {
                print("JSon error \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}
