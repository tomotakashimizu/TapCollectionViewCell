//
//  DetailViewController.swift
//  TapCollectionViewCellSample
//
//  Created by 清水智貴 on 2020/09/15.
//  Copyright © 2020 com.tomotaka. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // 値を受け取るための変数
    var selectedName: String!
    var selectedImage: UIImage!
    
    @IBOutlet var selectedImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // タイトルに受け取った名前を表示
        navigationItem.title = selectedName
        // 受け取った画像を表示
        selectedImageView.image = selectedImage
    }
}
