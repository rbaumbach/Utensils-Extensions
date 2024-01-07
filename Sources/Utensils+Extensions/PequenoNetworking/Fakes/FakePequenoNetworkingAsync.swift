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
import Capsule
import Utensils

// Note: Any? is used for the stubbed values due to warning messages about "shadowing" at the
// class level. As a consumer you can cast to T.

public class FakePequenoNetworkingAsync: PequenoNetworkingAsyncProtocol {
    // MARK: - Captured properties
    
    // MARK: - JSONSerialization (ol' skoo)
    
    public var capturedGetEndpoint: String?
    public var capturedGetParameters: [String: String]?
    
    public var capturedDeleteEndpoint: String?
    public var capturedDeleteParameters: [String: String]?
    
    public var capturedPostEndpoint: String?
    public var capturedPostBody: [String: Any]?
    
    public var capturedPutEndpoint: String?
    public var capturedPutBody: [String: Any]?
    
    public var capturedPatchEndpoint: String?
    public var capturedPatchBody: [String: Any]?
    
    // MARK: - Codable
    
    public var capturedCodableGetEndpoint: String?
    public var capturedCodableGetParameters: [String: String]?
    
    public var capturedCodableDeleteEndpoint: String?
    public var capturedCodableDeleteParameters: [String: String]?
    
    public var capturedCodablePostEndpoint: String?
    public var capturedCodablePostBody: [String: Any]?
    
    public var capturedCodablePutEndpoint: String?
    public var capturedCodablePutBody: [String: Any]?
    
    public var capturedCodablePatchEndpoint: String?
    public var capturedCodablePatchBody: [String: Any]?
    
    // MARK: - Stubbed properties
    
    // MARK: - JSONSerialization (ol' skoo)
    
    public var stubbedGet = "get"
    public var stubbedDelete = "delete"
    public var stubbedPost = "post"
    public var stubbedPut = "put"
    public var stubbedPatch = "patch"
    
    // MARK: - Codable
    
    public var stubbedCodableGet: Any = "get"
    public var stubbedCodableDelete: Any = "delete"
    public var stubbedCodablePost: Any = "post"
    public var stubbedCodablePut: Any = "put"
    public var stubbedCodablePatch: Any = "patch"
    
    // MARK: - Public properties
    
    // MARK: - JSONSerialization (ol' skoo)
    
    public var shouldThrowGetError = false
    public var shouldThrowDeleteError = false
    public var shouldThrowPostError = false
    public var shouldThrowPutError = false
    public var shouldThrowPatchError = false
    
    // MARK: - Codable
    
    public var shouldThrowCodableGetError = false
    public var shouldThrowCodableDeleteError = false
    public var shouldThrowCodablePostError = false
    public var shouldThrowCodablePutError = false
    public var shouldThrowCodablePatchError = false
    
    // MARK: - Init methods
    
    public init() { }
    
    // MARK: - <PequenoNetworkingAsyncProtocol>
    
    public func get(endpoint: String, 
                    parameters: [String: String]?) async throws -> Any {
        capturedGetEndpoint = endpoint
        capturedGetParameters = parameters
        
        if shouldThrowGetError {
            throw FakeGenericError.whoCares
        }
        
        return stubbedGet
    }
    
    public func delete(endpoint: String, 
                       parameters: [String: String]?) async throws -> Any {
        capturedDeleteEndpoint = endpoint
        capturedDeleteParameters = parameters
        
        if shouldThrowDeleteError {
            throw FakeGenericError.whoCares
        }
        
        return stubbedDelete
    }
    
    public func post(endpoint: String, 
                     body: [String: Any]?) async throws -> Any {
        capturedPostEndpoint = endpoint
        capturedPostBody = body
        
        if shouldThrowPostError {
            throw FakeGenericError.whoCares
        }
        
        return stubbedPost
    }
    
    public func put(endpoint: String, 
                    body: [String: Any]?) async throws -> Any {
        capturedPutEndpoint = endpoint
        capturedPutBody = body
        
        if shouldThrowPutError {
            throw FakeGenericError.whoCares
        }
        
        return stubbedPut
    }
    
    public func patch(endpoint: String, 
                      body: [String: Any]?) async throws -> Any {
        capturedPatchEndpoint = endpoint
        capturedPatchBody = body
        
        if shouldThrowPatchError {
            throw FakeGenericError.whoCares
        }
        
        return stubbedPatch
    }
    
    public func get<T: Codable>(endpoint: String,
                                parameters: [String: String]?) async throws -> T {
        if shouldThrowCodableGetError {
            throw FakeGenericError.whoCares
        }
        
        guard let typedStubbedValue = stubbedCodableGet as? T else {
            preconditionFailure("The stubbed codable get value is not the correct type")
        }
        
        return typedStubbedValue
    }
    
    public func delete<T: Codable>(endpoint: String,
                                   parameters: [String: String]?) async throws -> T {
        if shouldThrowCodableDeleteError {
            throw FakeGenericError.whoCares
        }
        
        guard let typedStubbedValue = stubbedCodableDelete as? T else {
            preconditionFailure("The stubbed codable delete value is not the correct type")
        }
        
        return typedStubbedValue
    }
    
    public func post<T: Codable>(endpoint: String,
                                 body: [String: Any]?) async throws -> T {
        if shouldThrowCodablePostError {
            throw FakeGenericError.whoCares
        }
        
        guard let typedStubbedValue = stubbedCodablePost as? T else {
            preconditionFailure("The stubbed codable post value is not the correct type")
        }
        
        return typedStubbedValue
    }
    
    public func put<T: Codable>(endpoint: String, 
                                body: [String: Any]?) async throws -> T {
        if shouldThrowCodablePutError {
            throw FakeGenericError.whoCares
        }
        
        guard let typedStubbedValue = stubbedCodablePut as? T else {
            preconditionFailure("The stubbed codable get value is not the correct type")
        }
        
        return typedStubbedValue
    }
    
    public func patch<T: Codable>(endpoint: String,
                                  body: [String: Any]?) async throws -> T {
        if shouldThrowCodablePatchError {
            throw FakeGenericError.whoCares
        }
        
        guard let typedStubbedValue = stubbedCodablePatch as? T else {
            preconditionFailure("The stubbed codable get value is not the correct type")
        }
        
        return typedStubbedValue
    }
}
