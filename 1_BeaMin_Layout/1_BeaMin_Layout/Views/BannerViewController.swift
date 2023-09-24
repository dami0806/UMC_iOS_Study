//
//  BannerViewController.swift
//  1_BeaMin_Layout
//
//  Created by 박다미 on 2023/09/24.
//

import UIKit
import SnapKit

//MARK: - BannerViewController
class BannerViewController: UIViewController {
    
//    private var imageView : UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
    private var imageView = UIImageView()
    private var imageViews: [UIImageView] = []
    let images = [UIImage(named: "배너 1"), UIImage(named: "배너 2"), UIImage(named: "배너 3"), UIImage(named: "배너 4"),UIImage(named: "배너 5"),UIImage(named: "배너 3"),UIImage(named: "배너 1") ]
    lazy var scrollView : UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isUserInteractionEnabled = false
        
        
        return scrollView
    }()
    
    private var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        
        
        addSubviews()
 
        
        scrollView.contentSize = CGSize(width: CGFloat(images.count + 1) * view.frame.width, height: view.frame.width*0.3)
        startSlider()
        
        
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        configureConstraints()
        for (index, image) in images.enumerated() {
            imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
            
            imageView.snp.makeConstraints { make in
                make.top.bottom.equalTo(scrollView)
                make.height.equalTo(scrollView.snp.height)
                make.width.equalToSuperview()
                if index == 0 {
                    // 첫 번째 이미지의 leading 제약은 0으로 설정
                    make.leading.equalToSuperview()
                } else {
                    make.leading.equalTo(imageViews[index - 1].snp.trailing)
                }// 이미지들을 가로로 붙임
            }
            imageViews.append(imageView)
        }
    }
    private func configureConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
    }
    
    func startSlider() {
        DispatchQueue.global().async {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                
                self.currentIndex += 1
                if self.currentIndex > self.imageViews.count - 1 {
                    self.currentIndex = 0
                    let xOffset: CGFloat = 0
                    
                    DispatchQueue.main.async {
                        
                        self.scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: false)
                    }
                } else {
                    DispatchQueue.main.async {
                        UIView.animate(withDuration: 0.5, animations: {
                            let xOffset = CGFloat(self.currentIndex) * self.view.frame.width
                            self.scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: false)
                        })
                        
                    }
                }
            }
            RunLoop.current.run()
        }
    }
    
}
