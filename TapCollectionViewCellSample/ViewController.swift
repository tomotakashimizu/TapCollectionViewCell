//
//  ViewController.swift
//  TapCollectionViewCellSample
//
//  Created by 清水智貴 on 2020/09/15.
//  Copyright © 2020 com.tomotaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // 表示させる名前
    let landscapeNames = ["fireworks", "river", "sky", "fish"]
    // 表示させる画像
    let landscapeImages = [UIImage(named: "fireworks.jpeg"), UIImage(named: "river.jpeg") , UIImage(named: "sky.jpeg"), UIImage(named: "fish.jpeg")]
    
    // 次の画面へ値を渡すためのインデックス
    var selectedIndex: Int!
    
    @IBOutlet var photoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        
        //nibの登録
        let nib = UINib(nibName: "PhotoCollectionViewCell", bundle: Bundle.main)
        photoCollectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        
        // レイアウト設定
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 3.0
        layout.minimumInteritemSpacing = 3.0
        layout.itemSize = CGSize(width: photoCollectionView.frame.width / 2 - 3 / 2, height: photoCollectionView.frame.width / 2 - 3 / 2)
        photoCollectionView.collectionViewLayout = layout
    }
    
    // collectionViewCellの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return landscapeNames.count
    }
    
    // collectionViewCellに何を表示するか決める
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // カスタムセルの取得
        let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotoCollectionViewCell
        cell.photoImageView.image = landscapeImages[indexPath.row]
        cell.nameLabel.text = landscapeNames[indexPath.row]
        
        return cell
    }
    
    // colloctionViewCellがタップされた時の処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // どこの(何番目の)cellが押されたか記録
        selectedIndex = indexPath.row
        // 画面遷移
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        // 選択状態解除
        photoCollectionView.deselectItem(at: indexPath, animated: true)
    }
    
    // 次の画面に遷移するときに、選択したものを次の画面に写すコード
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // segueのIDがtoDetailであれば
        if segue.identifier == "toDetail" {
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.selectedName = landscapeNames[selectedIndex]
            detailViewController.selectedImage = landscapeImages[selectedIndex]
        }
    }

}

