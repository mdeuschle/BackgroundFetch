//
//  ViewController.swift
//  BackgroundFetch
//
//  Created by Matt Deuschle on 10/14/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var bikes = [Bike]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func callAPI(completionHandler: @escaping(UIBackgroundFetchResult) -> Void) {
        API.shared.downloadBikeData { (success, bikes) in
            if success {
                for bike in bikes! {
                    DispatchQueue.main.async {
                        self.bikes.append(bike)
                        self.tableView.reloadData()
                        print("BIKE NAME: \(bike.stationName)")
                        completionHandler(.newData)
                    }
                }
            } else {
                completionHandler(.failed)

            }
        }
    }

    private func loadBikes() {
        for bike in API.shared.bikes {
            DispatchQueue.main.async {
                self.bikes.append(bike)
                self.tableView.reloadData()
                print("BIKE NAME: \(bike.stationName)")
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bikes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let bike = bikes[indexPath.row]
        cell.textLabel?.text = bike.stationName
        return cell
    }
}














