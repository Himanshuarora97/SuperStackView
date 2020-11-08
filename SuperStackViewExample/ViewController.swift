//
//  ViewController.swift
//  SuperStackViewExample
//
//  Created by Himanshu Arora on 08/11/20.
//

import UIKit
import SuperStackView

class ViewController: UIViewController {

    
    private lazy var hStackView: SuperStackView = {
        let stackView = SuperStackView()
        stackView.backgroundColor = .gray
        stackView.stack.axis = .horizontal
//        stackView.stack.alignment = .bottom
        stackView.separatorHeight = 2
        stackView.separatorColor = .black
        stackView.rowInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        stackView.separatorInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        stackView.automaticallyHidesLastSeparator = true
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        let redDummy = DummyBoxView(width: 40, height: 40, color: .red)
        let greenDummy = DummyBoxView(width: 30, height: 80, color: .green)
        let blueDummy = DummyBoxView(width: 80, height: 30, color: .systemBlue)
        
        hStackView.addRow(redDummy, positionalType: .top)
        hStackView.addRow(greenDummy)
        hStackView.addRow(blueDummy, positionalType: .top)
        
        self.view.addSubview(hStackView)
        
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        
//        hStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
//        hStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        hStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        hStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }


}



extension UIView {
    func addPinedSubview(_ otherView: UIView) {
        addSubview(otherView)
        otherView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            otherView.trailingAnchor.constraint(equalTo: trailingAnchor),
            otherView.topAnchor.constraint(equalTo: topAnchor),
            otherView.heightAnchor.constraint(equalTo: heightAnchor),
            otherView.widthAnchor.constraint(equalTo: widthAnchor),
        ])
    }
}


class DummyBoxView: UIView {
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()

    convenience init(width: CGFloat, height: CGFloat, color: UIColor) {
        self.init(size: CGSize(width: width, height: height), color: color)
    }

    init(size: CGSize, color: UIColor) {
        let scaledSize = CGSize(width: size.width, height: size.height)
        let rect = CGRect(origin: .zero, size: scaledSize)
        super.init(frame: rect)
        addPinedSubview(label)
        label.text = "\(Int(size.width)/10)×\(Int(size.height)/10)"
        backgroundColor = color
    }

    override var intrinsicContentSize: CGSize {
        return frame.size
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
