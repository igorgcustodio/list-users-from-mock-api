//
//  GetServerView.swift
//  ListUsers
//
//  Created by Igor Custodio on 27/02/23.
//

import UIKit
import SnapKit

final class GetServerView: UIView {

    private lazy var titleLabel: UILabel = .buildLabel(style: .title, color: .color(.black), numberOfLines: .zero, text: "Enter the server address")
    private(set) lazy var textField: UITextField = .buildTextField(placeholder: "e.g. https://google.com")
    private(set) lazy var button: UIButton = .buildButton(with: "Next", style: .primary)

    init() {
        super.init(frame: .zero)
        setupViewCode()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension GetServerView: ViewCodeConfiguration {
    func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(textField)
        addSubview(button)
    }

    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview().inset(Layout.Margin.margin16)
        }

        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Layout.Margin.margin16)
            make.horizontalEdges.equalToSuperview().inset(Layout.Margin.margin16)
        }

        button.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(Layout.Margin.margin32)
            make.horizontalEdges.equalToSuperview().inset(Layout.Margin.margin16)
            make.height.equalTo(Layout.Height.height52)
        }
    }

    func configureViews() {
        backgroundColor = .color(.white)
    }
}
