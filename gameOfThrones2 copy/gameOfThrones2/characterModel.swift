// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characters = try? JSONDecoder().decode(Characters.self, from: jsonData)

import Foundation

// MARK: - Character
struct Character: Codable {
    let id: Int?
    let firstName, lastName, fullName, title: String?
    let family, image: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, fullName, title, family, image
        case imageURL = "imageUrl"
    }
}

typealias Characters = [Character]
 
