//
//  ViewController.swift
//  3 (iOS)
//
//  Created by AnKl on 13.04.2023.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    func getAdvice() {
        let url = URL(string: "https://api.adviceslip.com/advice")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected response: \(response!)")
                return
            }
            
            if let data = data,
                let advice = try? JSONDecoder().decode(Advice.self, from: data) {
                DispatchQueue.main.async {
                    self.adviceLabel.text = advice.slip.advice
                }
            }
        }
        
        task.resume()
    }

    struct Advice: Codable {
        let slip: Slip
    }

    struct Slip: Codable {
        let advice: String
    }

    
    @IBAction func getAdviceButtonTapped(_ sender: UIButton) {
        getAdvice()
    }
   
    @IBAction func getAdviceButtonTapped(_ sender: UIButton) {
        getAdvice()
    }

    func getAdvice() {
        let url = URL(string: "https://api.adviceslip.com/advice")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected response: \(response!)")
                return
            }
            
            if let data = data,
                let advice = try? JSONDecoder().decode(Advice.self, from: data) {
                DispatchQueue.main.async {
                    self.adviceLabel.text = advice.slip.advice
                }
            }
        }
        
        task.resume()
    }

}

struct Advice: Codable {
    let slip: Slip
}

struct Slip: Codable {
    let advice: String
}
