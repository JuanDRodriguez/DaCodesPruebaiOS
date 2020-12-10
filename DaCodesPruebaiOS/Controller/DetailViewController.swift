//
//  DetailViewController.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 10/12/20.
//

import UIKit

class DetailViewController: UIViewController, DetailViewControllerInput {
    
    var model: DetailModelInput!
    lazy var contentView: DetailViewInput! = {return view as! DetailViewInput}()
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    func setItem(_ id: String) {
        self.model.load(id: id)
    }
    

}
extension DetailViewController: DetailModelOutput{
    func modelDidload(_ items: DetailItem) {
        contentView.display(items)
    }
    
    func modelDidloadFail(message: String) {
        
    }
    
    
}
