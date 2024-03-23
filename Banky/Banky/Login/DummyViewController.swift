//
//  DummyViewController.swift
//  Banky
//
//  Created by Admin on 2/15/24.
//
import UIKit

class DummyViewController: UIViewController{
    let stackview = UIStackView()
    let label = UILabel()
    let logoutButton = UIButton(type: .system)
    
    weak var logoutDelegate: LogoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    
}

extension DummyViewController{
    func style(){
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.setTitle("Logout", for: [])
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)
    }
    func layout(){
        stackview.addArrangedSubview(label)
        stackview.addArrangedSubview(logoutButton)
        view.addSubview(stackview)
        
        NSLayoutConstraint.activate([stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                    stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc func  logoutButtonTapped(sender:UIButton){
        logoutDelegate?.didLogout()
    }
}
