//MIT License
//
//Copyright (c) 2020-2024 Ryan Baumbach <github@ryan.codes>
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import Foundation
import Utensils

public extension PequenoNetworking {
    // MARK: - Public methods
    
    func get(endpoint: String,
             parameters: [String: String]?) async throws -> Any {
        return try await withCheckedThrowingContinuation { continuation in
            get(endpoint: endpoint,
                parameters: parameters) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    func delete(endpoint: String,
                parameters: [String: String]?) async throws -> Any {
        return try await withCheckedThrowingContinuation { continuation in
            delete(endpoint: endpoint,
                   parameters: parameters) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    func post(endpoint: String,
              body: [String: Any]?) async throws -> Any {
        return try await withCheckedThrowingContinuation { continuation in
            post(endpoint: endpoint,
                 body: body) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    func put(endpoint: String,
             body: [String: Any]?) async throws -> Any {
        return try await withCheckedThrowingContinuation { continuation in
            put(endpoint: endpoint, body: body) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    func patch(endpoint: String,
               body: [String: Any]?) async throws -> Any {
        return try await withCheckedThrowingContinuation { continuation in
            patch(endpoint: endpoint,
                  body: body) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    func get<T: Codable>(endpoint: String,
                         parameters: [String: String]?) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            get(endpoint: endpoint, parameters: parameters) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    func delete<T: Codable>(endpoint: String,
                            parameters: [String: String]?) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            delete(endpoint: endpoint,
                   parameters: parameters) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    func post<T: Codable>(endpoint: String,
                          body: [String: Any]?) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            post(endpoint: endpoint,
                 body: body) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    func put<T: Codable>(endpoint: String,
                         body: [String: Any]?) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            put(endpoint: endpoint,
                body: body) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    func patch<T: Codable>(endpoint: String,
                           body: [String: Any]?) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            patch(endpoint: endpoint, body: body) { result in
                continuation.resume(with: result)
            }
        }
    }
}
