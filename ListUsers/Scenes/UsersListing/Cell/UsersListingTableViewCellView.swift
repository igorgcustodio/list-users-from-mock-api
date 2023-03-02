//
//  UsersListingTableViewCellView.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import UIKit
import AlamofireImage

// MARK: - ViewData

struct UsersListingViewData {
    let name: String
    let avatar: String
}

// MARK: - UsersListingTableViewCellTableViewCell

final class UsersListingTableViewCell: UITableViewCell, ReusableIdentifier {

    // MARK: - UI Properties

    private lazy var nameLabel: UILabel = .buildLabel(style: .subtitle, color: .color(.black))
    private lazy var avatar: UIImageView = .buildImageView(contentMode: .scaleAspectFill)
    private lazy var container: UIView = .emptyView

    // MARK: - Class Properties

    private var viewData: UsersListingViewData?

    // MARK: - LifeCycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }

    @available(*, unavailable)
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        avatar.af.cancelImageRequest()
        avatar.image = nil
    }

    // MARK: - Methods

    public func setup(with viewData: UsersListingViewData) {
        self.viewData = viewData
        nameLabel.text = viewData.name
        if let url = URL(string: viewData.avatar) {
            avatar.af.setImage(
                withURL: url,
                placeholderImage: .init(systemName: "person.fill"),
                imageTransition: .crossDissolve(Timing.Interval.time02)
            )
        }
    }
}

// MARK: - Setup

extension UsersListingTableViewCell: ViewCodeConfiguration {
    func setupViewHierarchy() {
        contentView.addSubview(container)
        container.addSubviews([
            nameLabel,
            avatar
        ])
    }

    func setupConstraints() {
        container.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(Layout.Margin.margin16)
            make.right.equalToSuperview().offset(-Layout.Margin.margin16)
            make.top.equalToSuperview().offset(Layout.Margin.margin8)
            make.bottom.equalToSuperview().offset(-Layout.Margin.margin8)
        }

        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatar.snp.right).offset(Layout.Margin.margin24)
            make.centerY.equalTo(avatar.snp.centerY)
        }

        avatar.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(Layout.Margin.margin24)
            make.top.equalToSuperview().offset(Layout.Margin.margin16)
            make.bottom.equalToSuperview().offset(-Layout.Margin.margin16)
            make.size.equalTo(CGSize(square: Layout.Height.height80))
        }
    }

    func configureViews() {
        selectionStyle = .none
        backgroundColor = .clear
        avatar.backgroundColor = .color(.gray01)
        avatar.cornerRadius(with: Layout.Height.height80.half)

        container.backgroundColor = .color(.gray02).withLuminosity(0.95)
        container.layer.cornerRadius = Layout.CornerRadius.radius8
        container.addShadow()
    }
}
