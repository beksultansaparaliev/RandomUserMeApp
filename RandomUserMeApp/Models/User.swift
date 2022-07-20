//
//  User.swift
//  RandomUserMeApp
//
//  Created by Masaie on 15/4/22.
//

import Foundation

// MARK: - User
struct User: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
    
    init(value: [String: Any]) {
        gender = value["gender"] as? String ?? ""
        
        let name = value["name"] as? [String: String] ?? [:]
        self.name = Name(value: name)
        
        let location = value["location"] as? [String: Any] ?? [:]
        self.location = Location(value: location)
        
        email = value["email"] as? String ?? ""
        
        let login = value["login"] as? [String: String] ?? [:]
        self.login = Login(value: login)
        
        let dob = value["dob"] as? [String: Any] ?? [:]
        self.dob = Dob(value: dob)
        
        let registered = value["registered"] as? [String: Any] ?? [:]
        self.registered = Dob(value: registered)
        
        phone = value["phone"] as? String ?? ""
        cell = value["cell"] as? String ?? ""
        
        let id = value["id"] as? [String: String] ?? [:]
        self.id = ID(value: id)
        
        let picture = value["picture"] as? [String: String] ?? [:]
        self.picture = Picture(value: picture)
        
        nat = value["nat"] as? String ?? ""
    }
    
    static func getRandomUser(from value: Any) -> [User] {
        guard let value = value as? [String: Any] else { return [] }
        guard let results = value["results"] as? [[String: Any]] else { return [] }
        return results.compactMap {User(value: $0) }
    }
}

// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
    
    init(value: [String: Any]) {
        date = value["date"] as? String ?? ""
        age = value["age"] as? Int ?? 0
    }
}

// MARK: - ID
struct ID: Codable {
    let name, value: String
    
    init(value: [String: String]) {
        name = value["name"] ?? ""
        self.value = value["value"] ?? ""
    }
}

// MARK: - Location
struct Location: Codable {
    let street: Street
    let city, state, country, postcode: String
    let coordinates: Coordinates
    let timezone: Timezone
    
    init(value: [String: Any]) {
        let street = value["street"] as? [String: Any] ?? [:]
        self.street = Street(value: street)
        
        city = value["city"] as? String ?? ""
        state = value["state"] as? String ?? ""
        country = value["country"] as? String ?? ""
        postcode = value["postcode"] as? String ?? ""
        
        let coordinates = value["coordinates"] as? [String: String] ?? [:]
        self.coordinates = Coordinates(value: coordinates)
        
        let timezone = value["coordinates"] as? [String: String] ?? [:]
        self.timezone = Timezone(value: timezone)
    }
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String
    
    init(value: [String: String]) {
        latitude = value["latitude"] ?? ""
        longitude = value["longitude"] ?? ""
    }
}

// MARK: - Street
struct Street: Codable {
    let number: Int
    let name: String
    
    init(value: [String: Any]) {
        number = value["number"] as? Int ?? 0
        name = value["name"] as? String ?? ""
    }
}

// MARK: - Timezone
struct Timezone: Codable {
    let offset, timezoneDescription: String
    
    init(value: [String: String]) {
        offset = value["offset"] ?? ""
        timezoneDescription = value["timezoneDescription"] ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription = "description"
    }
}

// MARK: - Login
struct Login: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
    
    init(value: [String: String]) {
        uuid = value["uuid"] ?? ""
        username = value["username"] ?? ""
        password = value["password"] ?? ""
        salt = value["salt"] ?? ""
        md5 = value["md5"] ?? ""
        sha1 = value["sha1"] ?? ""
        sha256 = value["sha256"] ?? ""
    }
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
    
    init(value: [String: String]) {
        title = value["title"] ?? ""
        first = value["first"] ?? ""
        last = value["last"] ?? ""
    }
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
    
    init(value: [String: String]) {
        large = value["large"] ?? ""
        medium = value["medium"] ?? ""
        thumbnail = value["thumbnail"] ?? ""
    }
}
