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
             parameters: [String: String]?) -> Future<Any, Error>
    
    func delete(endpoint: String,
                parameters: [String: String]?) -> Future<Any, Error>
    
    func post(endpoint: String,
              body: [String: Any]?) -> Future<Any, Error>
    
    func put(endpoint: String,
             body: [String: Any]?) -> Future<Any, Error>
    
    func patch(endpoint: String,
               body: [String: Any]?) -> Future<Any, Error>
    
    // MARK: - Codable
    
    func get<T: Codable>(endpoint: String,
                         parameters: [String: String]?) -> Future<T, Error>
    
    func delete<T: Codable>(endpoint: String,
                            parameters: [String: String]?) -> Future<T, Error>
    
    func post<T: Codable>(endpoint: String,
                          body: [String: Any]?) -> Future<T, Error>
    
    func put<T: Codable>(endpoint: String,
                         body: [String: Any]?) -> Future<T, Error>
    
    func patch<T: Codable>(endpoint: String,
                           body: [String: Any]?) -> Future<T, Error>
    
    // MARK: - File transfers
    
    func downloadFile(endpoint: String,
                      parameters: [String: String]?,
                      filename: String,
                      directory: Directory) -> Future<URL, Error>
    
    func uploadFile(endpoint: String,
                    parameters: [String: String]?,
                    data: Data) -> Future<Any, Error>
    
    func uploadFile<T: Codable>(endpoint: String,
                                parameters: [String: String]?,
                                data: Data) -> Future<T, Error> 
}

extension PequenoNetworking: PequenoNetworkingCombineProtocol {
    public func get(endpoint: String,
                    parameters: [String: String]?) -> Future<Any, Error> {
        return Future { [weak self] promise in
            self?.get(endpoint: endpoint,
                      parameters: parameters,
                      completionHandler: promise)
        }
    }
    
    public func delete(endpoint: String,
                       parameters: [String: String]?) -> Future<Any, Error> {
        return Future { [weak self] promise in
            self?.delete(endpoint: endpoint,
                         parameters: parameters,
                         completionHandler: promise)
        }
    }
    
    public func post(endpoint: String,
                     body: [String: Any]?) -> Future<Any, Error> {
        return Future { [weak self] promise in
            self?.post(endpoint: endpoint,
                       body: body,
                       completionHandler: promise)
        }
    }
    
    public func put(endpoint: String,
                    body: [String: Any]?) -> Future<Any, Error> {
        return Future { [weak self] promise in
            self?.put(endpoint: endpoint,
                      body: body,
                      completionHandler: promise)
        }
    }
    
    public func patch(endpoint: String,
                      body: [String: Any]?) -> Future<Any, Error> {
        return Future { [weak self] promise in
            self?.patch(endpoint: endpoint,
                        body: body,
                        completionHandler: promise)
        }
    }
    
    public func get<T: Codable>(endpoint: String,
                                parameters: [String: String]?) -> Future<T, Error> {
        return Future { [weak self] promise in
            self?.get(endpoint: endpoint,
                      parameters: parameters,
                      completionHandler: promise)
        }
    }
    
    public func delete<T: Codable>(endpoint: String,
                                   parameters: [String: String]?) -> Future<T, Error> {
        return Future { [weak self] promise in
            self?.delete(endpoint: endpoint,
                         parameters: parameters,
                         completionHandler: promise)
        }
    }
    
    public func post<T: Codable>(endpoint: String,
                                 body: [String: Any]?) -> Future<T, Error> {
        return Future { [weak self] promise in
            self?.post(endpoint: endpoint,
                       body: body,
                       completionHandler: promise)
        }
    }
    
    public func put<T: Codable>(endpoint: String,
                                body: [String: Any]?) -> Future<T, Error> {
        return Future { [weak self] promise in
            self?.put(endpoint: endpoint,
                      body: body,
                      completionHandler: promise)
        }
    }
    
    public func patch<T: Codable>(endpoint: String,
                                  body: [String: Any]?) -> Future<T, Error> {
        return Future { [weak self] promise in
            self?.patch(endpoint: endpoint,
                        body: body,
                        completionHandler: promise)
        }
    }
    
    public func downloadFile(endpoint: String,
                             parameters: [String: String]?,
                             filename: String,
                             directory: Directory) -> Future<URL, Error> {
        return Future { [weak self] promise in
            self?.downloadFile(endpoint: endpoint,
                               parameters: parameters,
                               filename: filename,
                               directory: directory,
                               completionHandler: promise)
        }
    }
    
    public func uploadFile(endpoint: String,
                           parameters: [String: String]?,
                           data: Data) -> Future<Any, Error> {
        return Future { [weak self] promise in
            self?.uploadFile(endpoint: endpoint,
                             parameters: parameters,
                             data: data,
                             completionHandler: promise)
        }
    }
    
    public func uploadFile<T: Codable>(endpoint: String,
                                       parameters: [String: String]?,
                                       data: Data) -> Future<T, Error> {
        return Future { [weak self] promise in
            self?.uploadFile(endpoint: endpoint,
                             parameters: parameters,
                             data: data,
                             completionHandler: promise)
        }
    }
}
