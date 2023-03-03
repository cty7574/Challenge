//
//  ViewController.swift
//  Challenge
//
//  Created by 맨태 on 2023/02/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var fifthButton: UIButton!
    @IBOutlet weak var allButton: UIButton!
    
    let urlArr = [
        "https://www.freecodecamp.org/news/content/images/size/w2000/2022/09/jonatan-pie-3l3RwQdHRHg-unsplash.jpg",
        "https://www.industrialempathy.com/img/remote/ZiClJf-640w.avif",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Ultraviolet_image_of_the_Cygnus_Loop_Nebula_crop.jpg/691px-Ultraviolet_image_of_the_Cygnus_Loop_Nebula_crop.jpg",
        "https://images.rawpixel.com/image_1000/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L25zODIzMC1pbWFnZS5qcGc.jpg",
        "https://www.w3schools.com/css/img_5terre.jpg"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        firstButton.layer.cornerRadius = 5
        secondButton.layer.cornerRadius = 5
        thirdButton.layer.cornerRadius = 5
        fourthButton.layer.cornerRadius = 5
        fifthButton.layer.cornerRadius = 5
        allButton.layer.cornerRadius = 5
    }

    @IBAction func loadBtnTapped(_ sender: UIButton) {
        
        let imageView = view.viewWithTag(sender.tag - 10) as! UIImageView
        
        DispatchQueue.global().sync {
            imageView.image = UIImage(systemName: "photo")
            imageView.imageDownload(url: URL(string: urlArr[sender.tag - 20])!)
        }
    }
    
    @IBAction func allBtnTapped(_ sender: UIButton) {
        
        DispatchQueue.global().sync {
            let imageView = view.viewWithTag(10) as! UIImageView
            imageView.image = UIImage(systemName: "photo")
            imageView.imageDownload(url: URL(string: urlArr[0])!)
        }
        
        DispatchQueue.global().sync {
            let imageView = view.viewWithTag(11) as! UIImageView
            imageView.image = UIImage(systemName: "photo")
            imageView.imageDownload(url: URL(string: urlArr[1])!)
        }
        
        DispatchQueue.global().sync {
            let imageView = view.viewWithTag(12) as! UIImageView
            imageView.image = UIImage(systemName: "photo")
            imageView.imageDownload(url: URL(string: urlArr[2])!)
        }
        
        DispatchQueue.global().sync {
            let imageView = view.viewWithTag(13) as! UIImageView
            imageView.image = UIImage(systemName: "photo")
            imageView.imageDownload(url: URL(string: urlArr[3])!)
        }
        
        DispatchQueue.global().sync {
            let imageView = view.viewWithTag(14) as! UIImageView
            imageView.image = UIImage(systemName: "photo")
            imageView.imageDownload(url: URL(string: urlArr[4])!)
        }
        
    }
}

extension UIImageView {
    func imageDownload(url: URL) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    print("Download image fail : \(url)")
                    return
            }

            DispatchQueue.main.async() { [weak self] in
                print("Download image success \(url)")
                self?.image = image
            }
        }.resume()
    }
}



