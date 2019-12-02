//
//  ViewController.swift
//  ScrollProject
//
//  Created by dirtbag on 11/25/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet private weak var scrollView: UIScrollView!
    
    @IBOutlet private weak var imagePager: UIPageControl!
    
    var imageStrings = ["theForce"]
    //var slides = [Slide]()
    var slides = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        
        setupScrollView()
    }
    
    private func setupScrollView() {

        //createSlides()
        createImageViews()
        
        setupScrollView(slides: slides)
        
        imagePager.numberOfPages = slides.count
        imagePager.currentPage = 0
        
        view.bringSubviewToFront(imagePager)
    }

    private func createImageViews() {
        createSlide(named: "christmasYoda")
        createSlide(named: "theForce")
        createSlide(named: "carrierYoda")
        createSlide(named: "sleepingYoda")
       createSlide(named: "bountyOnBoard")
    }
    
    private func createSlide(named: String) {
        let image = UIImage(named: named)
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        slides.append(imageView)
    }
    
    private func createSlides() {
        
        /*
        var slide: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        var image = UIImage(named: "theForce")
        slide.imageView.image = image
        slide.lblWidth.text = "w: \(String(describing: image?.size.width))"
        slide.lblHeight.text = "h: \(String(describing: image?.size.width))"
        
        slides.append(slide)
        
        slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        image = UIImage(named: "bountyOnBoard")
        slide.lblWidth.text = "w: \(String(describing: image?.size.width))"
        slide.lblHeight.text = "h: \(String(describing: image?.size.width))"
        
        slides.append(slide)
*/
    }

    private func setupScrollView(slides: [UIImageView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * CGFloat(slides.count))
        scrollView.isPagingEnabled = true
        //scrollView.fle
        for index in 0..<slides.count {
            slides[index].frame = CGRect(x: 0,
                                         y: view.frame.height * CGFloat(index),
                                         width: view.frame.width,
                                         height: view.frame.height)
            scrollView.addSubview(slides[index])
        }
    }

    /// round position to decide which page to settle on
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.y / view.frame.height)
        imagePager.currentPage = Int(pageIndex)
    }
}
