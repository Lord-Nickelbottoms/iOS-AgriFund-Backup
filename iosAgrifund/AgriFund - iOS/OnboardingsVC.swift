//
//  OnboardingsVC.swift
//  AgriFund - iOS
//
//  Created by DA MAC M1 117 on 2023/07/20.
//

import UIKit

class OnboardingsVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnGetStarted: UIButton!
    
    //Programmatic UI objects
    @IBOutlet weak var arrowIndicator: UILabel!
    
    var scrollWidth: CGFloat = 0.0
    var scrollHeight: CGFloat = 0.0
    //data for slides
    
    var titles = ["Bookkeeping Made Simple", "Get Funding", "Apply Directly"]
    var descriptions = ["We simplify your bookkeeping, making it easier for you to manage, while you focus on your farm.",
                        "Easily get the money you need with our simple funding process.", "Apply Directly. Hassle free."]
    
    //array of images in the assets
    var images = ["intro1", "intro2", "intro3"]
    
    //MARK: get dynamic width and height of the ScrollView and save it
    override func viewDidLayoutSubviews() {
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        
        
        //to call viewDidLayoutSubviews() and get dynamic width and height of scrollview
        self.view.layoutIfNeeded()
        
        self.scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        for index in 0..<titles.count{
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)
            
            let slide = UIView(frame: frame)
            
            //subviews
            let imageView = UIImageView.init(image: UIImage.init(named: images[index]))
            imageView.frame = CGRect(x: 0, y: 0, width: 135, height: 135)
            imageView.contentMode = .scaleAspectFit
            imageView.center = CGPoint(x: scrollWidth / 2, y: (scrollHeight / 2) - 50)
            
            let txt1 = UILabel.init(frame: CGRect(x: 18, y: imageView.frame.maxY + 15, width: scrollWidth - 34, height: 30))
            txt1.font = UIFont(name: "Avenir Heavy", size: 21)
            txt1.textAlignment = .center
            txt1.textColor = UIColor(red: 255, green: 242, blue: 233, alpha: 100)
            txt1.text = titles[index]
            
            let txt2 = UILabel.init(frame: CGRect(x: 22, y: txt1.frame.maxY + 10, width: 275, height: 65))
            txt2.font = UIFont(name: "Avenir Light", size: 15.0)
            txt2.textAlignment = .center
            txt2.textColor = UIColor(red: 255, green: 242, blue: 233, alpha: 100)
            txt2.numberOfLines = .max
            txt2.text = descriptions[index]
            
            slide.addSubview(imageView)
            slide.addSubview(txt1)
            slide.addSubview(txt2)
            scrollView.addSubview(slide)
            
            scrollView.layer.cornerRadius = CGFloat(20)
        }
        
        //set width of scrollview to accomodate all the slides
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)
        
        //disable vertical scroll/bounce
        self.scrollView.contentSize.height = 1.0
        
        //initial state
        pageControl.numberOfPages = titles.count
        pageControl.currentPage = 0
    }
    
    //indicator
    @IBAction func pageChanged(_ sender: Any) {
        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndicatorForCurrentPage()
    }
    
    func setIndicatorForCurrentPage()  {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
        
        if pageControl.currentPage == 2{
            arrowIndicator.layer.opacity = 0.0
            btnGetStarted.setTitle("Get Started →", for: .normal)
            btnGetStarted.titleLabel?.textAlignment = .center
            btnGetStarted.titleLabel?.numberOfLines = 1
        }
        else{
            arrowIndicator.layer.opacity = 1.0
            btnGetStarted.setTitle("Skip", for: .normal)
        }
    }
    
}
