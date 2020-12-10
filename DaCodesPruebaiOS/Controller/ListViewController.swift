//
//  ViewController.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 09/12/20.
//

import UIKit

class ListViewController: UIViewController {
    var model: MovieModelInput!
    let refreshControl = UIRefreshControl()
    var reload = true
    lazy var contentView: MoviesViewInput! = {return view as! MoviesViewInput}()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl.addTarget(self, action: #selector(doresfreshItems), for: .valueChanged)
        self.contentView.collectionView.refreshControl = refreshControl
        self.contentView.dataSource = MoviesDataSource()
        self.contentView.itemAction = {
            self.performSegue(withIdentifier: "showDetail", sender: $0)
        }
        self.contentView.addItem = {
            self.reload = false
            self.model.load(reload: self.reload)
        }
        self.model.load(reload: self.reload)
    }
    @objc func doresfreshItems(){
        self.reload = true
        self.model.load(reload: self.reload)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail",
            let controller = segue.destination as? DetailViewControllerInput,
            let item = sender as? String{
            controller.setItem(item)
        }
    }

}
extension ListViewController: MoviesModelOutput{
    func modelDidload(_ items: [MovieItem]) {
        self.refreshControl.endRefreshing()
        if reload{
            self.contentView.display(items)
        }else{
            self.contentView.dataSource.items.append(contentsOf: items)
            self.contentView.display(nil)
        }
        
    }
    
    func modelDidloadFail(message: String) {
        print(message)
    }
    
    
}
