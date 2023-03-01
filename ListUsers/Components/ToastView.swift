//
//  ToastView.swift
//  ListUsers
//
//  Created by Igor Custodio on 01/03/23.
//

import UIKit
import SnapKit

final class ToastView: UIView {

    struct Content {
        let text: String
    }


    // MARK: - Views

    private lazy var descriptionLabel: UILabel = .buildLabel(style: .description, color: .color(.white), text: content.text)
    private lazy var container: UIView = buildContainer()

    // MARK: - Properties

    private var content: Content

    // MARK: - Lifecycle

    init(content: Content, frame: CGRect) {
        self.content = content
        super.init(frame: frame)
        setupViewCode()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View code

extension ToastView: ViewCodeConfiguration {
    func setupViewHierarchy() {
        addSubview(container)
        container.addSubview(descriptionLabel)
    }

    func setupConstraints() {
        container.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalToSuperview()
        }

        descriptionLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().offset(16)
        }
    }
}

// MARK: - View builders

extension ToastView {
    private func buildContainer() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .color(.black)
        return view
    }
}

