//
//  ViewController.swift
//  sparrowScroll
//
//  Created by Никита Курюмов on 20.03.23.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let scrollView = UIScrollView()
    let imageView = UIImageView(image: UIImage(named: "planetExpo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        scrollView.addSubview(imageView)
        

        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.bounds.width, height: imageView.bounds.height)
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)

        scrollView.maximumZoomScale = 1.5
        scrollView.minimumZoomScale = 1.0
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let imageHeight: CGFloat = 270.0
        let yOffset = scrollView.contentOffset.y
        var imageFrame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: imageHeight)
        if yOffset < 0 {
            imageFrame.origin.y = yOffset
            imageFrame.size.height -= yOffset
        }
        else {
            imageFrame.origin.y = -yOffset
        }
        scrollView.subviews.first?.frame = imageFrame
        scrollView.verticalScrollIndicatorInsets.top = imageFrame.height - 45
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

