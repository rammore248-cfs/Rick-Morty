//
//  RMCharacterViewController.swift
//  Rick&Morty
//
//  Created by XTSW-MAC-1137-2 on 04/11/24.
//

import UIKit

// controller to show and search for Characters
class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(endpoint: .character, queryParameters: [
            URLQueryItem(name: "name", value: "rick"),
            URLQueryItem(name: "status", value: "alive")
        ])
        
        print(request.url)
        
        RMService.shared.execute(request, expecting: RMCharacter.self) { result in

        }
    }
}
