//
//  ProgressView.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 30/01/22.
//

import UIKit

class ProgressView: UIView {
    
    private(set) var isAnimating: Bool = false {
        didSet {
            if isAnimating {
                self.animateStroke()
                self.animateRotation()
            } else {
                self.shapeLayer.removeFromSuperlayer()
                self.layer.removeAllAnimations()
            }
        }
    }
    
    // 1
    init(frame: CGRect,
         colors: [UIColor],
         lineWidth: CGFloat
    ) {
        self.colors = colors
        self.lineWidth = lineWidth
        
        super.init(frame: frame)
        
        self.backgroundColor = .clear
    }
    
    // 2
    convenience init(colors: [UIColor], lineWidth: CGFloat) {
        self.init(frame: .zero, colors: colors, lineWidth: lineWidth)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.width / 2
        
        // 3
        let path = UIBezierPath(
            ovalIn: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.width)
        )
        
        shapeLayer.path = path.cgPath
    }
    
    // 4
    private let colors: [UIColor]
    private let lineWidth: CGFloat
    
    // 5
    private lazy var shapeLayer: ProgressShapeLayer = {
        return ProgressShapeLayer(strokeColor: colors.first!, lineWidth: lineWidth)
    }()
    
    // MARK: - Animations
    private func animateStroke() {
        let startAnimation = StrokeAnimation(
            type: .start,
            beginTime: 0.25,
            fromValue: 0.0,
            toValue: 1.0,
            duration: 0.75
        )
        
        let endAnimation = StrokeAnimation(
            type: .end,
            fromValue: 0.0,
            toValue: 1.0,
            duration: 0.75
        )
        
        let strokeAnimationGroup = CAAnimationGroup()
        strokeAnimationGroup.duration = 1
        strokeAnimationGroup.repeatDuration = .infinity
        strokeAnimationGroup.animations = [startAnimation, endAnimation]
        
        shapeLayer.add(strokeAnimationGroup, forKey: nil)
        
        let colorAnimation = StrokeColorAnimation(
            colors: colors.map { $0.cgColor },
            duration: strokeAnimationGroup.duration * Double(colors.count)
        )
        
        shapeLayer.add(colorAnimation, forKey: nil)
        
        self.layer.addSublayer(shapeLayer)
    }
    
    private func animateRotation() {
        let rotationAnimation = RotationAnimation(
            direction: .z,
            fromValue: 0,
            toValue: CGFloat.pi * 2,
            duration: 2,
            repeatCount: .greatestFiniteMagnitude
        )
        
        self.layer.add(rotationAnimation, forKey: nil)
    }
    
    func showLoading(_ from: UIViewController) {
        showLoading(from.view)
    }
    
    func showLoading(_ from: UIView) {
        from.addSubview(self)
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: from.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: from.centerYAnchor),
            self.widthAnchor.constraint(equalToConstant: 20),
            self.heightAnchor.constraint(equalTo: self.widthAnchor)
        ])
        start()
    }
    
    func start() {
        isAnimating = true
    }
    
    func stop() {
        isAnimating = false
    }

}
