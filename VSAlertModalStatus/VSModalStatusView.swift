//
//  VSModalStatusView.swift
//  VSAlertModalStatus
//
//  Created by Steve Scerri on 01/03/2019.
//  Copyright © 2019 Vioside. All rights reserved.
//

import UIKit

public class VSModalStatusView: UIView {
    
    //MARK: - Outlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    //MARK: - Variables
    let nibName = "VSModalStatusView"
    var contentView: UIView!
    var timer = Timer()
    var duration:TimeInterval = 0.10
    
    //MARK: - Set Up View
    public override init(frame: CGRect) {
        // For use in code
        super.init(frame: frame)
        setUpView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        // For use in Interface Builder
        super.init(coder: aDecoder)
        setUpView()
    }
    
    // Allow view to control itself
    public override func layoutSubviews() {
        // Rounded corners
        self.layoutIfNeeded()
        self.contentView.layer.masksToBounds = true
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 10
    }
    
    private func setUpView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView{
            
            self.contentView = view
            addSubview(contentView)
            
            contentView.center = self.center
            contentView.autoresizingMask = []
            contentView.translatesAutoresizingMaskIntoConstraints = true
            
            titleLabel.text = ""
            subtitleLabel.text = ""
            
        }
    }
    
    public static func displayAlertStatusIn(controller:UIViewController, image:UIImage, title:String, subtitle:String, duration:TimeInterval?){
        
        let view = VSModalStatusView(frame: controller.view.frame)
        
        if let d = duration{
            view.duration = d
        }
        
        view.titleLabel.text = title
        view.subtitleLabel.text = subtitle
        view.imageView.image = image
        
        controller.view.addSubview(view)
        
    }
    
    public override func didMoveToSuperview() {
        // Fade in when added to superview
        // Then add a timer to remove the view
        self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: duration, animations: {
            self.contentView.alpha = 1.0
            self.contentView.transform = CGAffineTransform.identity
        }) { (success) in
            self.timer = Timer.scheduledTimer(
                timeInterval: TimeInterval(3.0),
                target: self,
                selector: #selector(self.removeSelf),
                userInfo: nil,
                repeats: false)
        }
        
    }
    @objc private func removeSelf() {
        // Animate removal of view
        UIView.animate(
            withDuration: duration,
            animations: {
                self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.contentView.alpha = 0.0
        }) { _ in
            self.removeFromSuperview()
        }
    }
}
