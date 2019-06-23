//
//  BloodGroupsCollectionView.swift
//  TreiVieti
//
//  Created by Ifrim Alexandru on 6/23/19.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

import UIKit

class BloodGroupsCollectionView : UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    var bloodGroups: [BloodGroupModel]
    static let reuseIdentifier = "bloodGroup"
    
    required init?(coder aDecoder: NSCoder) {
        self.bloodGroups = [BloodGroupModel("A", fillPercentage: 22)
            , BloodGroupModel("B", fillPercentage: 17)
            , BloodGroupModel("AB", fillPercentage: 65)
            , BloodGroupModel("0", fillPercentage: 7)]
        
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = UIColor.clear
        self.clipsToBounds = false
        self.register(BloodGroupCell.self, forCellWithReuseIdentifier: BloodGroupsCollectionView.reuseIdentifier)
        self.dataSource = self;
        self.delegate = self;
    }
    
    
    // MARK: UICollectionViewDelegate/DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.bloodGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : BloodGroupCell = collectionView.dequeueReusableCell(withReuseIdentifier: BloodGroupsCollectionView.reuseIdentifier, for: indexPath) as! BloodGroupCell
        cell.record = bloodGroups[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 81, height: collectionView.frame.size.height)
    }
    
}
