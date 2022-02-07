//
//  CustomErrors.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import Foundation

enum FlightError: String, Error {
    case unableToDownload
    case invalidResponse
    case unableToParse
    case generalError
}