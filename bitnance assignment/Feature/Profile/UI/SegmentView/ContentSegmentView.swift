//
//  ContentSegmentView.swift
//  bitnance assignment
//
//  Created by Wisarut Multhonggad on 5/1/21.
//

import UIKit

protocol ProfileInfoSectionViewDelegate: AnyObject {
    func profileInfoSelect(infoType: ProfileInfoType)
}

class ContentSegmentView: UIView {

    @IBOutlet weak var segment: UISegmentedControl!
    weak var delegate: ProfileInfoSectionViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let view = Bundle.main.loadNibNamed("ContentSegmentView", owner: self, options: nil)![0] as! UIView
        view.backgroundColor = UIColor.systemBackground
        view.clipsToBounds = true
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.addSubview(view)
        settingInterface()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let view = Bundle.main.loadNibNamed("ContentSegmentView", owner: self, options: nil)![0] as! UIView
        view.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        view.backgroundColor = UIColor.systemBackground
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.addSubview(view)
        settingInterface()
    }
    
    fileprivate func settingInterface() {
    }
    
    @IBAction func informationDidSelect(_ segment: UISegmentedControl) {
        let informationType = ProfileInfoType(rawValue: segment.selectedSegmentIndex)
        delegate?.profileInfoSelect(infoType: informationType ?? .list)
    }
}
