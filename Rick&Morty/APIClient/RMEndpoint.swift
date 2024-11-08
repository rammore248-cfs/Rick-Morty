//
//  RMEndpoint.swift
//  Rick&Morty
//
//  Created by XTSW-MAC-1137-2 on 06/11/24.
//

import Foundation

//Represents unique API endpoint
@frozen enum RMEndpoint: String {
    //Endpoint to get character info
    case character
    //Endpoint to get location info
    case location
    //Endpoint to get episodes info
    case episode
}
