//
//  ExtensionUI.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 10/12/20.
//

import Foundation
import UIKit
extension UIImageView{
    func load(urlString: String) {
        let url = URL(string: URLBase.images.rawValue + urlString)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
extension UILabel{
    func setFormatterDate(dateString: String ){
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "YYYY-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd-MMM-YYYY"

        if let date = dateFormatterGet.date(from: dateString) {
            self.text = dateFormatterPrint.string(from: date)
        } else{
            self.text = dateString
        }
    }
}
