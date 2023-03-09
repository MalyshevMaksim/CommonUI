//
//  File.swift
//  
//
//  Created by m.malyshev on 09.03.2023.
//

import UIKit

public class ShimeringButton: UIButton {
    
    public func startShimmeringAnimation() {
        let snapshot = self.snapshot?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: snapshot)
        imageView.frame = frame

        imageView.tintColor = UIColor(white: 0.9, alpha: 0.3)
        guard let image = imageView.snapshot  else { return }

        let width = frame.width
        let height = frame.height

        let shimmeringLayer = CALayer()
        shimmeringLayer.contents = image.cgImage
        shimmeringLayer.frame = bounds

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor, UIColor.clear.cgColor,
            UIColor.black.cgColor, UIColor.clear.cgColor,
            UIColor.clear.cgColor
        ]

        gradientLayer.locations = [0.0, 0.35, 0.50, 0.65, 0.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)

        gradientLayer.frame = CGRect(x: -width, y: 0, width: width, height: height)

        let animation = CABasicAnimation(keyPath: "position.x")
        animation.byValue = width * 2
        animation.duration = 2
        animation.repeatCount = .greatestFiniteMagnitude
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)

        layer.addSublayer(shimmeringLayer)
        shimmeringLayer.mask = gradientLayer
        gradientLayer.add(animation, forKey: "shine")
    }

    public func stopShimmeringAnimation() {
        layer.sublayers?.forEach {
            $0.mask?.removeAnimation(forKey: "shine")
        }
    }
}
