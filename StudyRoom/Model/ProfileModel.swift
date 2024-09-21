/**
 Object for a user profile
 */

import Foundation

struct ProfileModel: Identifiable {
    
    let id = UUID()
    var username: String
    var notifications = false
    var photo = Photo.dog
    var birthday = Date()
    
    static let `default` = ProfileModel(username: "max")
    
    enum Photo: String, CaseIterable, Identifiable {
        case bear = "🐻"
        case rabbit = "🐰"
        case dog = "🐶"
        case cat = "🐱"
        
        var id: String {rawValue}
    }
}
