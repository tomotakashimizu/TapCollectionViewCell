//
//  PhotoCollectionViewCell.swift
//  TapCollectionViewCellSample
//
//  Created by 清水智貴 on 2020/09/15.
//  Copyright © 2020 com.tomotaka. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 角丸にするコード
        photoImageView.layer.cornerRadius = 10
        photoImageView.clipsToBounds = true

        layer.cornerRadius = 10
    }

}
