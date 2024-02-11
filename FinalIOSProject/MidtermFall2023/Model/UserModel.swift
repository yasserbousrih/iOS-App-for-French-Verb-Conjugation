import Foundation
import CryptoKit

class User {
    
    var username: String
    var firstname: String?
    var lastname: String?
    private(set) var hashedPassword: String
    
    init(username: String, password: String, firstname: String? = nil, lastname: String? = nil) {
        self.username = username.lowercased()
        self.firstname = firstname
        self.lastname = lastname
        self.hashedPassword = "" // Initialize with a default value
        self.hashedPassword = hashPassword(password) // Call the method after all properties are initialized
    }

    private func hashPassword(_ password: String) -> String {
        let hashed = SHA256.hash(data: Data(password.utf8))
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
    
    func getPasswordHash() -> String {
        return hashedPassword
    }
    
    func validatePassword(_ inputPassword: String) -> Bool {
        let inputHash = hashPassword(inputPassword)
        return inputHash == hashedPassword
    }
}
