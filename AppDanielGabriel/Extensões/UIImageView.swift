//
//  UIImageView.swift
//  AppDanielGabriel
//
//  Created by user on 24/08/23.
//

import UIKit

extension UIImageView {
    func download(from image: String) {
        let url = URL(string: image)!
        
        URLSession.shared.dataTask(with: .init(url: url)) { data, _, error in
            if error != nil { return }
                if let data {
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                    }
                } else { return }
        }.resume()
    }
}
