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
import Combine
import Capsule
import Utensils

// Note: Result<Any, PequenoNetworking.Error> is used for the stubbed results due to
// warning messages about "shadowing" at the class level.

public class FakePequenoNetworkingCombine: PequenoNetworkingCombineProtocol {
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
    
    public var stubbedGetResult: Result<Any, PequenoNetworking.Error> = .success("GET")
    public var stubbedDeleteResult: Result<Any, PequenoNetworking.Error> = .success("DELETE")
    public var stubbedPostResult: Result<Any, PequenoNetworking.Error> = .success("POST")
    public var stubbedPutResult: Result<Any, PequenoNetworking.Error> = .success("PUT")
    public var stubbedPatchResult: Result<Any, PequenoNetworking.Error> = .success("PATCH")
    
    // MARK: - Codable
    
    public var stubbedCodableGetResult: Result<Any, PequenoNetworking.Error> = .success("Codable-GET")
    public var stubbedCodableDeleteResult: Result<Any, PequenoNetworking.Error> = .success("Codable-DELETE")
    public var stubbedCodablePostResult: Result<Any, PequenoNetworking.Error> = .success("Codable-POST")
    public var stubbedCodablePutResult: Result<Any, PequenoNetworking.Error> = .success("Codable-PUT")
    public var stubbedCodablePatchResult: Result<Any, PequenoNetworking.Error> = .success("Codable-PATCH")
    
    // MARK: - <PequenoNetworkingCombineProtocol>
    
    public func get(endpoint: String, 
                    parameters: [String: String]?) -> Future<Any, PequenoNetworking.Error> {
        capturedGetEndpoint = endpoint
        capturedGetParameters = parameters
        
        let future = Future { [weak self] promise in
            guard let self = self else { return }
            
            promise(self.stubbedGetResult)
        }
        
        return future
    }
    
    public func delete(endpoint: String, 
                       parameters: [String: String]?) -> Future<Any, PequenoNetworking.Error> {
        capturedDeleteEndpoint = endpoint
        capturedDeleteParameters = parameters
        
        let future = Future { [weak self] promise in
            guard let self = self else { return }
            
            promise(self.stubbedDeleteResult)
        }
        
        return future
    }
    
    public func post(endpoint: String, 
                     body: [String: Any]?) -> Future<Any, PequenoNetworking.Error> {
        capturedPostEndpoint = endpoint
        capturedPostBody = body
        
        let future = Future { [weak self] promise in
            guard let self = self else { return }
            
            promise(self.stubbedPostResult)
        }
        
        return future
    }
    
    public func put(endpoint: String, 
                    body: [String: Any]?) -> Future<Any, PequenoNetworking.Error> {
        capturedPutEndpoint = endpoint
        capturedPutBody = body
        
        let future = Future { [weak self] promise in
            guard let self = self else { return }
            
            promise(self.stubbedPutResult)
        }
        
        return future
    }
    
    public func patch(endpoint: String, 
                      body: [String: Any]?) -> Future<Any, PequenoNetworking.Error> {
        capturedPatchEndpoint = endpoint
        capturedPatchBody = body
        
        let future = Future { [weak self] promise in
            guard let self = self else { return }
            
            promise(self.stubbedPatchResult)
        }
        
        return future
    }
    
    public func get<T: Codable>(endpoint: String,
                                parameters: [String: String]?) -> Future<T, PequenoNetworking.Error> {
        capturedCodableGetEndpoint = endpoint
        capturedCodableGetParameters = parameters
        
        let future: Future<T, PequenoNetworking.Error> = generateTypedFuture(result: stubbedCodableGetResult)
        
        return future
    }
    
    public func delete<T: Codable>(endpoint: String,
                                   parameters: [String: String]?) -> Future<T, PequenoNetworking.Error> {
        capturedCodableDeleteEndpoint = endpoint
        capturedCodableDeleteParameters = parameters
        
        let future: Future<T, PequenoNetworking.Error> = generateTypedFuture(result: stubbedCodableDeleteResult)
        
        return future
    }
    
    public func post<T: Codable>(endpoint: String,
                                 body: [String: Any]?) -> Future<T, PequenoNetworking.Error> {
        capturedCodablePostEndpoint = endpoint
        capturedCodablePostBody = body
        
        let future: Future<T, PequenoNetworking.Error> = generateTypedFuture(result: stubbedCodablePostResult)
        
        return future
    }
    
    public func put<T: Codable>(endpoint: String,
                                body: [String: Any]?) -> Future<T, PequenoNetworking.Error> {
        capturedCodablePutEndpoint = endpoint
        capturedCodablePutBody = body
        
        let future: Future<T, PequenoNetworking.Error> = generateTypedFuture(result: stubbedCodablePutResult)
        
        return future
    }
    
    public func patch<T: Codable>(endpoint: String,
                                  body: [String: Any]?) -> Future<T, PequenoNetworking.Error> {
        capturedCodablePatchEndpoint = endpoint
        capturedCodablePatchBody = body
        
        let future: Future<T, PequenoNetworking.Error> = generateTypedFuture(result: stubbedCodablePatchResult)
        
        return future
    }
    
    // MARK: - Private properties
    
    private func generateTypedFuture<T: Codable>(result: Result<Any, PequenoNetworking.Error>) -> Future<T, PequenoNetworking.Error> {
        let future = Future<T, PequenoNetworking.Error> { promise in
            let typedResult = result.map { value in
                guard let properlyTypedValue = value as? T else {
                    preconditionFailure("The stubbed codable result success value is not the correct type")
                }
                
                return properlyTypedValue
            }
            
            promise(typedResult)
        }
        
        return future
    }
}
