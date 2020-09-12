//
//  GiftViewController.swift
//  WiredBrainCoffee
//
//  Created by Umer Khan on 07/09/2020.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import UIKit

class GiftViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightCons: NSLayoutConstraint!
    @IBOutlet weak var heightforThankYou: NSLayoutConstraint!
    @IBOutlet weak var thankYouCollectionView: UICollectionView!
    
    
    let cellIdentifier: String = "GiftCardCell"
    var colorData = [GiftCardModel]()
    var customDataSource: CustomDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GiftCardFunctions.getSeasonalGiftCards { [weak self] (cards) in
            guard let self = self else { return }
            self.colorData = cards
            self.collectionView.reloadData()
        }
        
        GiftCardFunctions.getThankYouGiftCards { [weak self] (cards) in
            guard let self = self else { return }
            self.customDataSource = CustomDataSource(giftCards: cards)
            self.thankYouCollectionView.dataSource = self.customDataSource
            self.thankYouCollectionView.delegate = self.customDataSource
            self.thankYouCollectionView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupHeightConstraint()
    }
    
    func setupHeightConstraint() {
        let widht = collectionView.bounds.width
        let height = widht / 1.5
        heightCons.constant = height
        heightforThankYou.constant = height / 2
    }
}

extension GiftViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! GiftCardCollectionViewCell
                
        cell.setup(giftCardModel: colorData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
            let view = (collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "sectionHeader", for: indexPath))
        
            return view
    }
}

extension GiftViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let columns: CGFloat    = 2
//        let collectionViewWidth = collectionView.bounds.width
//        let flowLayout          = collectionViewLayout as! UICollectionViewFlowLayout
//        let spaceBetweenCells   = flowLayout.minimumInteritemSpacing * (columns - 1)
//        let sectionInsets       = flowLayout.sectionInset.left + flowLayout.sectionInset.right
//        let adjustedWidth       = collectionViewWidth - spaceBetweenCells - sectionInsets
//
//        let width: CGFloat  = floor(adjustedWidth / columns)
//        let height: CGFloat = width / 1.5
        
        let width = collectionView.bounds.width - 50
        let height = width / 1.5
        
        return CGSize(width: width, height: height)
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //
    //        let rows: CGFloat        = 2
    //
    //        let collectionViewHeight = collectionView.bounds.height
    //        let flowLayout           = collectionViewLayout as! UICollectionViewFlowLayout
    //        let spacingBetweenCells  = flowLayout.minimumInteritemSpacing * (rows - 1)
    //        let adjustedHeight       = collectionViewHeight - spacingBetweenCells
    //
    //        let height: CGFloat      = floor(adjustedHeight / rows)
    //
    //        return CGSize(width: 100, height: height)
    //
    //    }
}
