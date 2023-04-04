//
//  Contact.swift
//  ContacsBook
//
//  Created by Лаборатория on 05.04.2023.
//

struct Contact {
    var name: String
    var email: String
    var age: Int
    var phone: Int
    var gender: Bool
    var category: ContactCategory
}

extension Contact: Equatable { }

extension Contact {
    var representation: [String: Any] {
        var repr = [String: Any]()
        repr["name"] = name
        repr["email"] = email
        repr["age"] = age
        repr["phone"] = phone
        repr["gender"] = gender
        repr["category"] = category.rawValue
        return repr
    }
}

extension Contact {
    init?(_ representation: [String: Any]) {
        guard let name = representation["name"] as? String,
              let email = representation["email"] as? String,
              let age = representation["age"] as? Int,
              let phone = representation["phone"] as? Int,
              let gender = representation["gender"] as? Bool,
              let categoryValue = representation["category"] as? String else { return nil }
        guard let category = ContactCategory(categoryValue) else { return nil }

        self.name = name
        self.email = email
        self.age = age
        self.phone = phone
        self.gender = gender
        self.category = category
    }
}
