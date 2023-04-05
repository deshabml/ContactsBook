//
//  DataService.swift
//  ContacsBook
//
//  Created by Лаборатория on 05.04.2023.
//

import Foundation

class DataService {

    static let shared = DataService()

    private let userDefaults = UserDefaults.standard

    let contactsKey = "Contacts"

    var firstTimeKey = "FirstTime"

    let userNameKey = "UserName"

    var userName: String? {
        let name = userDefaults.string(forKey: userNameKey)
        return name
    }

    private init() { }

    func saveUserName(_ name: String, completion: () -> ()) {
        userDefaults.set(name, forKey: userNameKey)
        completion()
    }

    func saveContact(_ contact: Contact, completion: () -> ()) {
        var contacts = userDefaults.array(forKey: contactsKey) ?? []
        contacts.append(contact.representation)
        userDefaults.set(contacts, forKey: contactsKey)
        completion()
    }

    func getContacts() -> [Contact] {
        let contactRepres = userDefaults.array(forKey: contactsKey) ?? []
        var contacts = [Contact]()
        contactRepres.forEach { anyRepres in
            guard let repres = anyRepres as? [String: Any] else { return }
            guard let contact = Contact(repres) else { return }
            contacts.append(contact)
        }
        return contacts
    }

    func editContact(contactOld: Contact, contactNew: Contact) {
        let contactsIn = getContacts()
        var contacts = userDefaults.array(forKey: contactsKey) ?? []
        let editIndex = contactsIn.firstIndex { cont in
            contactOld == cont
        }
        guard let editIndex else { return }
        contacts[editIndex] = contactNew.representation
        userDefaults.set(contacts, forKey: contactsKey)
    }

    func deleteContact(contact: Contact) {
        let contactsIn = getContacts()
        var contacts = userDefaults.array(forKey: contactsKey) ?? []
        let deletedIndex = contactsIn.firstIndex { cont in
            contact == cont
        }
        guard let deletedIndex else { return }
        contacts.remove(at: deletedIndex)
        userDefaults.set(contacts, forKey: contactsKey)
    }

}
