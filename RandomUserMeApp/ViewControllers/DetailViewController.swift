//
//  ViewController.swift
//  RandomUserMeApp
//
//  Created by Masaie on 15/4/22.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surNameLabel: UILabel!
    @IBOutlet var contactImageView: UIImageView!

    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValues()
    }

    override func viewWillLayoutSubviews() {
        contactImageView.layer.cornerRadius = contactImageView.bounds.height / 2
    }

    private func setValues() {
        nameLabel.text = user.name.first
        surNameLabel.text = user.name.last
        
        guard let imageUrl = URL(string: user.picture.large) else { return }
        contactImageView.af.setImage(withURL: imageUrl)
    }
}

