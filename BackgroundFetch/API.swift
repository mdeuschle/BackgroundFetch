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

    func downloadBikeData(handler: @escaping (Bool, [Bike]?) -> ()) {
        guard let url = URL(string: "https://feeds.divvybikes.com/stations/stations.json") else {
            handler(false, nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if data != nil && error == nil {
                do {
                    if let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
                        if let bikeDics = object["stationBeanList"] as? [[String: Any]] {
                            for bikeDic in bikeDics {
                                if let bike = Bike(bikeDic: bikeDic) {
                                    self.bikes.append(bike)
                                }
                            }
                            handler(true, self.bikes)
                        }
                    } else {
                        handler(false, nil)
                    }
                } catch {
                    handler(false, nil)
                }
            } else {
                handler(false, nil)
            }
        }
        task.resume()
    }
}


