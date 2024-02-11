import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var verbTextBox: UITextField!

    var verbD: String?

    override func viewDidLoad() {
        super.viewDidLoad()

    }



    @IBAction func conjugateButtonTapped(_ sender: Any) {
        guard let verbToConjugate = verbTextBox.text, !verbToConjugate.isEmpty else {
            return
        }
        FrenchVerbAPI.getVerb(verb: verbToConjugate) { verb in
            self.verbD = (verb.fullDescription)
        } failHandler: { httpStatusCode, errorMessage in
            print(errorMessage)
        }


        performSegue(withIdentifier: Segue.toConjuguerViewController, sender: verbToConjugate)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toConjuguerViewController {
            if let conjuguerViewController = segue.destination as? ConjuguerViewController,
               let verbToConjugate = sender as? String {
                conjuguerViewController.verbToConjugate = verbToConjugate
            }
        }
    }

    

    

   @IBAction func logoutButtonTapped(_ sender: Any) {
       performSegue(withIdentifier: Segue.tologinViewControllers, sender: self)
        }
}



