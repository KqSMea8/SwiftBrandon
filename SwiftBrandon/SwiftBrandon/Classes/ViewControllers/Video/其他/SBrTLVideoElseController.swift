//
//  SBrTLVideoElseController.swift
//  SwiftBrandon
//
//  Created by 朱玉辉 on 2019/3/12.
//  Copyright © 2019年 yuhuiMr. All rights reserved.
//

import UIKit
import JXSegmentedView
import MJRefresh
import Kingfisher
class SBrTLVideoElseController: SBrBaseViewController {
    var vos:SBVMCategoryVos?
    
    var feedModels:[SBVMFeedModel] = []
    lazy var viewModel: SBrVideoViewModel = {
        return SBrVideoViewModel()
    }()
    
    
    
    // 推荐直播
    private let LBFMHomeRecommendLiveCellID   = "SBrTLVideoElseCell"
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let collection = UICollectionView.init(frame:.zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = kBackgroundColor
        // - 注册头视图和尾视图
//        collection.register(LBFMRecommendHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: LBFMRecommendHeaderViewID)
//        collection.register(LBFMRecommendFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: LBFMRecommendFooterViewID)
        // - 注册不同分区cell
        collection.register(UINib.init(nibName: "SBrTLVideoElseCell", bundle: nil), forCellWithReuseIdentifier: LBFMHomeRecommendLiveCellID)
        
        // - 设置头部尾部
        collection.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(headerRefresh))
        collection.mj_footer = MJRefreshBackFooter.init(refreshingTarget: self, refreshingAction: #selector(footerRefresh))
        return collection
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 添加滑动视图
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        self.collectionView.mj_header.beginRefreshing()

        
//        self.collectionView.layer.borderColor = UIColor.red.cgColor
//        self.collectionView.layer.borderWidth = 2
    }
    
    @objc func headerRefresh(){
        reqNetData()
    }
    
    @objc func footerRefresh(){
        reqNetData()
    }
    func reqNetData(){
        viewModel.reqTuijianLocalData {[weak self] (datas) in
            self?.feedModels.append(contentsOf: datas)
            self?.collectionView.reloadData()
            self?.collectionView.mj_header.endRefreshing()
            self?.collectionView.mj_footer.endRefreshing()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        DDLogInfo("\(self)")
    }

}
extension SBrTLVideoElseController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
    
    
}

// - collectionviewDelegate
extension SBrTLVideoElseController: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.feedModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let feedVo:SBVMFeedModel? = self.feedModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LBFMHomeRecommendLiveCellID, for: indexPath) as! SBrTLVideoElseCell
        
        cell.feedImageView.sd_setImage(with: URL(string: feedVo?.middle_image?.url ?? ""), completed: nil)
        cell.userAvatarImageView.sd_setImage(with: URL(string: feedVo?.user_info?.avatar_url ?? ""), completed: nil)
        
//        cell.feedImageView.kf.setImage(with: URL(string: feedVo?.middle_image?.url ?? ""))
//        cell.userAvatarImageView.kf.setImage(with: URL(string: feedVo?.user_info?.avatar_url ?? ""))
        cell.feedTitleL.text = feedVo?.title
        cell.userNameL.text = feedVo?.user_info?.name
        
        print(feedVo?.middle_image?.url ?? "??????????????????")
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    // 每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
    }
    
    // 最小 item 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
        
    }
    
    // 最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }
    
    //item 的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellH = (kScreenWidth / (1240/695.0)) + 44
        return CGSize.init(width:kScreenWidth,height: cellH)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
        
    }
}
