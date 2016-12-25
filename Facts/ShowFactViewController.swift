
import UIKit

class ShowFactViewController: UIViewController, FactGetterDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    var fact: FactGetter!
    var factNum: String = "0"

    @IBOutlet weak var factTextDisplay: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fact = FactGetter(delegate: self)
        
        fact.getFact(factNum)
        spinner?.startAnimating()
    }
    
    // MARK - Delegate stuff

    func didGetFact(_ fact: Fact) {
        factTextDisplay.text = fact.factText
        spinner.stopAnimating()
        print("success from didGetFact")
    }
    
    func didNotGetFact(_ error: NSError) {
        factTextDisplay.text = "There was an error";
        spinner.stopAnimating()
    }
    
    // MARK - Gesture

    @IBAction func swipeRightToFactsView(_ sender: UISwipeGestureRecognizer) {
        let factToFactsViewTransition = CATransition()
        factToFactsViewTransition.duration = 0.6
        factToFactsViewTransition.type = kCATransitionPush
        factToFactsViewTransition.subtype = kCATransitionFromLeft
        view.window!.layer.add(factToFactsViewTransition, forKey: kCATransition)
        self.dismiss(animated: true, completion: nil)
    }
 

}

