
import UIKit

class ShowFactViewController: UIViewController, FactGetterDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    var fact: FactGetter! // this is the delegate
    var factNum: String = "0"

    @IBOutlet weak var factTextDisplay: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fact = FactGetter(delegate: self) // but the delegate is itself?
        
        fact.getFact(factNum)
        spinner?.startAnimating()
    }
    
    // MARK - Delegate stuff

    func didGetFact(_ fact: Fact) {
        spinner.stopAnimating()
        factTextDisplay.text = fact.factText
        print("success from didGetFact")
    }
    
    func didNotGetFact(_ error: NSError) {
        print("ERROR")
    }
    
    // MARK - Gesture

    @IBAction func swipeRightToFactsView(_ sender: UISwipeGestureRecognizer) {
        let transition = CATransition()
        transition.duration = 0.6
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
        self.dismiss(animated: true, completion: nil)
    }
 

}

