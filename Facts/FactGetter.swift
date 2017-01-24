
import Foundation
import Alamofire

// this is the delegator
class FactGetter {
    static let shared = FactGetter()
    
    func getFact(_ fact: String, _ completion : ((_ fact : Fact) -> Void)? = nil) {
        let url = URL(string: "http://numbersapi.com/\(fact)?json")
        Alamofire.request(url!).responseJSON { (response) in
            if let factData = response.result.value as? [String : AnyObject] {
                let fact = Fact(factData: factData)
                completion?(fact)
            }
        }
    }
}
