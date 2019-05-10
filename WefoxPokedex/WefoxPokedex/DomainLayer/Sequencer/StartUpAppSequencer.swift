//
//  StartUpAppSequencer.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//


import Foundation
import UIKit

class  StartUpAppSequencer {

    static let shared =  StartUpAppSequencer()

    fileprivate let operationQueue = OperationQueue()

    private init() { /*This prevents others from using the default '()' initializer for this class. */ }

    func start() {

        let presentMainAppOperation = PresentMainAppOperation()

        let operations = [presentMainAppOperation]

        // Add operation dependencies
       
        operationQueue.addOperations(operations, waitUntilFinished: false)
    }
}
