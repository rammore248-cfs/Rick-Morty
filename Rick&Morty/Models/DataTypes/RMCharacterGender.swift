//
//  RMCharacterGender.swift
//  Rick&Morty
//
//  Created by XTSW-MAC-1137-2 on 06/11/24.
//

import Foundation

enum RMCharacterGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "Unknown"
    
    init(from decoder: Decoder) throws {
           let container = try decoder.singleValueContainer()
           let value = try? container.decode(String.self)
           self = RMCharacterGender(rawValue: value ?? "") ?? .unknown
       }
}
