import Combine
import Quick
import Moocher
import Capsule
import Utensils
@testable import UtensilsExtensions

final class PequenoNetworking_CombineIntegrationSpec: QuickSpec {
    override class func spec() {
        describe("PequenoNetworking+Combine") {
            var subject: PequenoNetworking!
            
            var subscribers: Set<AnyCancellable>!
            
            beforeEach {
                subject = PequenoNetworking(baseURL: "https://httpbin.org",
                                            headers: nil)
                
                subscribers = Set<AnyCancellable>()
            }
            
            describe("using JSONSerialization") {
                describe("GET request") {
                    it("completes with deserialized json") {
                        hangOn(for: .seconds(5)) { complete in
                            subject.get(endpoint: "/get",
                                        parameters: nil)
                            .sink { completion in
                                if case .failure = completion {
                                    failSpec()
                                    
                                    complete()
                                }
                            } receiveValue: { jsonResponse in
                                guard let typedJSONResponse = jsonResponse as? [String: Any] else {
                                    failSpec()

                                    return
                                }

                                expect(typedJSONResponse).toNot.beEmpty()
                                
                                complete()
                            }.store(in: &subscribers)
                        }
                    }
                }
                
                describe("DELETE request") {
                    it("completes with deserialized json") {
                        hangOn(for: .seconds(5)) { complete in
                            subject.delete(endpoint: "/delete",
                                           parameters: nil)
                            .sink { completion in
                                if case .failure = completion {
                                    failSpec()
                                    
                                    complete()
                                }
                            } receiveValue: { jsonResponse in
                                guard let typedJSONResponse = jsonResponse as? [String: Any] else {
                                    failSpec()

                                    return
                                }

                                expect(typedJSONResponse).toNot.beEmpty()
                                
                                complete()
                            }.store(in: &subscribers)
                        }
                    }
                }
                
                describe("POST request") {
                    it("completes with deserialized json") {
                        hangOn(for: .seconds(5)) { complete in
                            subject.post(endpoint: "/post",
                                         body: nil)
                            .sink { completion in
                                if case .failure = completion {
                                    failSpec()
                                    
                                    complete()
                                }
                            } receiveValue: { jsonResponse in
                                guard let typedJSONResponse = jsonResponse as? [String: Any] else {
                                    failSpec()

                                    return
                                }

                                expect(typedJSONResponse).toNot.beEmpty()
                                
                                complete()
                            }.store(in: &subscribers)
                        }
                    }
                }
                
                describe("PUT request") {
                    it("completes with deserialized json") {
                        hangOn(for: .seconds(5)) { complete in
                            subject.put(endpoint: "/put",
                                        body: nil)
                            .sink { completion in
                                if case .failure = completion {
                                    failSpec()
                                    
                                    complete()
                                }
                            } receiveValue: { jsonResponse in
                                guard let typedJSONResponse = jsonResponse as? [String: Any] else {
                                    failSpec()

                                    return
                                }

                                expect(typedJSONResponse).toNot.beEmpty()
                                
                                complete()
                            }.store(in: &subscribers)
                        }
                    }
                }
                
                describe("PATCH request") {
                    it("completes with deserialized json") {
                        hangOn(for: .seconds(5)) { complete in
                            subject.patch(endpoint: "/patch",
                                          body: nil)
                            .sink { completion in
                                if case .failure = completion {
                                    failSpec()
                                    
                                    complete()
                                }
                            } receiveValue: { jsonResponse in
                                guard let typedJSONResponse = jsonResponse as? [String: Any] else {
                                    failSpec()
                                    
                                    return
                                }

                                expect(typedJSONResponse).toNot.beEmpty()
                                
                                complete()
                            }.store(in: &subscribers)
                        }
                    }
                }
            }
            
            describe("using Codable") {
                var future: Future<HTTPBin, Error>!
                
                describe("GET request") {
                    beforeEach {
                        future = subject.get(endpoint: "/get", 
                                             parameters: nil)
                    }
                    
                    it("completes with deserialized json") {
                        hangOn(for: .seconds(5)) { complete in
                            future.sink { completion in
                                if case .failure = completion {
                                    failSpec()
                                    
                                    complete()
                                }
                            } receiveValue: { jsonResponse in
                                expect(jsonResponse.url).to.equal("https://httpbin.org/get")
                                
                                complete()
                            }.store(in: &subscribers)
                        }
                    }
                }
                
                describe("DELETE request") {
                    beforeEach {
                        future = subject.delete(endpoint: "/delete",
                                                parameters: nil)
                    }
                    
                    it("completes with deserialized json") {
                        hangOn(for: .seconds(5)) { complete in
                            future.sink { completion in
                                if case .failure = completion {
                                    failSpec()
                                    
                                    complete()
                                }
                            } receiveValue: { jsonResponse in
                                expect(jsonResponse.url).to.equal("https://httpbin.org/delete")
                                
                                complete()
                            }.store(in: &subscribers)
                        }
                    }
                }
                
                describe("POST request") {
                    beforeEach {
                        future = subject.post(endpoint: "/post",
                                              body: nil)
                    }
                    
                    it("completes with deserialized json") {
                        hangOn(for: .seconds(5)) { complete in
                            future.sink { completion in
                                if case .failure = completion {
                                    failSpec()
                                    
                                    complete()
                                }
                            } receiveValue: { jsonResponse in
                                expect(jsonResponse.url).to.equal("https://httpbin.org/post")
                                
                                complete()
                            }.store(in: &subscribers)
                        }
                    }
                }
                
                describe("PUT request") {
                    beforeEach {
                        future = subject.put(endpoint: "/put",
                                             body: nil)
                    }
                    
                    it("completes with deserialized json") {
                        hangOn(for: .seconds(5)) { complete in
                            future.sink { completion in
                                if case .failure = completion {
                                    failSpec()
                                    
                                    complete()
                                }
                            } receiveValue: { jsonResponse in
                                expect(jsonResponse.url).to.equal("https://httpbin.org/put")
                                
                                complete()
                            }.store(in: &subscribers)
                        }
                    }
                }
                
                describe("PATCH request") {
                    beforeEach {
                        future = subject.patch(endpoint: "/patch",
                                               body: nil)
                    }
                    
                    it("completes with deserialized json") {
                        hangOn(for: .seconds(5)) { complete in
                            future.sink { completion in
                                if case .failure = completion {
                                    failSpec()
                                    
                                    complete()
                                }
                            } receiveValue: { jsonResponse in
                                expect(jsonResponse.url).to.equal("https://httpbin.org/patch")
                                
                                complete()
                            }.store(in: &subscribers)
                        }
                    }
                }
            }
            
            describe("file transfers") {
                describe("downloading") {
                    it("completes with file url") {
                        hangOn(for: .seconds(5)) { complete in
                            subject.downloadFile(endpoint: "/image/jpeg",
                                                 parameters: nil,
                                                 filename: "animal.jpeg",
                                                 directory: Directory(.caches(additionalPath: "session-downloadz/")))
                            .sink { completion in
                                if case .failure = completion {
                                    failSpec()
                                    
                                    complete()
                                }
                            } receiveValue: { fileURL in
                                guard let imageData = try? Data(contentsOf: fileURL) else {
                                    failSpec()
                                    
                                    return
                                }
                                
                                expect(imageData.count).to.beGreaterThan(0)
                                
                                complete()
                            }.store(in: &subscribers)
                        }
                    }
                }
                
                describe("uploading") {
                    var testBundle: Bundle!
                    var multipartFormData: Data!
                    
                    beforeEach {
                        testBundle = Bundle(for: self)
                        
                        let fileURL = testBundle.url(forResource: "file",
                                                     withExtension: "json")!
                        
                        let fileData = try! Data(contentsOf: fileURL)

                        let boundaryUUID = UUID().uuidString
                        
                        multipartFormData = MultipartFormDataBuilder().buildMultipartFormData(data: fileData,
                                                                                              filename: "file.json",
                                                                                              boundaryUUID: boundaryUUID,
                                                                                              contentType: .octetStream)
                        let multipartFormHeader = ["Content-Type": "multipart/form-data; boundary=Boundary-\(boundaryUUID)"]
                        
                        subject = PequenoNetworking(baseURL: "https://httpbin.org",
                                                    headers: multipartFormHeader)
                    }
                    
                    describe("JSONSerialization (ol' skoo)") {
                        it("completes with deserialized json") {
                            hangOn(for: .seconds(5)) { complete in
                                subject.uploadFile(endpoint: "/post",
                                                   parameters: nil,
                                                   data: multipartFormData)
                                .sink { completion in
                                    if case .failure = completion {
                                        failSpec()
                                        
                                        complete()
                                    }
                                } receiveValue: { jsonResponse in
                                    guard let typedJSONResponse = jsonResponse as? [String: Any] else {
                                        failSpec()

                                        return
                                    }

                                    expect(typedJSONResponse).toNot.beEmpty()
                                    
                                    complete()
                                }.store(in: &subscribers)
                            }
                        }
                    }
                    
                    describe("Codable") {
                        var future: Future<HTTPBin, Error>!
                        
                        beforeEach {
                            future = subject.uploadFile(endpoint: "/post",
                                                        parameters: nil,
                                                        data: multipartFormData)
                        }
                        
                        it("completes with deserialized json") {
                            hangOn(for: .seconds(5)) { complete in
                                future.sink { completion in
                                    if case .failure = completion {
                                        failSpec()
                                        
                                        complete()
                                    }
                                } receiveValue: { jsonResponse in
                                    expect(jsonResponse.url).to.equal("https://httpbin.org/post")
                                    expect(jsonResponse.files!.file).to.contain("Flipper")
                                    
                                    complete()
                                }.store(in: &subscribers)
                            }
                        }
                    }
                }
            }
        }
    }
}
