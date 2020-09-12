//  Created by Umer Khan on 07/09/2020.


import UIKit

extension CustomFlowLayout: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       let columns: CGFloat    = 2
       let collectionViewWidth = collectionView.bounds.width
       let flowLayout          = collectionViewLayout as! UICollectionViewFlowLayout
       let spaceBetweenCells   = flowLayout.minimumInteritemSpacing * (columns - 1)
       let sectionInsets       = flowLayout.sectionInset.left + flowLayout.sectionInset.right
       let adjustedWidth       = collectionViewWidth - spaceBetweenCells - sectionInsets

       let width: CGFloat  = floor(adjustedWidth / columns)
       let height: CGFloat = width / 1.5
        
        let width = collectionView.bounds.width - 50
        let height = width / 1.5
        
        return CGSize(width: width, height: height)
    }
    
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
           let rows: CGFloat        = 2
    
           let collectionViewHeight = collectionView.bounds.height
           let flowLayout           = collectionViewLayout as! UICollectionViewFlowLayout
           let spacingBetweenCells  = flowLayout.minimumInteritemSpacing * (rows - 1)
           let adjustedHeight       = collectionViewHeight - spacingBetweenCells
    
           let height: CGFloat      = floor(adjustedHeight / rows)
    
           return CGSize(width: 100, height: height)
    
       }
}
