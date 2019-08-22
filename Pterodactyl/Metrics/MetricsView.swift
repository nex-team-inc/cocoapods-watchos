//
//  LandingView.swift
//  Pterodactyl
//
//  Created by Austin Kwong on 8/9/19.
//  Copyright © 2019 Austin Kwong. All rights reserved.
//

import Foundation
import UIKit

protocol MetricsViewDelegate: NSObjectProtocol {
    func view(_ sender: MetricsView, resetPressed: UIButton)
    func view(_ sender: MetricsView, addMissPressed: UIButton)
    func view(_ sender: MetricsView, addMakePressed: UIButton)
}

class MetricsView: BaseView {

    private struct Container {

    }
    private struct DebugLabel {
        static let fontSize = CGFloat(14)
        static let numberOfLines = 0
    }
    private struct MessageLabel {
        static let fontSize = CGFloat(10)
        static let numberOfLines = 0
    }
    private struct MetricsLabel {
        static let height = CGFloat(60)
        static let fontSize = CGFloat(50)
    }

    private struct SubtitleLabel {
        static let height = CGFloat(30)
        static let fontSize = CGFloat(25)
    }

    private struct ButtonsContainer {
        static let spacing = CGFloat(10)
    }

    private struct Button {
        static let size = CGSize(width: 60, height: 40)
        static let cornerRadius = CGFloat(5)
    }

    weak var delegate: MetricsViewDelegate?

    var debugLabelText: String? {
        didSet {
            debugLabel.text = debugLabelText
        }
    }

    var messageLabelText: String? {
        didSet {
            messageLabel.text = messageLabelText
        }
    }

    private let debugLabel = UILabel.newAutoLayout()
    private let messageLabel = UILabel.newAutoLayout()
    private let container = UIStackView.newAutoLayout()
    private let metricsLabel = UILabel.newAutoLayout()
    private let subtitleLabel = UILabel.newAutoLayout()
    private let buttonsContainer = UIStackView.newAutoLayout()
    private let resetButton = UIButton.newAutoLayout()
    private let addMissButton = UIButton.newAutoLayout()
    private let addMakeButton = UIButton.newAutoLayout()

    override func setup() {
        super.setup()

        backgroundColor = ColorScheme.white

        debugLabel.font = UIFont.getFont(.raptorsSemibold, fontSize: DebugLabel.fontSize)
        debugLabel.numberOfLines = DebugLabel.numberOfLines
        debugLabel.textAlignment = .center

        messageLabel.font = UIFont.getFont(.raptorsSemibold, fontSize: MessageLabel.fontSize)
        messageLabel.numberOfLines = MessageLabel.numberOfLines
        messageLabel.textAlignment = .center

        container.alignment = .center
        container.axis = .vertical

        metricsLabel.font = UIFont.getFont(.raptorsSemibold, fontSize: MetricsLabel.fontSize)
        subtitleLabel.font = UIFont.getFont(.raptorsSemibold, fontSize: SubtitleLabel.fontSize)

        buttonsContainer.alignment = .center
        buttonsContainer.axis = .horizontal
        buttonsContainer.spacing = ButtonsContainer.spacing

        resetButton.setTitle("Reset", for: .normal)
        resetButton.layer.cornerRadius = Button.cornerRadius
        resetButton.backgroundColor = ColorScheme.destructiveRed
        resetButton.addTarget(self, action: #selector(resetPressed(_:)), for: .touchUpInside)

        addMissButton.setTitle("Miss", for: .normal)
        addMissButton.layer.cornerRadius = Button.cornerRadius
        addMissButton.backgroundColor = ColorScheme.purpleRed
        addMissButton.addTarget(self, action: #selector(addMissPressed(_:)), for: .touchUpInside)

        addMakeButton.setTitle("Make", for: .normal)
        addMakeButton.layer.cornerRadius = Button.cornerRadius
        addMakeButton.backgroundColor = ColorScheme.grassGreen
        addMakeButton.addTarget(self, action: #selector(addMakePressed(_:)), for: .touchUpInside)
    }

    override func setupLayer() {
        super.setupLayer()

        addSubview(debugLabel)
        addSubview(messageLabel)
        addSubview(container)

        container.addArrangedSubview(metricsLabel)
        container.addArrangedSubview(subtitleLabel)

        container.addArrangedSubview(buttonsContainer)
        buttonsContainer.addArrangedSubview(resetButton)
        buttonsContainer.addArrangedSubview(addMissButton)
        buttonsContainer.addArrangedSubview(addMakeButton)
    }

    override func setupConstraints() {
        super.setupConstraints()

        debugLabel.autoPinEdgesToSuperviewSafeArea(with: .zero, excludingEdge: .bottom)
        messageLabel.autoPinEdge(toSuperviewEdge: .left)
        messageLabel.autoPinEdge(toSuperviewEdge: .right)
        messageLabel.autoPinEdge(.top, to: .bottom, of: debugLabel)

        container.autoCenterInSuperviewMargins()

        resetButton.autoSetDimensions(to: Button.size)
        addMakeButton.autoSetDimensions(to: Button.size)
        addMissButton.autoSetDimensions(to: Button.size)
    }

    // MARK: - Public API
    func updateDisplay(displayMetrics: String) {
        metricsLabel.text = displayMetrics
    }

    // MARK: - Actions
    @objc private func resetPressed(_ sender: UIButton) {
        delegate?.view(self, resetPressed: sender)
    }

    @objc private func addMissPressed(_ sender: UIButton) {
        delegate?.view(self, addMissPressed: sender)
    }

    @objc private func addMakePressed(_ sender: UIButton) {
        delegate?.view(self, addMakePressed: sender)
    }
}
