//
//  ApiResponse.swift
//  ChatWise_Assignment
//
//  Created by Karan Verma on 11/04/24.
//

import Foundation

struct APIResponse : Codable {
    let products : [products]
}

struct products : Codable {
    let id : Int
    let title : String
    let description : String
    let thumbnail : String
}
