//
//  DetailViewController.swift
//  BackgroundFetch
//
//  Created by Matt Deuschle on 10/16/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, Delegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

    func backgroundFetch() {
        view.backgroundColor = .green
    }


}
