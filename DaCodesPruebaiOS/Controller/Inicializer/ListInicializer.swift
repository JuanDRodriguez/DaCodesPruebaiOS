//
//  ListInicializer.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 10/12/20.
//

import UIKit

class ListInicializer: NSObject {
    @IBOutlet weak var viewController: ListViewController!
    override func awakeFromNib() {
           super.awakeFromNib()
        let model = ListModel()
        viewController.model = model
        model.out = viewController
    }
}
