//
//  DetailViewController.swift
//  GalleryApp
//
//  Created by Ashok Narvaneni on 21/02/24.
//

import UIKit

class DetailViewController: UIViewController {
    // IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!

    
    var detailViewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("DetailViewController viewDidLoad...")
        self.navigationItem.title = "Product Details"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("DetailViewController viewWillAppear...")
        self.setUpUI()
    }
    
    func setUpUI() {
        print(detailViewModel.title)
        titleLabel.text = detailViewModel.title
        priceLabel.text = detailViewModel.price
        ratingLabel.text = detailViewModel.ratingAndCount
        productImageView.loadImageFromUrl(urlString: detailViewModel.imageUrl)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
