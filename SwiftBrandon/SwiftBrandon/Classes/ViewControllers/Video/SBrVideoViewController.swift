
//
//  SBrVideoViewController.swift
//  SwiftBrandon
//
//  Created by 朱玉辉 on 2019/3/12.
//  Copyright © 2019年 yuhuiMr. All rights reserved.
//

import UIKit
import JXSegmentedView

class SBrVideoViewController: SBrBaseViewController {
    var segmentedDataSource: JXSegmentedBaseDataSource?
    let segmentedView = JXSegmentedView()
    lazy var listContainerView: JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(dataSource: self)
    }()
    lazy var viewModel: SBrVideoViewModel! = {
        return SBrVideoViewModel()
    }()
    lazy var segmentTitlesModels:[SBVMCategoryVos]! = {
        var voss = [SBVMCategoryVos]()
        viewModel.reqCategoryLocalData(callback: { (list) in
            voss = list
        })
        return voss
    }()
    lazy var segmentTitles:[String] = {
        var titles = [String]()
        for item in segmentTitlesModels{
            var vos:SBVMCategoryVos? = item
            if let name = vos?.name{
                titles.append(name)
            }
        }
        return titles
    }()
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //segmentedViewDataSource一定要通过属性强持有！！！！！！！！！
        segmentedView.dataSource = segmentedDataSource
        segmentedView.delegate = self
        segmentedView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50)
        view.addSubview(segmentedView)
        
        segmentedView.contentScrollView = listContainerView.scrollView
        listContainerView.didAppearPercent = 0.01
        view.addSubview(listContainerView)
        
        print(segmentTitles)

        
        
        
//        let titles = ["猴哥", "青蛙王子", "旺财", "粉红猪", "喜羊羊", "黄焖鸡", "小马哥", "牛魔王", "大象先生", "神龙"]
        //配置数据源
        let dataSource = JXSegmentedTitleDataSource()
        dataSource.isTitleColorGradientEnabled = true
        dataSource.titles = segmentTitles
        //reloadData(selectedIndex:)一定要调用
        dataSource.reloadData(selectedIndex: 0)
        segmentedDataSource = dataSource
        segmentedView.dataSource = segmentedDataSource
        
        //配置指示器
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = 20
        segmentedView.indicators = [indicator]

        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //处于第一个item的时候，才允许屏幕边缘手势返回
        navigationController?.interactivePopGestureRecognizer?.isEnabled = (segmentedView.selectedIndex == 0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //离开页面的时候，需要恢复屏幕边缘手势，不能影响其他页面
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        listContainerView.frame = CGRect(x: 0, y: 50, width: view.bounds.size.width, height: view.bounds.size.height - 50)
    }
    
    
}

extension SBrVideoViewController: JXSegmentedViewDelegate {
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        if let dotDataSource = segmentedDataSource as? JXSegmentedDotDataSource {
            //先更新数据源的数据
            dotDataSource.dotStates[index] = false
            //再调用reloadItem(at: index)
            segmentedView.reloadItem(at: index)
        }
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = (segmentedView.selectedIndex == 0)
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        //传递didClickSelectedItemAt事件给listContainerView，必须调用！！！
        listContainerView.didClickSelectedItem(at: index)
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
        //传递scrollingFrom事件给listContainerView，必须调用！！！
        listContainerView.segmentedViewScrolling(from: leftIndex, to: rightIndex, percent: percent, selectedIndex: segmentedView.selectedIndex)
    }
}

extension SBrVideoViewController: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        if let titleDataSource = segmentedView.dataSource as? JXSegmentedBaseDataSource {
            return titleDataSource.dataSource.count
        }
        return 0
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        
        let vos:SBVMCategoryVos! = segmentTitlesModels[index]
        switch vos.name {
        case "关注":
            let tarvc = SBrTLVideoAttentionController()
            tarvc.vos = vos
            return tarvc
        case "直播":
            let tarvc = SBrTLVideoLiveController()
            tarvc.vos = vos
            return tarvc
        default:
            let tarvc = SBrTLVideoElseController()
            tarvc.vos = vos
            return tarvc
        }
    }
}



