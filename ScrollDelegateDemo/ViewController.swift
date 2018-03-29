//
//  ViewController.swift
//  ScrollDelegateDemo
//
//  Created by leezb101 on 2018/3/29.
//  Copyright © 2018年 luohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {[weak self] in
        let result = UIScrollView()
        result.backgroundColor = .red
        return result
    }()
    var scrollDelegate: LYQScrollViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.scrollView)
        scrollView.frame = self.view.frame
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 2)
        self.scrollDelegate = LYQScrollViewDelegate.delegateWith(endDeceleratingEvent: { (scroll) in
            print(scroll.contentOffset)
        }, didScrollEvent: { (scroll) in
            print("我被滑动了")
        })
        scrollView.delegate = scrollDelegate
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

