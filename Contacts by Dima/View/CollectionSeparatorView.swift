//
//  CollectionSeparatorView.swift
//  Contacts by Dima
//
//  Created by DiMa on 29/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class CollectionSeparatorView: UICollectionReusableView {
    
    static let reusableIdentifier = "CollectionSeparatorView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        frame = layoutAttributes.frame
    }
}
