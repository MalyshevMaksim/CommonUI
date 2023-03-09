import UIKit

final class PageControlView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setNeedsDisplay()
    }

    override func draw(_ rect: CGRect) {
        guard numberOfPages > 0 else { return }
        drawDots(rect: rect)
    }

    override var intrinsicContentSize: CGSize {
        let distanceBetweenDots = CGFloat(numberOfPages - 1) * appearance.gapSize
        let dots = CGFloat(numberOfPages) * appearance.dotRadius * 2
        let width = dots + distanceBetweenDots + appearance.currentDotBorderWidth * 2
        let height = appearance.dotRadius * 2 + appearance.currentDotBorderWidth * 2
        return CGSize(width: width, height: height)
    }

    var appearance = Appearance() {
        didSet { setNeedsLayout() }
    }

    var numberOfPages: Int = 0 {
        didSet { setNeedsLayout() }
    }

    var currentPage: Int = 0 {
        didSet { setNeedsLayout() }
    }

    private func drawDots(rect: CGRect) {
        for index in 0..<numberOfPages {
            let xOffset = CGFloat(index) * (appearance.gapSize + appearance.dotRadius * 2)
            let yOffset = rect.height / 2

            let width = appearance.dotRadius + appearance.currentDotBorderWidth
            let radius = index == currentPage ? appearance.dotRadius + 1 : appearance.dotRadius

            let path = UIBezierPath(
                arcCenter: CGPoint(x: width + xOffset, y: yOffset),
                radius: radius,
                startAngle: 0,
                endAngle: .pi * 2,
                clockwise: true
            )

            if index == currentPage {
                appearance.color.set()
            } else {
                appearance.color.withAlphaComponent(appearance.dimFactor).set()
            }
            path.fill()
        }
    }
}

extension PageControlView {

    struct Appearance {
        let color: UIColor = .systemBlue
        let dimFactor: CGFloat = 0.3
        let dotRadius: CGFloat = 3
        let gapSize: CGFloat = 12
        let currentDotBorderWidth: CGFloat = 2.5
    }
}
