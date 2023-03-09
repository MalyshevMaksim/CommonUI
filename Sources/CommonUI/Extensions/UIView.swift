import UIKit

public extension UIView {
    func addSubviews(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}

extension UIView {
    var snapshot: UIImage? {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        let image = renderer.image { context in
            layer.render(in: context.cgContext)
        }
        return image
    }
}
