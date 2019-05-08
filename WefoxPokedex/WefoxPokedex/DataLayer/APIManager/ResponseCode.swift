//
//  ResponseCode.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 07/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//


import Foundation

enum ResponseCode : Int {
    case missingResponseResultValue = -5
    case badFormedJSONModel = -3
    case responseValidationFailed = -1
    case connectivityError = -4
}

