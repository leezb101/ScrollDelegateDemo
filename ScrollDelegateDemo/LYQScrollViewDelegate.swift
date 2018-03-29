//
//  LYQScrollViewDelegate.swift
//  ScrollDelegateDemo
//
//  Created by leezb101 on 2018/3/29.
//  Copyright © 2018年 luohe. All rights reserved.
//

import Foundation
import UIKit

class LYQScrollViewDelegate: NSObject, UIScrollViewDelegate {

    typealias LYQScrollDelegateEventType = (UIScrollView) -> Void

    var didEndDeceleratingEvent: LYQScrollDelegateEventType?
    var didScrollEvent: LYQScrollDelegateEventType?

    
    class func delegateWith(endDeceleratingEvent: LYQScrollDelegateEventType? = nil, didScrollEvent: LYQScrollDelegateEventType? = nil) -> LYQScrollViewDelegate {
        let delegate = LYQScrollViewDelegate()
        delegate.didEndDeceleratingEvent = endDeceleratingEvent
        delegate.didScrollEvent = didScrollEvent
        return delegate
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let endEvent = self.didEndDeceleratingEvent {
            endEvent(scrollView)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let didScroll = didScrollEvent {
            didScroll(scrollView)
        }
    }

}
