//
//  API.swift
//  BackgroundFetch
//
//  Created by Matt Deuschle on 10/14/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import Foundation

class API {

    static let shared = API()
    var bikes = [Bike]()

    func downloadBikeData(handler: @escaping (Bool) -> ()) {
        guard let url = URL(string: "https://feeds.divvybikes.com/stations/stations.json") else {
            handler(false)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if data != nil && error == nil {
                do {
                    if let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
                        print("OBJECT: \(object.description)")

                    } else {
                        handler(false)
                    }

                } catch {
                    handler(false)
                }
            } else {
                handler(false)
            }
        }
        task.resume()
    }
}


