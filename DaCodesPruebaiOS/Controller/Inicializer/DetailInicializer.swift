//
//  DetailInicializer.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 10/12/20.
//

import UIKit

class DetailInicializer: NSObject {
    @IBOutlet weak var viewController: DetailViewController!
    override func awakeFromNib() {
           super.awakeFromNib()
        let model = DetailModel()
        viewController.model = model
        model.out = viewController
    }
}
