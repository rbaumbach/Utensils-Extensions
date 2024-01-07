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
import Utensils

public protocol PequenoNetworkingCombineProtocol {
    // MARK: - JSONSerialization (ol' skoo)
    
    func get(endpoint: String,
             parameters: [String: String]?) -> Future<Any, PequenoNetworking.Error>
    
    func delete(endpoint: String,
                parameters: [String: String]?) -> Future<Any, PequenoNetworking.Error>
    
    func post(endpoint: String,
              body: [String: Any]?) -> Future<Any, PequenoNetworking.Error>
    
    func put(endpoint: String,
             body: [String: Any]?) -> Future<Any, PequenoNetworking.Error>
    
    func patch(endpoint: String,
               body: [String: Any]?) -> Future<Any, PequenoNetworking.Error>
    
    // MARK: - Codable
    
    func get<T: Codable>(endpoint: String,
                         parameters: [String: String]?) -> Future<T, PequenoNetworking.Error>
    
    func delete<T: Codable>(endpoint: String,
                            parameters: [String: String]?) -> Future<T, PequenoNetworking.Error>
    
    func post<T: Codable>(endpoint: String,
                          body: [String: Any]?) -> Future<T, PequenoNetworking.Error>
    
    func put<T: Codable>(endpoint: String,
                         body: [String: Any]?) -> Future<T, PequenoNetworking.Error>
    
    func patch<T: Codable>(endpoint: String,
                           body: [String: Any]?) -> Future<T, PequenoNetworking.Error>
}

extension PequenoNetworking: PequenoNetworkingCombineProtocol {
    public func get(endpoint: String,
                    parameters: [String: String]?) -> Future<Any, PequenoNetworking.Error> {
        return Future { [weak self] promise in
            self?.get(endpoint: endpoint,
                      parameters: parameters,
                      completionHandler: promise)
        }
    }
    
    public func delete(endpoint: String,
                       parameters: [String: String]?) -> Future<Any, PequenoNetworking.Error> {
        return Future { [weak self] promise in
            self?.delete(endpoint: endpoint,
                         parameters: parameters,
                         completionHandler: promise)
        }
    }
    
    public func post(endpoint: String, 
                     body: [String: Any]?) -> Future<Any, PequenoNetworking.Error> {
        return Future { [weak self] promise in
            self?.post(endpoint: endpoint,
                       body: body,
                       completionHandler: promise)
        }
    }
    
    public func put(endpoint: String,
                    body: [String: Any]?) -> Future<Any, PequenoNetworking.Error> {
        return Future { [weak self] promise in
            self?.put(endpoint: endpoint,
                      body: body,
                      completionHandler: promise)
        }
    }
    
    public func patch(endpoint: String,
                      body: [String: Any]?) -> Future<Any, PequenoNetworking.Error> {
        return Future { [weak self] promise in
            self?.patch(endpoint: endpoint,
                        body: body,
                        completionHandler: promise)
        }
    }
    
    public func get<T: Codable>(endpoint: String, 
                                parameters: [String: String]?) -> Future<T, PequenoNetworking.Error> {
        return Future { [weak self] promise in
            self?.get(endpoint: endpoint,
                      parameters: parameters,
                      completionHandler: promise)
        }
    }
    
    public func delete<T: Codable>(endpoint: String,
                                   parameters: [String: String]?) -> Future<T, PequenoNetworking.Error> {
        return Future { [weak self] promise in
            self?.delete(endpoint: endpoint,
                         parameters: parameters,
                         completionHandler: promise)
        }
    }
    
    public func post<T: Codable>(endpoint: String,
                                 body: [String: Any]?) -> Future<T, PequenoNetworking.Error> {
        return Future { [weak self] promise in
            self?.post(endpoint: endpoint,
                       body: body,
                       completionHandler: promise)
        }
    }
    
    public func put<T: Codable>(endpoint: String,
                                body: [String: Any]?) -> Future<T, PequenoNetworking.Error> {
        return Future { [weak self] promise in
            self?.put(endpoint: endpoint,
                      body: body,
                      completionHandler: promise)
        }
    }
    
    public func patch<T: Codable>(endpoint: String,
                                  body: [String: Any]?) -> Future<T, PequenoNetworking.Error> {
        return Future { [weak self] promise in
            self?.patch(endpoint: endpoint,
                        body: body,
                        completionHandler: promise)
        }
    }
}

// experiments in hacking futures for combine

public class FakeCancellable: Cancellable {
    // MARK: - Captured properties
    
    public var didCallCancel = false
    
    // MARK: - <Cancellable>
    
    public func cancel() {
        didCallCancel = true
    }
}

public protocol FutureProtocol {
    associatedtype Output
    associatedtype Failure: Error
    
    func sink(receiveCompletion: @escaping ((Subscribers.Completion<Self.Failure>) -> Void),
              receiveValue: @escaping ((Self.Output) -> Void)) -> AnyCancellable
}

extension Future: FutureProtocol { }

// Future is a class that extends the protocol Publisher
// Publisher is a protocol that has a protocol extension for the sink() method
