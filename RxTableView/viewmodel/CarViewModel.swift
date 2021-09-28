//
//  CarViewModel.swift
//  RxTableView
//
//  Created by marcelo bianchi on 20/08/21.
//

import Foundation
import RxSwift
import RxCocoa

struct CarViewModel {
    var items = PublishSubject<[Car]>()
    
    func fetchCars() {
        let cars = [
            Car(id: 0, name: "Porshe Carrera"),
            Car(id: 1, name: "Mercedes AMG"),
            Car(id: 2, name: "Jeep Compass"),
            Car(id: 3, name: "BMW M5")
        ]

        items.on(.next(cars))
        items.on(.completed)
    }
    
}
