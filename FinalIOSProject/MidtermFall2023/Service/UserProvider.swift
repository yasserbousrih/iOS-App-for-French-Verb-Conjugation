import Foundation

class UserProvider {
    static var allUsers: [User] = [
        User(username: "admin", password: "admin123", firstname: "Admin", lastname: "User"),
        User(username: "guest", password: "strongPassword2", firstname: "Guest", lastname: "User"),
        User(username: "yasser", password: "strongPassword3", firstname: "Yasser", lastname: "Bousrih")
    ]
    
    enum UserProviderError: Error {
        case usernameExists
        case userNotFound
    }
    
    // Function to find a user by username
    static func findUser(username: String) -> User? {
        return allUsers.first { $0.username == username.lowercased() }
    }
    
    // Function to add a new user
    static func addUser(username: String, password: String, firstName: String, lastName: String) throws {
        // Check if the username is already taken
        guard findUser(username: username) == nil else {
            throw UserProviderError.usernameExists
        }
        
        // Add the new user
        let newUser = User(username: username, password: password, firstname: firstName, lastname: lastName)
        allUsers.append(newUser)
        print("User added: \(newUser.username)")
    }
    
    // Function to remove a user
    static func removeUser(username: String) throws {
        // Find the user index
        if let index = allUsers.firstIndex(where: { $0.username == username.lowercased() }) {
            // Remove the user
            let removedUser = allUsers.remove(at: index)
            print("User removed: \(removedUser.username)")
        } else {
            throw UserProviderError.userNotFound
        }
    }
}
