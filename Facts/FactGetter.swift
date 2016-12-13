
import Foundation

// this is the "contract"
protocol FactGetterDelegate {
    func didGetFact(_ fact: Fact)
    func didNotGetFact(_ error: NSError)
}

// this is the delegator
class FactGetter {
    
    fileprivate var delegate: FactGetterDelegate
    
    init(delegate: FactGetterDelegate) {
        self.delegate = delegate
    }
    
    func getFact(_ fact: String) {
        
        let session = URLSession.shared
        
        let factRequestURL = URL(string: "http://numbersapi.com/\(fact)?json")
        
        let dataTask = session.dataTask(with: factRequestURL!, completionHandler: {
            (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if let networkError = error {
                self.delegate.didNotGetFact(networkError as NSError)
            } else {
                print("Success")
                
                do {
                    // turn the JSON into a dict
                    let factData = try JSONSerialization.jsonObject(
                        with: data!,
                    options: .mutableContainers) as! [String: AnyObject]
                    
                    let fact = Fact(factData: factData) // instantiate a Fact with the data we have
                    
                    self.delegate.didGetFact(fact)
                } catch let jsonError as NSError {
                    self.delegate.didNotGetFact(jsonError)
                }
            }
        } )
        
        dataTask.resume()
    }
}
