//
//  ImageViewController.swift
//  CodingEducation
//
//  Created by hyerikim on 05/01/2019.
//  Copyright © 2019 hyerikim. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController , UIScrollViewDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var myImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        imageView.image = myImage
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
