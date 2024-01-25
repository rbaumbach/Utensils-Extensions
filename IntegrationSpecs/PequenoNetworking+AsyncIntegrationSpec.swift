import Quick
import Moocher
import Capsule
import Utensils
@testable import UtensilsExtensions

final class PequenoNetworking_AsyncIntegrationSpec: AsyncSpec {
    override class func spec() {
        describe("PequenoNetworking+Async") {
            var subject: PequenoNetworking!
            
            beforeEach {
                subject = PequenoNetworking(baseURL: "https://httpbin.org",
                                            headers: nil)
            }
            
            describe("using JSONSerialization") {
                var jsonResponse: Any!
                
                describe("GET request") {
                    beforeEach {
                        jsonResponse = try await subject.get(endpoint: "/get",
                                                             parameters: nil)
                    }
                    
                    it("completes with deserialized json") {
                        guard let typedJSONResponse = jsonResponse as? [String: Any] else {
                            failSpec()
                            
                            return
                        }
                        
                        expect(typedJSONResponse).toNot.beEmpty()
                    }
                }
                
                describe("DELETE request") {
                    beforeEach {
                        jsonResponse = try await subject.delete(endpoint: "/delete",
                                                                parameters: nil)
                    }
                    
                    it("completes with deserialized json") {
                        guard let typedJSONResponse = jsonResponse as? [String: Any] else {
                            failSpec()
                            
                            return
                        }
                        
                        expect(typedJSONResponse).toNot.beEmpty()
                    }
                }
                
                describe("POST request") {
                    beforeEach {
                        jsonResponse = try await subject.post(endpoint: "/post",
                                                              body: nil)
                    }
                    
                    it("completes with deserialized json") {
                        guard let typedJSONResponse = jsonResponse as? [String: Any] else {
                            failSpec()
                            
                            return
                        }
                        
                        expect(typedJSONResponse).toNot.beEmpty()
                    }
                }
                
                describe("PUT request") {
                    beforeEach {
                        jsonResponse = try await subject.put(endpoint: "/put",
                                                             body: nil)
                    }
                    
                    it("completes with deserialized json") {
                        guard let typedJSONResponse = jsonResponse as? [String: Any] else {
                            failSpec()
                            
                            return
                        }
                        
                        expect(typedJSONResponse).toNot.beEmpty()
                    }
                }
                
                describe("PATCH request") {
                    beforeEach {
                        jsonResponse = try await subject.patch(endpoint: "/patch",
                                                               body: nil)
                    }
                    
                    it("completes with deserialized json") {
                        guard let typedJSONResponse = jsonResponse as? [String: Any] else {
                            failSpec()
                            
                            return
                        }
                        
                        expect(typedJSONResponse).toNot.beEmpty()
                    }
                }
            }
            
            describe("using Codable") {
                var jsonResponse: HTTPBin!
                
                beforeEach {
                    subject = PequenoNetworking(baseURL: "https://httpbin.org",
                                                headers: nil)
                }
                
                describe("GET request") {
                    beforeEach {
                        jsonResponse = try await subject.get(endpoint: "/get",
                                                             parameters: nil)
                    }
                    
                    it("completes with deserialized json") {
                        expect(jsonResponse.url).to.equal("https://httpbin.org/get")
                    }
                }
                
                describe("DELETE request") {
                    beforeEach {
                        jsonResponse = try await subject.delete(endpoint: "/delete",
                                                                parameters: nil)
                    }
                    
                    it("completes with deserialized json") {
                        expect(jsonResponse.url).to.equal("https://httpbin.org/delete")
                    }
                }
                
                describe("POST request") {
                    beforeEach {
                        jsonResponse = try await subject.post(endpoint: "/post",
                                                              body: nil)
                    }
                    
                    it("completes with deserialized json") {
                        expect(jsonResponse.url).to.equal("https://httpbin.org/post")
                    }
                }
                
                describe("PUT request") {
                    beforeEach {
                        jsonResponse = try await subject.put(endpoint: "/put",
                                                             body: nil)
                    }
                    
                    it("completes with deserialized json") {
                        expect(jsonResponse.url).to.equal("https://httpbin.org/put")
                    }
                }
                
                describe("PATCH request") {
                    beforeEach {
                        jsonResponse = try await subject.patch(endpoint: "/patch",
                                                               body: nil)
                    }
                    
                    it("completes with deserialized json") {
                        expect(jsonResponse.url).to.equal("https://httpbin.org/patch")
                    }
                }
            }
            
            describe("file transfers") {
                describe("downloading") {
                    var fileURL: URL!
                    
                    beforeEach {
                        fileURL = try await subject.downloadFile(endpoint: "/image/jpeg",
                                                                 parameters: nil,
                                                                 filename: "animal.jpeg",
                                                                 directory: Directory(.caches(additionalPath: "session-downloadz/")))
                    }
                    
                    it("completes with file url") {
                        guard let imageData = try? Data(contentsOf: fileURL) else {
                            failSpec()
                            
                            return
                        }
                        
                        expect(imageData.count).to.beGreaterThan(0)
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
                        var jsonResponse: Any!
                        
                        beforeEach {
                            jsonResponse = try await subject.uploadFile(endpoint: "/post",
                                                                        parameters: nil,
                                                                        data: multipartFormData)
                        }
                        
                        it("completes with deserialized json") {
                            guard let jsonResponse = jsonResponse as? [String: Any] else {
                                failSpec()
                                
                                return
                            }
                            
                            expect(jsonResponse).toNot.beEmpty()
                        }
                    }
                    
                    describe("Codable") {
                        var jsonResponse: HTTPBin!
                        
                        beforeEach {
                            jsonResponse = try await subject.uploadFile(endpoint: "/post",
                                                                        parameters: nil,
                                                                        data: multipartFormData)
                        }
                        
                        it("completes with deserialized json") {
                            expect(jsonResponse.url).to.equal("https://httpbin.org/post")
                            expect(jsonResponse.files!.file).to.contain("Flipper")
                        }
                    }
                }
            }
        }
    }
}
