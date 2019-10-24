//
//  BaseCollectionView.swift
//  BoostContacts
//
//  Created by Jeelakarra Shyam on 21/10/19.
//  Copyright © 2019 Shyam. All rights reserved.
//

import UIKit

class BaseCollectionView<V: BaseCollectionCell<W>, W>: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    fileprivate let reusableCellId = NSStringFromClass(V.self)
    
    //MARK: - Property
    var scrollDirection: UICollectionView.ScrollDirection {
        return UICollectionView.ScrollDirection.vertical
    }
    
    lazy var baseCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        
        return cv
    }()
    
    var items = [W]()
    
    var isPullDownToRefreshEnabled = false { // setup refresh control
        didSet {
            if isPullDownToRefreshEnabled {
                baseCollectionView.refreshControl = UIRefreshControl()
                baseCollectionView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
            }
        }
    }
    
    //MARK: -
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if didSetupConstraints == false {
            didSetupConstraints = true
            
            setupConstraints()
        }
    }
    
    //MARK: - Custom Life Cycle
    fileprivate var didSetupConstraints = false
    func setupViews() {
        baseCollectionView.register(V.self, forCellWithReuseIdentifier: reusableCellId)
        
        baseCollectionView.dataSource = self
        baseCollectionView.delegate = self
        
        addSubview(baseCollectionView)
    }
    
    func setupConstraints() {
        baseCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            baseCollectionView.topAnchor.constraint(equalTo: self.safeTopAnchor, constant: 0),
            baseCollectionView.leadingAnchor.constraint(equalTo: self.safeLeadingAnchor, constant: 0),
            baseCollectionView.bottomAnchor.constraint(equalTo: self.safeBottomAnchor, constant: 0),
            baseCollectionView.trailingAnchor.constraint(equalTo: self.safeTrailingAnchor, constant: 0)
            ])
    }
    
    //MARK: -
    @objc func refreshData() { }
    
    func reloadData() { // call this to reload the list/collection view
        if isPullDownToRefreshEnabled {
            if (baseCollectionView.refreshControl?.isRefreshing)! {
                baseCollectionView.refreshControl?.endRefreshing()
            }
        }
        
        if items.count == 0 { // show background of the collection view (if available)
            baseCollectionView.backgroundView?.isHidden = false
        } else {
            baseCollectionView.backgroundView?.isHidden = true
        }
        
        baseCollectionView.reloadData()
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCellId, for: indexPath) as! BaseCollectionCell<W>
        cell.indexPath = indexPath
        cell.item = items[indexPath.row]
        
        return cell
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { }
    
}

//MARK: -
class BaseCollectionCell<W>: UICollectionViewCell {
    
    //MARK: - Property
    var indexPath: IndexPath! // index reference
    var item: W! // make a variable observable for this object to set the values of the object of the cell
    
    //MARK: -
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if didSetupConstraints == false {
            didSetupConstraints = true
            
            setupConstraints()
        }
    }
    
    //MARK: - Custom Life Cycle
    fileprivate var didSetupConstraints = false
    func setupViews() { }
    func setupConstraints() { }
    
}

