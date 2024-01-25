import Foundation

struct HTTPBin: Codable {
    let files: File?
    let url: String
}

struct File: Codable {
    let file: String?
}
