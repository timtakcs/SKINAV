//
//  Step.swift
//  SKINAV (iOS)
//
//  Created by OTakhtarova on 3/5/22.
//

import Foundation
import Combine

struct step: Identifiable {
    public var id = String()
    public var stepID = Int()
    public var stepName = String()
    public var stepLevel = Int()
    public var stepResortID = Int()
}

class stepStore : ObservableObject {
    @Published var steps = [step]()
}
