//
//  SuperStackView.swift
//  SuperStackView
//
//  Created by Himanshu Arora on 08/11/20.
//

import UIKit

class SuperStackView: UIStackView {
    
    open var rowInset: UIEdgeInsets = .zero
    
    open var rowsCount: Int {
        get {
            self.arrangedSubviews.count
        }
    }
    
    open var rowBackgroundColor = UIColor.clear
    
    
    // MARK: Add and remove Row Functions
    open func addRow(_ row: UIView, animated: Bool = false) {
        insertRow(withContentView: row, atIndex: self.arrangedSubviews.count, animated: animated)
    }
    
    open func addRow(_ row: UIView, animated: Bool = false, inset: UIEdgeInsets) {
        insertRow(withContentView: row, atIndex: self.arrangedSubviews.count, animated: animated)
        setInset(forRow: row, inset: inset)
    }
    
    open func addRows(_ rows: [UIView], animated: Bool = false) {
        rows.forEach { addRow($0, animated: animated) }
    }
    
    open func addRows(_ rows: [UIView], animated: Bool = false, inset: UIEdgeInsets) {
        rows.forEach { addRow($0, animated: animated, inset: inset) }
    }
    
    /// Returns `true` if the given row is present in the stack view, `false` otherwise
    open func containsRow(_ row: UIView) -> Bool {
        guard let cell = row.superview as? SuperStackViewRow else { return false }
        return self.arrangedSubviews.contains(cell)
    }
    
    // MARK: Hiding and Showing Rows
    
    open func hideRow(_ row: UIView, animated: Bool = false) {
        setRowHidden(row, isHidden: true, animated: animated)
    }
    
    open func hideRows(_ rows: [UIView], animated: Bool = false) {
        rows.forEach { hideRow($0, animated: animated) }
    }
    
    open func showRow(_ row: UIView, animated: Bool = false) {
        setRowHidden(row, isHidden: false, animated: animated)
    }
    
    open func showRows(_ rows: [UIView], animated: Bool = false) {
        rows.forEach { showRow($0, animated: animated) }
    }
    
    /// Hides the given row if `isHidden` is `true`, or shows the given row if `isHidden` is `false`.
    ///
    /// If `animated` is `true`, the change is animated.
    open func setRowHidden(_ row: UIView, isHidden: Bool, animated: Bool = false) {
        guard let cell = row.superview as? SuperStackViewRow else { return }
        // if property doesn't change don't do anything
        if cell.isHidden == isHidden {
            return
        }
        
        if animated {
            UIView.animate(withDuration: 0.3,
                           delay: 0.0,
                           usingSpringWithDamping: 0.9,
                           initialSpringVelocity: 1,
                           options: [],
                           animations: {
                            cell.isHidden = isHidden
                            self.layoutIfNeeded()
            },
                           completion: nil)
        } else {
            cell.isHidden = isHidden
        }
    }
    
    /// Hides the given rows if `isHidden` is `true`, or shows the given rows if `isHidden` is
    /// `false`.
    ///
    /// If `animated` is `true`, the change are animated.
    open func setRowsHidden(_ rows: [UIView], isHidden: Bool, animated: Bool = false) {
        rows.forEach { setRowHidden($0, isHidden: isHidden, animated: animated) }
    }
    
    /// Returns `true` if the given row is hidden, `false` otherwise.
    open func isRowHidden(_ row: UIView) -> Bool {
        return (row.superview as? SuperStackViewRow)?.isHidden ?? false
    }

    private func insertRow(withContentView contentView: UIView, atIndex index: Int, animated: Bool) {
        
        let cell = createRow(withContentView: contentView)
        self.insertArrangedSubview(cell, at: index)
        
        if animated {
            cell.alpha = 0
            layoutIfNeeded()
            UIView.animate(withDuration: 0.3) {
                cell.alpha = 1
            }
        }
    }
    
    private func createRow(withContentView contentView: UIView) -> SuperStackViewRow {
        let cell = cellForRow(contentView)
        cell.rowBackgroundColor = rowBackgroundColor
        cell.rowInset = rowInset
        cell.shouldHideSeparator = true
        return cell
    }
    
    open func cellForRow(_ row: UIView) -> SuperStackViewRow {
        let view = SuperStackViewRow(contentView: row)
        return view
    }
    
    /// Sets the inset for the given row to the `UIEdgeInsets` provided.
    open func setInset(forRow row: UIView, inset: UIEdgeInsets) {
        (row.superview as? SuperStackViewRow)?.rowInset = inset
    }
    
    open func setBackgroundColor(forRow row: UIView, color: UIColor) {
        (row.superview as? SuperStackViewRow)?.rowBackgroundColor = color
    }
    
    open func getRowAtIndex(_ index: Int) -> UIView? {
        if let row = self.arrangedSubviews[index] as? SuperStackViewRow {
            return row.contentView
        }
        return nil
    }
    
    open func getView(for row: UIView) -> UIView? {
        return row.superview as? SuperStackViewRow
    }
    
}
