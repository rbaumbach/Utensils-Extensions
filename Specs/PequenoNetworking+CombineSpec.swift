import Combine
import Quick
import Moocher
import Capsule
import Utensils
@testable import UtensilsExtensions

final class PequenoNetworking_CombineSpec: QuickSpec {
    override class func spec() {
        describe("PequenoNetworking+Combine") {
            var subject: PequenoNetworking!
            
            var fakeClassicNetworkingEngine: FakeClassicNetworkingEngine!
            var fakeNetworkingEngine: FakeNetworkingEngine!
            
            var subscribers: Set<AnyCancellable>!
            
            beforeEach {
                fakeClassicNetworkingEngine = FakeClassicNetworkingEngine()
                fakeNetworkingEngine = FakeNetworkingEngine()
                
                subject = PequenoNetworking(baseURL: "https://ghost.busters",
                                            headers: ["city": "new-york"],
                                            classicNetworkingEngine: fakeClassicNetworkingEngine,
                                            networkingEngine: fakeNetworkingEngine)
                
                subscribers = Set<AnyCancellable>()
            }
            
            describe("JSONSerialization (ol' skoo)") {
                var stubbedResult: Result<Any, PequenoNetworking.Error>!
                var actualJSONResponse: Any!
                
                beforeEach {
                    stubbedResult = .success("Back off man! I'm a scientist!")
                }
                
                describe("GET") {
                    beforeEach {
                        subject.get(endpoint: "/get",
                                    parameters: ["ghost": "slimer"])
                        .sink { _ in }
                        receiveValue: { jsonResponse in
                            actualJSONResponse = jsonResponse
                        }.store(in: &subscribers)
                        
                        fakeClassicNetworkingEngine.capturedGetCompletionHandler?(stubbedResult)
                    }
                    
                    it("returns the proper result") {
                        let typedResult = actualJSONResponse as! String
                        
                        expect(typedResult).to.equal("Back off man! I'm a scientist!")
                        
                        expect(fakeClassicNetworkingEngine.capturedGetEndpoint).to.equal("/get")
                        expect(fakeClassicNetworkingEngine.capturedGetBaseURL).to.equal("https://ghost.busters")
                        expect(fakeClassicNetworkingEngine.capturedGetHeaders).to.equal(["city": "new-york"])
                        expect(fakeClassicNetworkingEngine.capturedGetParameters).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("DELETE") {
                    beforeEach {
                        subject.delete(endpoint: "/delete",
                                       parameters: ["ghost": "slimer"])
                        .sink { _ in }
                        receiveValue: { jsonResponse in
                            actualJSONResponse = jsonResponse
                        }.store(in: &subscribers)
                        
                        fakeClassicNetworkingEngine.capturedDeleteCompletionHandler?(stubbedResult)
                    }
                    
                    it("returns the proper result") {
                        let typedResult = actualJSONResponse as! String
                        
                        expect(typedResult).to.equal("Back off man! I'm a scientist!")
                        
                        expect(fakeClassicNetworkingEngine.capturedDeleteEndpoint).to.equal("/delete")
                        expect(fakeClassicNetworkingEngine.capturedDeleteBaseURL).to.equal("https://ghost.busters")
                        expect(fakeClassicNetworkingEngine.capturedDeleteHeaders).to.equal(["city": "new-york"])
                        expect(fakeClassicNetworkingEngine.capturedDeleteParameters).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("POST") {
                    beforeEach {
                        subject.post(endpoint: "/post",
                                     body: ["ghost": "slimer"])
                        .sink { _ in }
                        receiveValue: { jsonResponse in
                            actualJSONResponse = jsonResponse
                        }.store(in: &subscribers)
                        
                        fakeClassicNetworkingEngine.capturedPostCompletionHandler?(stubbedResult)
                    }
                    
                    it("returns the proper result") {
                        let typedResult = actualJSONResponse as! String
                        
                        expect(typedResult).to.equal("Back off man! I'm a scientist!")
                        
                        expect(fakeClassicNetworkingEngine.capturedPostEndpoint).to.equal("/post")
                        expect(fakeClassicNetworkingEngine.capturedPostBaseURL).to.equal("https://ghost.busters")
                        expect(fakeClassicNetworkingEngine.capturedPostHeaders).to.equal(["city": "new-york"])
                        
                        let typedBody = fakeClassicNetworkingEngine.capturedPostBody as! [String: String]
                       
                        expect(typedBody).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("PUT") {
                    beforeEach {
                        subject.put(endpoint: "/put",
                                    body: ["ghost": "slimer"])
                        .sink { _ in }
                        receiveValue: { jsonResponse in
                            actualJSONResponse = jsonResponse
                        }.store(in: &subscribers)
                        
                        fakeClassicNetworkingEngine.capturedPutCompletionHandler?(stubbedResult)
                    }
                    
                    it("returns the proper result") {
                        let typedResult = actualJSONResponse as! String
                        
                        expect(typedResult).to.equal("Back off man! I'm a scientist!")
                        
                        expect(fakeClassicNetworkingEngine.capturedPutEndpoint).to.equal("/put")
                        expect(fakeClassicNetworkingEngine.capturedPutBaseURL).to.equal("https://ghost.busters")
                        expect(fakeClassicNetworkingEngine.capturedPutHeaders).to.equal(["city": "new-york"])
                        
                        let typedBody = fakeClassicNetworkingEngine.capturedPutBody as! [String: String]
                       
                        expect(typedBody).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("PATCH") {
                    beforeEach {
                        subject.patch(endpoint: "/patch",
                                      body: ["ghost": "slimer"])
                        .sink { _ in }
                        receiveValue: { jsonResponse in
                            actualJSONResponse = jsonResponse
                        }.store(in: &subscribers)
                        
                        fakeClassicNetworkingEngine.capturedPatchCompletionHandler?(stubbedResult)
                    }
                    
                    it("returns the proper result") {
                        let typedResult = actualJSONResponse as! String
                        
                        expect(typedResult).to.equal("Back off man! I'm a scientist!")
                        
                        expect(fakeClassicNetworkingEngine.capturedPatchEndpoint).to.equal("/patch")
                        expect(fakeClassicNetworkingEngine.capturedPatchBaseURL).to.equal("https://ghost.busters")
                        expect(fakeClassicNetworkingEngine.capturedPatchHeaders).to.equal(["city": "new-york"])
                        
                        let typedBody = fakeClassicNetworkingEngine.capturedPatchBody as! [String: String]
                       
                        expect(typedBody).to.equal(["ghost": "slimer"])
                    }
                }
            }
            
            describe("codable networking") {
                var future: Future<String, PequenoNetworking.Error>!
                
                var stubbedResult: Result<String, PequenoNetworking.Error>!
                var actualJSONResponse: String!
                
                beforeEach {
                    stubbedResult = .success("Back off man! I'm a scientist!")
                }
                
                describe("GET") {
                    beforeEach {
                        future = subject.get(endpoint: "/get",
                                             parameters: ["ghost": "slimer"])
                        
                        future.sink { _ in }
                        receiveValue: { jsonResponse in
                            actualJSONResponse = jsonResponse
                        }.store(in: &subscribers)
                        
                        let typedCompletionHandler = fakeNetworkingEngine.capturedGetCompletionHandler as? (Result<String, PequenoNetworking.Error>) -> Void
                        
                        typedCompletionHandler?(stubbedResult)
                    }
                    
                    it("returns the proper result") {
                        expect(actualJSONResponse).to.equal("Back off man! I'm a scientist!")
                        
                        expect(fakeNetworkingEngine.capturedGetEndpoint).to.equal("/get")
                        expect(fakeNetworkingEngine.capturedGetBaseURL).to.equal("https://ghost.busters")
                        expect(fakeNetworkingEngine.capturedGetHeaders).to.equal(["city": "new-york"])
                        expect(fakeNetworkingEngine.capturedGetParameters).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("DELETE") {
                    beforeEach {
                        future = subject.delete(endpoint: "/delete",
                                                parameters: ["ghost": "slimer"])
                        
                        future.sink { _ in }
                        receiveValue: { jsonResponse in
                            actualJSONResponse = jsonResponse
                        }.store(in: &subscribers)
                        
                        let typedCompletionHandler = fakeNetworkingEngine.capturedDeleteCompletionHandler as? (Result<String, PequenoNetworking.Error>) -> Void
                        
                        typedCompletionHandler?(stubbedResult)
                    }
                    
                    it("returns the proper result") {
                        expect(actualJSONResponse).to.equal("Back off man! I'm a scientist!")
                        
                        expect(fakeNetworkingEngine.capturedDeleteEndpoint).to.equal("/delete")
                        expect(fakeNetworkingEngine.capturedDeleteBaseURL).to.equal("https://ghost.busters")
                        expect(fakeNetworkingEngine.capturedDeleteHeaders).to.equal(["city": "new-york"])
                        expect(fakeNetworkingEngine.capturedDeleteParameters).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("POST") {
                    beforeEach {
                        future = subject.post(endpoint: "/post",
                                              body: ["ghost": "slimer"])
                        
                        future.sink { _ in }
                        receiveValue: { jsonResponse in
                            actualJSONResponse = jsonResponse
                        }.store(in: &subscribers)
                        
                        let typedCompletionHandler = fakeNetworkingEngine.capturedPostCompletionHandler as? (Result<String, PequenoNetworking.Error>) -> Void
                        
                        typedCompletionHandler?(stubbedResult)
                    }
                    
                    it("returns the proper result") {
                        expect(actualJSONResponse).to.equal("Back off man! I'm a scientist!")
                        
                        expect(fakeNetworkingEngine.capturedPostEndpoint).to.equal("/post")
                        expect(fakeNetworkingEngine.capturedPostBaseURL).to.equal("https://ghost.busters")
                        expect(fakeNetworkingEngine.capturedPostHeaders).to.equal(["city": "new-york"])
                        
                        let typedBody = fakeNetworkingEngine.capturedPostBody as! [String: String]
                       
                        expect(typedBody).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("PUT") {
                    beforeEach {
                        future = subject.put(endpoint: "/put",
                                             body: ["ghost": "slimer"])
                        
                        future.sink { _ in }
                        receiveValue: { jsonResponse in
                            actualJSONResponse = jsonResponse
                        }.store(in: &subscribers)
                        
                        let typedCompletionHandler = fakeNetworkingEngine.capturedPutCompletionHandler as? (Result<String, PequenoNetworking.Error>) -> Void
                        
                        typedCompletionHandler?(stubbedResult)
                    }
                    
                    it("returns the proper result") {
                        expect(actualJSONResponse).to.equal("Back off man! I'm a scientist!")
                        
                        expect(fakeNetworkingEngine.capturedPutEndpoint).to.equal("/put")
                        expect(fakeNetworkingEngine.capturedPutBaseURL).to.equal("https://ghost.busters")
                        expect(fakeNetworkingEngine.capturedPutHeaders).to.equal(["city": "new-york"])
                        
                        let typedBody = fakeNetworkingEngine.capturedPutBody as! [String: String]
                       
                        expect(typedBody).to.equal(["ghost": "slimer"])
                    }
                }
                
                describe("PATCH") {
                    beforeEach {
                        future = subject.patch(endpoint: "/patch",
                                               body: ["ghost": "slimer"])
                        
                        future.sink { _ in }
                        receiveValue: { jsonResponse in
                            actualJSONResponse = jsonResponse
                        }.store(in: &subscribers)
                        
                        let typedCompletionHandler = fakeNetworkingEngine.capturedPatchCompletionHandler as? (Result<String, PequenoNetworking.Error>) -> Void
                        
                        typedCompletionHandler?(stubbedResult)
                    }
                    
                    it("returns the proper result") {
                        expect(actualJSONResponse).to.equal("Back off man! I'm a scientist!")
                        
                        expect(fakeNetworkingEngine.capturedPatchEndpoint).to.equal("/patch")
                        expect(fakeNetworkingEngine.capturedPatchBaseURL).to.equal("https://ghost.busters")
                        expect(fakeNetworkingEngine.capturedPatchHeaders).to.equal(["city": "new-york"])
                        
                        let typedBody = fakeNetworkingEngine.capturedPatchBody as! [String: String]
                       
                        expect(typedBody).to.equal(["ghost": "slimer"])
                    }
                }
            }
        }
    }
}
