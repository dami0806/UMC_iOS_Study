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
    var imageView = UIImageView()

    lazy var scrollView : UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isUserInteractionEnabled = false

        
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
       
        view.backgroundColor = .clear
        
        let images = [UIImage(named: "배너 1"), UIImage(named: "배너 2"), UIImage(named: "배너 3"), UIImage(named: "배너 4"),UIImage(named: "배너 5"),UIImage(named: "배너 3"),UIImage(named: "배너 1") ]
        
        addSubviews()
        
        
        for (index, image) in images.enumerated() {
            imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true

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
            print("🍉🍎\(CGFloat(index))")
            imageViews.append(imageView)
        }
        
        scrollView.contentSize = CGSize(width: CGFloat(images.count + 1) * view.frame.width, height: view.frame.width*0.3)
        print("🍉🍎\(self.imageView.frame.width)")
        print("🍉🍎\(self.view.frame.width)")
        startSlider()
        
        
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        view.addSubview(currentIndexLabel)
        view.addSubview(totalImagesLabel)
        
        configureConstraints()
    }
    private func configureConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
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
    
    func startSlider() {
        print("🍉🍎\(self.imageView.frame.width)")
        print("🍉🍎\(self.view.frame.width)")
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
//        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
//            guard let self = self else { return }
//
//
//            // print("🍎🍎\(imageViews.count)")
//
//            // 다음 페이지로 이동
//            self.currentIndex += 1
//            if currentIndex > imageViews.count-1 {
//                //애니메이션 없이 확 바뀜
//
//                currentIndex = 0
//                let xOffset: CGFloat = 0
//                scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: false)
//            }
//
//
//            else{
//                UIView.animate(withDuration: 0.3, animations: {
//                    print("🍎\(self.currentIndex)")
//                    let xOffset = CGFloat(self.currentIndex) * 200
//                    self.scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: false)
//                    if (self.currentIndex) == 1{
//                        sleep(UInt32(1.0))
//                    }
//                    else{
//                        print("🍎🍎\(self.currentIndex)")
//                        sleep(2)
//                        // print("🍎\(self.currentIndex)")
//
//                    }
//
//                })
//
//
//            }
//
//        }
//    }
//}
//
