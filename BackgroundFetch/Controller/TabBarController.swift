//
//  TabBarController.swift
//  BackgroundFetch
//
//  Created by Matt Deuschle on 10/16/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    let vcs = [DetailViewController()]

    init() {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = vcs
    }

    required init?(coder _: NSCoder) { fatalError() }
    override init(nibName _: String?, bundle _: Bundle?) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func backgroundFetch() {

        vcs.first?.backgroundFetch()
    }
}
