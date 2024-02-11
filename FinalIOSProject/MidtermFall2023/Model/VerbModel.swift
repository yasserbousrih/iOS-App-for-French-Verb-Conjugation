//
//  VerbModel.swift

import Foundation

class Verb {

    var infinitiveForm: String?
    var je: String?
    var tu: String?
    var ilElle: String?
    var nous: String?
    var vous: String?
    var ilsElles: String?
    var irregular: Bool = false

    init(
        infinitiveForm: String,
        je: String,
        tu: String,
        ilElle: String,
        nous: String,
        vous: String,
        ilsElles: String,
        irregular: Bool
    ) {
        self.infinitiveForm = infinitiveForm
        self.je = je
        self.tu = tu
        self.ilElle = ilElle
        self.nous = nous
        self.vous = vous
        self.ilsElles = ilsElles
        self.irregular = irregular
    }

    init() {
    }
}

