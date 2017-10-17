//
//  ViewController.swift
//  BackgroundFetch
//
//  Created by Matt Deuschle on 10/14/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func loadBikes() {
        print("API BIKES: \(API.shared.bikes)")
        for bike in API.shared.bikes {
            print("BIKE NAME: \(bike.stationName)")
        }
    }

}

