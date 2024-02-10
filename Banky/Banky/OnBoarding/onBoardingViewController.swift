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
    
    let heroImageName : String
    let titleText : String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    init(heroImageName: String, titleText: String) {
        self.heroImageName = heroImageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
}

extension OnboardingViewController{
    func style(){
        view.backgroundColor = .systemBackground
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 20
        
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        imageview.image = UIImage(named: heroImageName)
        
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = titleText
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
