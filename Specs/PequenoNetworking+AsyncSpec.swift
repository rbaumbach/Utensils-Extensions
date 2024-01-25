import Quick
import Moocher
import Capsule
import Utensils
@testable import UtensilsExtensions

final class PequenoNetworking_AsyncSpec: AsyncSpec {
    override class func spec() {
        describe("PequenoNetworking+Async") {
            var subject: PequenoNetworking!
            
            var fakeClassicNetworkingEngine: FakeClassicNetworkingEngine!
            var fakeNetworkingEngine: FakeNetworkingEngine!

            beforeEach {
                fakeClassicNetworkingEngine = FakeClassicNetworkingEngine()
                fakeClassicNetworkingEngine.shouldExecuteCompletionHandlersImmediately = true
                
                fakeNetworkingEngine = FakeNetworkingEngine()
                fakeNetworkingEngine.shouldExecuteCompletionHandlersImmediately = true
                
                subject = PequenoNetworking(baseURL: "https://ghost.busters",
                                            headers: ["city": "new-york"],
                                            classicNetworkingEngine: fakeClassicNetworkingEngine,
                                            networkingEngine: fakeNetworkingEngine)
            }
            
            describe("JSONSerialization (ol' skoo)") {
                var actualResult: Any!
                
                describe("GET") {
                    it("returns the proper result") {
                        actualResult = try await subject.get(endpoint: "/get",
                                                             parameters: ["ghost": "slimer"])
                        
                        let typedResult = actualResult as! String
                        
                        expect(typedResult).to.equal("Éxito")
                        
                        expect(fakeClassicNetworkingEngine.capturedGetEndpoint).to.equal("/get")
                        expect(fakeClassicNetworkingEngine.capturedGetBaseURL).to.equal("https://ghost.busters")
                        expect(fakeClassicNetworkingEngine.capturedGetHeaders).to.equal(["city": "new-york"])
                        expect(fakeClassicNetworkingEngine.capturedGetParameters).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("DELETE") {
                    it("returns the proper result") {
                        actualResult = try await subject.delete(endpoint: "/delete",
                                                                parameters: ["ghost": "slimer"])
                        
                        let typedResult = actualResult as! String
                        
                        expect(typedResult).to.equal("Éxito")
                        
                        expect(fakeClassicNetworkingEngine.capturedDeleteEndpoint).to.equal("/delete")
                        expect(fakeClassicNetworkingEngine.capturedDeleteBaseURL).to.equal("https://ghost.busters")
                        expect(fakeClassicNetworkingEngine.capturedDeleteHeaders).to.equal(["city": "new-york"])
                        expect(fakeClassicNetworkingEngine.capturedDeleteParameters).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("POST") {
                    it("returns the proper result") {
                        actualResult = try await subject.post(endpoint: "/post",
                                                              body: ["ghost": "slimer"])
                        
                        let typedResult = actualResult as! String
                        
                        expect(typedResult).to.equal("Éxito")
                        
                        expect(fakeClassicNetworkingEngine.capturedPostEndpoint).to.equal("/post")
                        expect(fakeClassicNetworkingEngine.capturedPostBaseURL).to.equal("https://ghost.busters")
                        expect(fakeClassicNetworkingEngine.capturedPostHeaders).to.equal(["city": "new-york"])
                        
                        let typedBody = fakeClassicNetworkingEngine.capturedPostBody as! [String: String]
                       
                        expect(typedBody).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("PUT") {
                    it("returns the proper result") {
                        actualResult = try await subject.put(endpoint: "/put",
                                                             body: ["ghost": "slimer"])
                        
                        let typedResult = actualResult as! String
                        
                        expect(typedResult).to.equal("Éxito")
                        
                        expect(fakeClassicNetworkingEngine.capturedPutEndpoint).to.equal("/put")
                        expect(fakeClassicNetworkingEngine.capturedPutBaseURL).to.equal("https://ghost.busters")
                        expect(fakeClassicNetworkingEngine.capturedPutHeaders).to.equal(["city": "new-york"])
                        
                        let typedBody = fakeClassicNetworkingEngine.capturedPutBody as! [String: String]
                       
                        expect(typedBody).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("PATCH") {
                    it("returns the proper result") {
                        actualResult = try await subject.patch(endpoint: "/patch",
                                                               body: ["ghost": "slimer"])
                        
                        let typedResult = actualResult as! String
                        
                        expect(typedResult).to.equal("Éxito")
                        
                        expect(fakeClassicNetworkingEngine.capturedPatchEndpoint).to.equal("/patch")
                        expect(fakeClassicNetworkingEngine.capturedPatchBaseURL).to.equal("https://ghost.busters")
                        expect(fakeClassicNetworkingEngine.capturedPatchHeaders).to.equal(["city": "new-york"])
                        
                        let typedBody = fakeClassicNetworkingEngine.capturedPatchBody as! [String: String]
                       
                        expect(typedBody).to.equal(["ghost": "slimer"])
                    }
                }
            }
            
            describe("Codable networking") {
                var actualResult: String!
                
                describe("GET") {
                    it("returns the proper result") {
                        actualResult = try await subject.get(endpoint: "/get",
                                                             parameters: ["ghost": "slimer"])
                        
                        expect(actualResult).to.equal("Éxito")
                        
                        expect(fakeNetworkingEngine.capturedGetEndpoint).to.equal("/get")
                        expect(fakeNetworkingEngine.capturedGetBaseURL).to.equal("https://ghost.busters")
                        expect(fakeNetworkingEngine.capturedGetHeaders).to.equal(["city": "new-york"])
                        expect(fakeNetworkingEngine.capturedGetParameters).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("DELETE") {
                    it("returns the proper result") {
                        actualResult = try await subject.delete(endpoint: "/delete",
                                                                parameters: ["ghost": "slimer"])
                        
                        expect(actualResult).to.equal("Éxito")
                        
                        expect(fakeNetworkingEngine.capturedDeleteEndpoint).to.equal("/delete")
                        expect(fakeNetworkingEngine.capturedDeleteBaseURL).to.equal("https://ghost.busters")
                        expect(fakeNetworkingEngine.capturedDeleteHeaders).to.equal(["city": "new-york"])
                        expect(fakeNetworkingEngine.capturedDeleteParameters).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("POST") {
                    it("returns the proper result") {
                        actualResult = try await subject.post(endpoint: "/post",
                                                              body: ["ghost": "slimer"])
                        
                        expect(actualResult).to.equal("Éxito")
                        
                        expect(fakeNetworkingEngine.capturedPostEndpoint).to.equal("/post")
                        expect(fakeNetworkingEngine.capturedPostBaseURL).to.equal("https://ghost.busters")
                        expect(fakeNetworkingEngine.capturedPostHeaders).to.equal(["city": "new-york"])
                        
                        let typedBody = fakeNetworkingEngine.capturedPostBody as! [String: String]
                       
                        expect(typedBody).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("PUT") {
                    it("returns the proper result") {
                        actualResult = try await subject.put(endpoint: "/put",
                                                              body: ["ghost": "slimer"])
                        
                        expect(actualResult).to.equal("Éxito")
                        
                        expect(fakeNetworkingEngine.capturedPutEndpoint).to.equal("/put")
                        expect(fakeNetworkingEngine.capturedPutBaseURL).to.equal("https://ghost.busters")
                        expect(fakeNetworkingEngine.capturedPutHeaders).to.equal(["city": "new-york"])
                        
                        let typedBody = fakeNetworkingEngine.capturedPutBody as! [String: String]
                       
                        expect(typedBody).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("PATCH") {
                    it("returns the proper result") {
                        actualResult = try await subject.patch(endpoint: "/patch",
                                                               body: ["ghost": "slimer"])
                        
                        expect(actualResult).to.equal("Éxito")
                        
                        expect(fakeNetworkingEngine.capturedPatchEndpoint).to.equal("/patch")
                        expect(fakeNetworkingEngine.capturedPatchBaseURL).to.equal("https://ghost.busters")
                        expect(fakeNetworkingEngine.capturedPatchHeaders).to.equal(["city": "new-york"])
                        
                        let typedBody = fakeNetworkingEngine.capturedPatchBody as! [String: String]
                       
                        expect(typedBody).to.equal(["ghost": "slimer"])
                    }
                }
            }
            
            describe("File transfers") {
                describe("downloading") {
                    var actualURL: URL!
                    
                    beforeEach {
                        actualURL = try await subject.downloadFile(endpoint: "/download",
                                                                        parameters: ["ghost": "slimer"],
                                                                        filename: "ecto-1",
                                                                        directory: Directory())
                    }
                    
                    it("returns file url") {
                        expect(actualURL).to.equal(URL(string: "https://99-stubby-99.party"))
                        
                        expect(fakeNetworkingEngine.capturedDownloadFileEndpoint).to.equal("/download")
                        expect(fakeNetworkingEngine.capturedDownloadFileParameters).to.equal(["ghost": "slimer"])
                        expect(fakeNetworkingEngine.capturedDownloadFileFilename).to.equal("ecto-1")
                        
                        let typedDownloadFileDirectory = fakeNetworkingEngine.capturedDownloadFileDirectory as? Directory
                        
                        expect(typedDownloadFileDirectory).to.equal(Directory())
                    }
                }
                
                describe("uploading") {
                    describe("JSONSerialization (ol' skoo)") {
                        var actualResponse: Any!
                        
                        beforeEach {
                            actualResponse = try await subject.uploadFile(endpoint: "/upload",
                                                                          parameters: ["ghost": "slimer"],
                                                                          data: "data".data(using: .utf8)!)
                        }
                        
                        it("returns json response") {
                            let typedResponse = actualResponse as! String
                            
                            expect(typedResponse).to.equal("Éxito")
                            
                            expect(fakeClassicNetworkingEngine.capturedUploadFileEndpoint).to.equal("/upload")
                            expect(fakeClassicNetworkingEngine.capturedUploadFileParameters).to.equal(["ghost": "slimer"])
                            expect(fakeClassicNetworkingEngine.capturedUploadFileData).to.equal("data".data(using: .utf8)!)
                        }
                    }
                    
                    describe("Codable") {
                        var actualResponse: String!
                        
                        beforeEach {
                            actualResponse = try await subject.uploadFile(endpoint: "/upload",
                                                                          parameters: ["ghost": "slimer"],
                                                                          data: "data".data(using: .utf8)!)
                        }
                        
                        it("returns deserialized codable model") {
                            expect(actualResponse).to.equal("Éxito")
                            
                            expect(fakeNetworkingEngine.capturedUploadFileEndpoint).to.equal("/upload")
                            expect(fakeNetworkingEngine.capturedUploadFileParameters).to.equal(["ghost": "slimer"])
                            expect(fakeNetworkingEngine.capturedUploadFileData).to.equal("data".data(using: .utf8)!)
                        }
                    }
                }
            }
        }
    }
}
