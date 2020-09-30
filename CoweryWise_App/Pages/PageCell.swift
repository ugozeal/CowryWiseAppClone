//
//  PageCell.swift
//  CoweryWise_App
//
//  Created by David U. Okonkwo on 9/28/20.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Pages? {
        didSet{
            guard let page = page else{ return }
            let imageName = page.imageName

            let color = UIColor(white: 0.2, alpha: 1)
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor: color])
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular), NSAttributedString.Key.foregroundColor: color]))
            let length = attributedText.string.count
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            textView.attributedText = attributedText
            imageView.image = UIImage(named: imageName)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        image.image = UIImage(named: "")
        image.clipsToBounds = true
        return image
    }()
   
    
    let textView: UITextView = {
       let titleText = UITextView()
        titleText.isEditable = false
        titleText.text = ""
        titleText.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        return titleText
    }()
    
    func setupViews(){
        backgroundColor = .white
        addSubview(imageView)
        addSubview(textView)
    

        _ = imageView.anchor(centerYAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: -200, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 100)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        textView.anchorWithConstantsToTop(centerYAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 30)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
