//
//  Utils.swift
//  RaptorsApp
//
//  Created by Tony Sung on 17/7/2017.
//  Copyright © 2017 NEX Team Inc. All rights reserved.
//

import CoreLocation
import CoreMedia
import DeviceKit
import Foundation
import ImageIO
import PromiseKit
import simd

class Utils {

    private init() {}

    static func displayValue(_ placemark: CLPlacemark) -> String {
        let second = placemark.locality ?? placemark.administrativeArea ?? placemark.country ?? ""
        if let first = placemark.subLocality {
            return first == second ? first : "\(first), \(second)"
        } else {
            return second
        }
    }

    static func fontSizeThatFits(_ fittingSize: CGSize, font: UIFont, text: String, minFontSize: CGFloat, maxFontSize: CGFloat) -> CGFloat {
        var lower = minFontSize
        var upper = maxFontSize
        var best = maxFontSize
        for _ in 0..<10 {
            let last = best
            let renderedSize = (text as NSString).size(withAttributes: [NSAttributedString.Key.font: font.withSize(best)])
            let delta = max(renderedSize.width - fittingSize.width, renderedSize.height - fittingSize.height)
            if delta < 0 {
                lower = max(lower, best)
            } else if delta > 0 {
                upper = min(upper, best)
            }
            best = 0.5 * (upper + lower)
            if abs(best - last) < 0.5 {
                break
            }
        }
        return best
    }

    static func addWeighted(color1: UIColor, weight1: CGFloat, color2: UIColor, weight2: CGFloat) -> UIColor {
        var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        return UIColor(
            red: weight1 * r1 + weight2 * r2,
            green: weight1 * g1 + weight2 * g2,
            blue: weight1 * b1 + weight2 * b2,
            alpha: weight1 * a1 + weight2 * a2)
    }

    // Returns the cumulative sum of a list.
    static func cumulativeSum<T: FloatingPoint>(_ list: [T]) -> [T] {
        var sum: T = 0
        var result = [sum]
        for x in list {
            sum += x
            result.append(sum)
        }
        return result
    }

    static func getCurrentColorScheme() -> ColorScheme {
        return ColorScheme.getDefault()
    }

    static func getLongDash() -> String {
        return "—"
    }

    static func getAccuracyLabelColor(accuracy: Float) -> UIColor {
        let colorScheme = getCurrentColorScheme()
        return accuracy > 0.4 ? colorScheme.hotColor : colorScheme.coldColor
    }

    static func getColorsByAccuracy(accuracy: Float, bucketSize: Float = 1.0) -> (fill: UIColor, stroke: UIColor) {
        let colorScheme = getCurrentColorScheme()

        var fillColor = colorScheme.inactiveColor
        var strokeColor = colorScheme.inactiveTextColor

        // use inactiveColor for zones with < 20% as many shots as the most popular zone
        if accuracy >= 0, bucketSize >= 0.2 {

            if accuracy >= 0.6 {
                fillColor = colorScheme.zone1Fill
            } else if accuracy >= 0.55 {
                fillColor = colorScheme.zone2Fill
            } else if accuracy >= 0.5 {
                fillColor = colorScheme.zone3Fill
            } else if accuracy >= 0.45 {
                fillColor = colorScheme.zone4Fill
            } else if accuracy >= 0.4 {
                fillColor = colorScheme.zone5Fill
            } else {
                fillColor = colorScheme.zone6Fill
            }

            if accuracy >= 0.5 {
                strokeColor = colorScheme.zoneHotStroke
            } else {
                strokeColor = colorScheme.zoneColdStroke
            }
        }
        return (fill: fillColor, stroke: strokeColor)
    }

    // XXX: quite view specific
    static func getDurationFormatString(duration: Double) -> String {
        let hours = Int(duration) / 3600
        let minutes = Int(duration) % 3600 / 60
        let seconds = Int(duration) % 60

        return hours > 0 ? String(format: "%1d:%02d:%02d", hours, minutes, seconds) : String(format: "%02d:%02d", minutes, seconds)
    }

    // XXX: quite view specific
    static func getHeightFormatString(centimeters: Float) -> String {
        let (ft, remainingInches) = ftAndInches(centimeters: centimeters)
        return String(format: "%1d\u{0027}%1d\u{0027}\u{0027}", ft, remainingInches)
    }

    static func getHeightFormatStringForStyle1(meters: Float) -> String {
        return "\(Int(inches(meters)))\u{0027}\u{0027}"
    }

    static func inches(_ meters: Float) -> Float {
        return meters * 39.3701
    }

    static func inchesOptional(_ meters: Float?) -> Float? {
        if let meters = meters {
            return inches(meters)
        } else {
            return nil
        }
    }

    static func inches(centimeters: Float) -> Float {
        return inches(centimeters / 100.0)
    }

    static func meters(inches: Float) -> Float {
        return inches / 39.3701
    }

    static func metersOptional(inches: Float?) -> Float? {
        if let inches = inches {
            return meters(inches: inches)
        } else {
            return nil
        }
    }

    static func ftAndInches(_ meters: Float) -> (Int, Int) {
        let totalInches = inches(meters)
        return (Int(totalInches) / 12, Int(totalInches) % 12)
    }

    static func ftAndInches(centimeters: Float) -> (Int, Int) {
        return ftAndInches(centimeters / 100.0)
    }

    static func centimeters(inches: Float) -> Float {
        return inches * 2.54
    }

    static func centimeters(ft: Float, inches: Float) -> Float {
        return centimeters(inches: ft * 12 + inches)
    }

    static func milePerHour(meterPerSecond: Float) -> Float {
        return meterPerSecond * 2.23694
    }

    static func milePerHourOptional(meterPerSecond: Float?) -> Float? {
        if let meterPerSecond = meterPerSecond {
            return milePerHour(meterPerSecond: meterPerSecond)
        } else {
            return nil
        }
    }

    static func meterPerSecond(milePerHour: Float) -> Float {
        return milePerHour / 2.23694
    }

    static func meterPerSecondOptional(milePerHour: Float?) -> Float? {
        if let milePerHour = milePerHour {
            return meterPerSecond(milePerHour: milePerHour)
        } else {
            return nil
        }
    }

    // MARK: - Formatting

    static let twoDigits: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumSignificantDigits = 2
        formatter.minimumSignificantDigits = 1
        formatter.roundingMode = NumberFormatter.RoundingMode.down
        return formatter
    }()

    static let threeDigits: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumSignificantDigits = 3
        formatter.minimumSignificantDigits = 1
        formatter.roundingMode = NumberFormatter.RoundingMode.down
        return formatter
    }()

    static let fourDigits: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumSignificantDigits = 4
        formatter.minimumSignificantDigits = 1
        formatter.roundingMode = NumberFormatter.RoundingMode.down
        return formatter
    }()

    static func formatTwoDigits(_ value: Double) -> String {
        return twoDigits.string(from: NSNumber(value: value))!
    }

    static func formatThreeDigits(_ value: Double) -> String {
        return threeDigits.string(from: NSNumber(value: value))!
    }

    static func formatFourDigits(_ value: Double) -> String {
        return fourDigits.string(from: NSNumber(value: value))!
    }

    static func getShotString(_ count: Int) -> String {
        return getCountString(count)
    }

    static func getCountString(_ count: Double) -> String {
        return getCountString(Int(count))
    }

    static func getCountString(_ count: Int) -> String {
        let c = Double(count)

        if c >= 1e6 {
            return formatTwoDigits(c / 1e6) + "m"
        } else if c >= 1e5 {
            // 234,501 -> 234.5k
            return formatFourDigits(c / 1e3) + "k"
        } else if c >= 1e4 {
            // 23,501 -> 23.5k
            return formatThreeDigits(c / 1e3) + "k"
        } else if c >= 1e3 {
            // 1,734 -> 1.7k
            return formatTwoDigits(c / 1e3) + "k"
        } else {
            return formatThreeDigits(c)
        }
    }

    // MARK: - Color utility functions
    static func convertUIColor(r: Int, g: Int, b: Int, a: CGFloat) -> UIColor {
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0

        return UIColor(red: red, green: green, blue: blue, alpha: a)
    }

    static func convertUIColor(r: Int, g: Int, b: Int) -> UIColor {
        return convertUIColor(r: r, g: g, b: b, a: 1)
    }

    static func convertUIColorGrey(rgb: Int) -> UIColor {
        return convertUIColor(r: rgb, g: rgb, b: rgb, a: 1)
    }

    static func getContrastBWColor(color: UIColor) -> UIColor {
        let coreImageColor = CIColor(color: color)
        let r = coreImageColor.red
        let g = coreImageColor.green
        let b = coreImageColor.blue

        return (r + g + b) / 3 > 0.65 ? UIColor.black : UIColor.white
    }

    static func raptorsYellow() -> UIColor {
        return convertUIColor(r: 255, g: 197, b: 0)
    }

    // MARK: - Random generators

    static func generateRandomAlphabeticString(length: UInt) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        let n = UInt32(letters.count)
        var s = ""
        for _ in 0..<length {
            let rand = Int(arc4random_uniform(n))
            let start = letters.index(letters.startIndex, offsetBy: rand)
            let end = letters.index(after: start)
            s += letters[start..<end]
        }
        return s
    }

    // MARK: - Others

    static func stringClassFromString(_ className: String) -> AnyClass? {
        // get namespace
        if let namespace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String {
            let cls: AnyClass? = NSClassFromString("\(namespace).\(className)")
            return cls
        }
        return nil
    }

    static func isIPad() -> Bool {
        return Device.current.isPad
    }

    // Utils method for getting default supported orientation base on device
    static func defaultSupportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return Utils.isIPad() ? UIInterfaceOrientationMask.landscape : UIInterfaceOrientationMask.portrait
    }

    /// - returns: whether the device is supported
    /// supported list:
    /// - iPhone 6s or newer
    /// - iPad Pro (model year 2016 or newer)
    /// - iPad (6th generation or newer)
    static func isSupportedDevice() -> Bool {
        var unsupportedDevices: [Device] = [
            .iPhone4, .iPhone4s,
            .iPhone5, .iPhone5c, .iPhone5s,
            .iPhone6, .iPhone6Plus,
            .iPad2, .iPad3, .iPad4,
            .iPadAir, .iPadAir2,
            .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4
        ]
        unsupportedDevices = unsupportedDevices.reduce(into: [], { array, type in
            array.append(type)
            array.append(.simulator(type))
        })
        return !Device.current.isPod && !unsupportedDevices.contains(Device.current)
    }
}
