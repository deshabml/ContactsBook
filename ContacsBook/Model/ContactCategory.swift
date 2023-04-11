//
//  ContactCategory.swift
//  ContacsBook
//
//  Created by Лаборатория on 05.04.2023.
//

enum ContactCategory: String {
    case friends = "Друзья"
    case coworkers = "Коллеги"
    case classmates = "Одноклассники"
    case family = "Семья"
}

extension ContactCategory {
    init?(_ value: String) {
        switch value {
        case "Друзья": self = .friends
        case "Коллеги": self = .coworkers
        case "Одноклассники": self = .classmates
        case "Семья": self = .family
        default: return nil
        }
    }
}
