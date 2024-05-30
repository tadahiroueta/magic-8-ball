//
//  ViewController.swift
//  magic-8-ball
//
//  Created by Ueta, Lucas T on 10/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    let ball = UIImageView(), label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.backgroundColor = UIColor.black.cgColor
        
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 80
        stack.alignment = .center
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        ball.image = UIImage(named: "balls/Eight Ball 0.png")
        ball.contentMode = .scaleAspectFit
        stack.addArrangedSubview(ball)
        ball.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Ask away"
        label.font = UIFont(name: "Arial", size: 24)
        stack.addArrangedSubview(label)
        label.centerXAnchor.constraint(equalTo: stack.centerXAnchor).isActive = true
    }
    
    @objc func reset() {
        ball.image = UIImage(named: "balls/Eight Ball 0.png")
        label.isHidden = false
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion != .motionShake || label.isHidden { return }
        ball.image = UIImage(named: "balls/Eight Ball \(Int.random(in: 1...9)).png")
        label.isHidden = true
        
        Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector(reset), userInfo: nil, repeats: false)
    }
}

