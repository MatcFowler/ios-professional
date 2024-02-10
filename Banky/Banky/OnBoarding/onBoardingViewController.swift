//
//  onBoardingViewControllerFile.swift
//  Banky
//
//  Created by Admin on 2/8/24.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController{
    let stackview = UIStackView()
    let imageview = UIImageView()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    
}

extension OnboardingViewController{
    func style(){
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 20
        
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        imageview.image = UIImage(named: "delorean")
        
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "Bankey is faster, easier to use, and has  abrand new look and feel that will make you feel like yor are back in 1989!"
            }
    func layout(){
        stackview.addArrangedSubview(imageview)
        stackview.addArrangedSubview(label)
        view.addSubview(stackview)
        
        NSLayoutConstraint.activate([stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                    stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
                                     view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackview.trailingAnchor, multiplier: 1)
                                    ])
        NSLayoutConstraint.activate([])
    }
}
