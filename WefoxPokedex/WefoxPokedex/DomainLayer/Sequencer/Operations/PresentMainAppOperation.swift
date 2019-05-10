//
//  PresentMainAppOperation.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation

class PresentMainAppOperation: ConcurrentOperation {

    override init() {
        super.init()
    }

    override func main() {

        DispatchQueue.main.async {
            MainFlowCoordinator.shared.start()
            self.state = .finished
        }
    }
}
