//
//  Bike.swift
//  BackgroundFetch
//
//  Created by Matt Deuschle on 10/14/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import Foundation

struct Bike {

    let stationName: String

    init?(bikeDic: [String: Any]) {
        guard let name = bikeDic["stationName"] as? String else {
            return nil
        }
        self.stationName = name
    }
}
