//
//  Copyright © 2018 Alexander Yalchik. All rights reserved.
//

import UIKit

class XibLoadableView: UIView {

    private weak var containerView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    private func xibSetup() {
        containerView = self.loadViewFromNib()
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        containerView.clipsToBounds = true
        addSubview(containerView)
        configureView()
    }

    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib.init(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layoutSubviews()
    }

    func configureView() {
        // Could be overriden by child classes
    }
}
