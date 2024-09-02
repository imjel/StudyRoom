/**
 Object for a user profile
 */

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = false
    var photo = Photo.dog
    var birthday = Date()
    
    static let `default` = Profile(username: "max")
    
    enum Photo: String, CaseIterable, Identifiable {
        case bear = "🐻"
        case rabbit = "🐰"
        case dog = "🐶"
        case cat = "🐱"
        
        var id: String {rawValue}
    }
}
