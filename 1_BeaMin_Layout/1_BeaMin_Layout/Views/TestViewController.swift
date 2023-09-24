//
//  TestViewController.swift
//  1_BeaMin_Layout
//
//  Created by 박다미 on 2023/09/23.
import UIKit
import SnapKit


class BannerViewController: UIViewController {
    var height = 0.0
    var width = 0.0
    lazy var scrollView : UIScrollView = {
  
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.tag = 1

        return scrollView
    }()
    
    private var imageViews: [UIImageView] = []
    private var currentIndex = 0
    
    private let currentIndexLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let totalImagesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        height = view.frame.height
        width = view.frame.width
        view.backgroundColor = .white
        
        let images = [UIImage(named: "배너"), UIImage(named: "배너 1"), UIImage(named: "배너 2"), UIImage(named: "배너 3"),UIImage(named: "배너 4"),UIImage(named: "배너 5"),UIImage(named: "배너") ].compactMap { $0 }
        
        
        
        addSubviews()
        
        
        for (index, image) in images.enumerated() {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            scrollView.addSubview(imageView)
            
            imageView.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(200)
                make.height.equalTo(100)
                make.leading.equalToSuperview().offset(CGFloat(index) * 200) // 이미지들을 가로로 붙임
            }
            
            imageViews.append(imageView)
        }
        
        scrollView.contentSize = CGSize(width: CGFloat(images.count + 1) * 200, height: 100)
        
        startSlider()
        
    }
    
    private func addSubviews() {  view.addSubview(scrollView)
        view.addSubview(currentIndexLabel)
        view.addSubview(totalImagesLabel)
        
        configureConstraints()
    }
    private func configureConstraints() {
        scrollView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        currentIndexLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.centerX.equalToSuperview()
        }
        
        totalImagesLabel.snp.makeConstraints { make in
            make.top.equalTo(currentIndexLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
    
    private func startSlider() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            
            // print("🍎🍎\(imageViews.count)")
            
            // 다음 페이지로 이동
            self.currentIndex += 1
            if currentIndex > imageViews.count-1 {
                //애니메이션 없이 확 바뀜
                
                currentIndex = 0
                let xOffset: CGFloat = 0
                scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: false)
            }
            
            
            else{
                UIView.animate(withDuration: 0.3, animations: {
                    print("🍎\(self.currentIndex)")
                    let xOffset = CGFloat(self.currentIndex) * 200
                    self.scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: false)
                    if (self.currentIndex) == 1{
                        sleep(UInt32(1.0))
                    }
                    else{
                        print("🍎🍎\(self.currentIndex)")
                        sleep(2)
                        // print("🍎\(self.currentIndex)")
                        
                    }
                    
                })
                
                
            }
            
        }
    }
}

