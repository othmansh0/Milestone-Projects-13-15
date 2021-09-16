// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct Country: Codable {
    let name: String
    let topLevelDomain: [String]
    let alpha2Code, alpha3Code: String
    let callingCodes: [String]
    let capital: String
    let altSpellings: [String]
    let region, subregion: String
    let population: Int
    let latlng: [Int]
    let demonym: String
    let area: Int
    let gini: Double
    let timezones, borders: [String]
    let nativeName, numericCode: String
    let currencies: [Currency]
    let languages: [Language]
  
    let flag: String

    let cioc: String
}

// MARK: - Currency
struct Currency: Codable {
    let code, name, symbol: String
}

// MARK: - Language
struct Language: Codable {
    let iso6391, iso6392, name, nativeName: String

    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso639_1"
        case iso6392 = "iso639_2"
        case name, nativeName
    }
}











 
