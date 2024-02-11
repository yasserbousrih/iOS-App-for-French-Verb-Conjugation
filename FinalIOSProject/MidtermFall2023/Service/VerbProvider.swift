// VerbProvider.swift

import Foundation

class VerbProvider {

    static func regularVerbConjugations(infinitive: String) -> Verb {
        let base = String(infinitive.dropLast(2))

        let je = base + "e"
        let tu = base + "es"
        let ilElle = base + "e"
        let nous = base + "ons"
        let vous = base + "ez"
        let ilsElles = base + "ent"

        return Verb(
            infinitiveForm: infinitive,
            je: je,
            tu: tu,
            ilElle: ilElle,
            nous: nous,
            vous: vous,
            ilsElles: ilsElles,
            irregular: false
        )
    }

    static func irregularVerbConjugations(infinitive: String) -> Verb {
        // Implement the irregular verb conjugations logic here
        // You can fetch the irregular verb conjugations from a data source or define them manually
        // For simplicity, let's assume an example with dummy values
        return Verb(
            infinitiveForm: infinitive,
            je: "irregular_je",
            tu: "irregular_tu",
            ilElle: "irregular_ilElle",
            nous: "irregular_nous",
            vous: "irregular_vous",
            ilsElles: "irregular_ilsElles",
            irregular: true
        )
    }

    static func isIrregularVerb(infinitive: String) -> Bool {
        // Check if the infinitive is in the list of irregular verbs
        let irregularVerbs = irregularVerbs().map { $0.infinitiveForm }
        return irregularVerbs.contains(infinitive)
    }

    static func irregularVerbs() -> [Verb] {
        var irregularVerbs = [Verb]()

        // Add irregular verbs
        let irregular1 = Verb(
            infinitiveForm: "être",
            je: "suis",
            tu: "es",
            ilElle: "est",
            nous: "sommes",
            vous: "êtes",
            ilsElles: "sont",
            irregular: true
        )
        irregularVerbs.append(irregular1)

        let irregular2 = Verb(
            infinitiveForm: "avoir",
            je: "ai",
            tu: "as",
            ilElle: "a",
            nous: "avons",
            vous: "avez",
            ilsElles: "ont",
            irregular: true
        )
        irregularVerbs.append(irregular2)

        // Add more irregular verbs

        return irregularVerbs
    }
}
