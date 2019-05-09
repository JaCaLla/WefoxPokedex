//
//  StringExtension.swift
//  UDManager
//
//  Created by Javier Calatrava Llaveria on 18/03/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation
import UIKit

extension String {

    var localized: String {

        return NSLocalizedString(self,
                                 tableName: nil,
                                 bundle: Bundle.main ,
                                 value: "",
                                 comment: "")
    }
}
