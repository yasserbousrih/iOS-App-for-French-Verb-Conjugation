// ConjuguerViewController.swift

import UIKit

class ConjuguerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var verbLabel: UILabel!
    @IBOutlet weak var conjugationsTableView: UITableView!

    var verbToConjugate: String?
    var conjugations: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        if let verbToConjugate = verbToConjugate {
            verbLabel.text = "Conjugations for \(verbToConjugate)"
            conjugations = getConjugations(for: verbToConjugate)
        }

        conjugationsTableView.dataSource = self
        conjugationsTableView.delegate = self
        conjugationsTableView.reloadData()
    }

    func getConjugations(for verb: String) -> [String] {

        if VerbProvider.isIrregularVerb(infinitive: verb) {
            let irregularConjugations = VerbProvider.irregularVerbConjugations(infinitive: verb)
            return [
                irregularConjugations.je ?? "",
                irregularConjugations.tu ?? "",
                irregularConjugations.ilElle ?? "",
                irregularConjugations.nous ?? "",
                irregularConjugations.vous ?? "",
                irregularConjugations.ilsElles ?? ""
            ]
        } else {
            let regularConjugations = VerbProvider.regularVerbConjugations(infinitive: verb)
            return [
                regularConjugations.je ?? "",
                regularConjugations.tu ?? "",
                regularConjugations.ilElle ?? "",
                regularConjugations.nous ?? "",
                regularConjugations.vous ?? "",
                regularConjugations.ilsElles ?? ""
            ]
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conjugations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConjugationCell", for: indexPath)
        cell.textLabel?.text = conjugations[indexPath.row]
        return cell
    }
}
