//
//  CharacterModel.swift
//  RM Wiki
//
//  Created by Manuel Martinez on 20/07/22.
//

import Foundation

struct Request: Decodable {
    let results: [Result]
}

struct Result: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
    let origin: Origin
    let location: Location
}

struct Origin: Codable {
    let name: String
}

struct Location: Codable {
    let name: String
}
