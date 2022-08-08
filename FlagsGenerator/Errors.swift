//
//  Errors.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 08.08.2022.
//

import Foundation

enum AddStripeError: LocalizedError {
    case containerNotFound
    
    var errorDescription: String? {
        switch self {
        case .containerNotFound:
            return "You must select a subsection first!"
        }
    }
}
