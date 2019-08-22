//
//  Theme.swift
//  RaptorsApp
//
//  Created by dl on 8/2/17.
//  Copyright © 2017 NEX Team Inc. All rights reserved.
//

import UIKit

class Dimensions {
    static let separatorWidth: CGFloat = 1
    static var ultraThinLineWidth: CGFloat { return 1 / UIScreen.main.scale }
}

class ColorScheme {

    static let clear = UIColor.clear
    static let white = UIColor.white
    static let black = UIColor.black
    static let greyishBrown = Utils.convertUIColor(r: 74, g: 74, b: 74)
    static let windowsBlue = Utils.convertUIColor(r: 58, g: 102, b: 184)
    static let whiteTwo = Utils.convertUIColor(r: 232, g: 232, b: 232)
    static let brownishGrey = Utils.convertUIColor(r: 102, g: 102, b: 102)
    static let brightOrange = Utils.convertUIColor(r: 255, g: 102, b: 0)
    static let greyish = Utils.convertUIColor(r: 184, g: 184, b: 184)
    static let whiteThree = Utils.convertUIColor(r: 248, g: 248, b: 248)
    static let warmGrey = Utils.convertUIColor(r: 153, g: 153, b: 153)
    static let titleBlack = Utils.convertUIColor(r: 51, g: 51, b: 51)
    static let warmGreyTwo = Utils.convertUIColor(r: 119, g: 119, b: 119)
    static let bloodOrange = Utils.convertUIColor(r: 245, g: 71, b: 0)
    static let bloodOrangeTwo = Utils.convertUIColor(r: 255, g: 80, b: 0)
    static let paleGrey = Utils.convertUIColor(r: 239, g: 239, b: 244)
    static let silver = Utils.convertUIColor(r: 219, g: 219, b: 224)
    static let greyishTwo = Utils.convertUIColor(r: 169, g: 169, b: 169)
    static let darkBlue = Utils.convertUIColor(r: 29, g: 66, b: 138)
    static let denimBlue = Utils.convertUIColor(r: 59, g: 89, b: 152)
    static let destructiveRed = Utils.convertUIColor(r: 205, g: 10, b: 47)
    static let whiteFour = Utils.convertUIColor(r: 230, g: 230, b: 230)
    static let whiteFive = Utils.convertUIColor(r: 235, g: 235, b: 235)
    static let warmGreyThree = Utils.convertUIColor(r: 155, g: 155, b: 155)
    static let warmGreyFour = Utils.convertUIColor(r: 162, g: 162, b: 162)
    static let brightOrangeTwo = Utils.convertUIColor(r: 255, g: 87, b: 0)
    static let redOrange = Utils.convertUIColor(r: 255, g: 62, b: 0)
    static let darkKhaki = Utils.convertUIColor(r: 158, g: 135, b: 97)
    static let warmGreyFive = Utils.convertUIColor(r: 136, g: 136, b: 136)
    static let silverTwo = Utils.convertUIColor(r: 221, g: 221, b: 227)
    static let purpleRed = Utils.convertUIColor(r: 144, g: 0, b: 68)
    static let dirtyOrange = Utils.convertUIColor(r: 206, g: 128, b: 16)
    static let lightNavy = Utils.convertUIColor(r: 21, g: 54, b: 101)
    static let grapePurple = Utils.convertUIColor(r: 64, g: 25, b: 106)
    static let darkSlateBlue = Utils.convertUIColor(r: 22, g: 66, b: 80)
    static let brownishGreyTwo = Utils.convertUIColor(r: 110, g: 109, b: 103)
    static let grassGreen = Utils.convertUIColor(r: 0, g: 180, b: 120)
    static let lightGold = Utils.convertUIColor(r: 255, g: 221, b: 82)

    static let lightGray = Utils.convertUIColor(r: 223, g: 223, b: 223)
    static let tintedLightGray = Utils.convertUIColor(r: 244, g: 244, b: 244)
    static let veryLightGray = Utils.convertUIColor(r: 247, g: 247, b: 249)
    static let grayBorder = Utils.convertUIColor(r: 219, g: 219, b: 224)
    static let darkGray = Utils.convertUIColor(r: 146, g: 146, b: 146)
    static let text = Utils.convertUIColorGrey(rgb: 51)
    static let appMainTintColor = Utils.convertUIColorGrey(rgb: 51)
    static let invertedText = UIColor.white
    static let voltGreen = Utils.convertUIColor(r: 204, g: 255, b: 0)
    static let darkGreen = Utils.convertUIColor(r: 0, g: 157, b: 129)

    // MARK: - New color scheme from Styleguides
    static let offBlue = Utils.convertUIColor(r: 92, g: 118, b: 169)
    static let grey900 = Utils.convertUIColor(r: 33, g: 33, b: 33)
    static let grey800 = Utils.convertUIColor(r: 66, g: 66, b: 66)
    static let grey700 = Utils.convertUIColor(r: 98, g: 98, b: 98)
    static let grey600 = Utils.convertUIColor(r: 118, g: 118, b: 118)
    static let grey500 = Utils.convertUIColor(r: 159, g: 159, b: 159)
    static let grey400 = Utils.convertUIColor(r: 190, g: 190, b: 190)
    static let grey300 = Utils.convertUIColor(r: 224, g: 224, b: 224)
    static let grey200 = Utils.convertUIColor(r: 238, g: 238, b: 238)
    static let grey100 = Utils.convertUIColor(r: 245, g: 245, b: 245)
    static let grey50 = Utils.convertUIColor(r: 250, g: 250, b: 250)

    // XXX: This is not well-defined yet, but let's put it before integrating fully into the color scheme spec.
    struct HomeCourt {
        static let lightGray = Utils.convertUIColorGrey(rgb: 237)
        static let darkGray = Utils.convertUIColorGrey(rgb: 187)
        static let titleBlack = Utils.convertUIColorGrey(rgb: 51)
        static let white = UIColor.white
        static let black = UIColor.black
        static let orange = Utils.convertUIColor(r: 237, g: 122, b: 49)
    }

    struct Banner {
        static let background = Utils.raptorsYellow()
        static let text = UIColor.black
    }

    struct LeaderboardTile {
        struct Labels {
            static let title = titleBlack
            static let subtitle = titleBlack
            static let recordRank = Utils.convertUIColorGrey(rgb: 153)
            static let recordName = titleBlack
            static let recordStat = titleBlack
        }
        struct Balls {
            static let orange = Utils.convertUIColor(r: 245, g: 166, b: 35)
            static let red = Utils.convertUIColor(r: 168, g: 0, b: 0)
            static let purple = Utils.convertUIColor(r: 92, g: 29, b: 136)
            static let brown = Utils.convertUIColor(r: 139, g: 87, b: 42)
            static let blue = Utils.convertUIColor(r: 0, g: 58, b: 173)
        }
        static let arrow = titleBlack
        static let spacer = grayBorder
    }

    struct Login {
        static let background = Utils.convertUIColor(r: 51, g: 51, b: 51)
        struct Button {
            static let text = Utils.convertUIColor(r: 0, g: 0, b: 0)
            static let background = Utils.raptorsYellow()
        }
        struct Label {
            static let normal = Utils.convertUIColor(r: 255, g: 255, b: 255)
            static let highlight = Utils.raptorsYellow()
        }
    }

    struct Medals {
        static let platinum = Utils.convertUIColor(r: 229, g: 228, b: 226)
        static let gold = Utils.convertUIColor(r: 255, g: 197, b: 0)
        static let silver = Utils.convertUIColorGrey(rgb: 162)
        static let bronze = Utils.convertUIColor(r: 228, g: 147, b: 2)
        static let copper = Utils.convertUIColor(r: 184, g: 115, b: 51)
    }

    struct Privacy {
        static let background = ColorScheme.paleGrey
        static let sectionTitle = Utils.convertUIColorGrey(rgb: 119)
        static let title = titleBlack
        static let text = Utils.convertUIColorGrey(rgb: 119)
        static let spacer = Utils.convertUIColorGrey(rgb: 232)
    }

    struct Profile {
        struct Placeholder {
            struct Button {
                static let text = Utils.convertUIColor(r: 0, g: 0, b: 0)
                static let background = Utils.raptorsYellow()
            }
            static let background = Utils.convertUIColor(r: 51, g: 51, b: 51)
            static let border = Utils.raptorsYellow()
            static let nameText = Utils.convertUIColor(r: 255, g: 255, b: 255)
            static let messageText = Utils.raptorsYellow()
        }
        static let devButtonTitle = Utils.convertUIColor(r: 0, g: 122, b: 255)
    }

    struct RecordTile {
        static let rank = titleBlack
        static let title = titleBlack
        static let subtitle = Utils.convertUIColorGrey(rgb: 119)
        static let stat = titleBlack
        static let arrow = titleBlack
        static let spacer = Utils.convertUIColorGrey(rgb: 184)
        struct DarkMode {
            static let title = ColorScheme.white
            static let subtitle = ColorScheme.grey500
            static let background = ColorScheme.grey900
            static let rank = ColorScheme.white
            static let arrow = ColorScheme.white
            static let spacer = ColorScheme.white.withAlphaComponent(0.2)
        }
    }

    struct SectionHeader {
        static let background = ColorScheme.paleGrey
        static let title = Utils.convertUIColorGrey(rgb: 51)
        static let topSeparator = Utils.convertUIColorGrey(rgb: 51)
        struct DarkMode {
            static let background = Utils.convertUIColorGrey(rgb: 67)
            static let title = UIColor.white
            static let topSeparator = Utils.convertUIColorGrey(rgb: 119)
        }
    }

    struct SectionFooter {
        static let title = Utils.convertUIColorGrey(rgb: 51)
        static let spacer = Utils.convertUIColorGrey(rgb: 184)
    }

    struct SelectableLabel {
        static let text = Utils.convertUIColor(r: 51, g: 51, b: 51)
        static let spacer = Utils.convertUIColor(r: 232, g: 232, b: 232)
    }

    struct Settings {
        static let label = Utils.convertUIColorGrey(rgb: 119)
        static let placeholder = Utils.convertUIColorGrey(rgb: 184)
        static let text = titleBlack
        static let disabledText = Utils.convertUIColorGrey(rgb: 184)
        static let arrow = Utils.convertUIColorGrey(rgb: 153)
        static let separator = silver
    }

    struct ShotsListing {
        static let background = UIColor.white
    }

    struct ShotsDetail {
        static let background = UIColor.white
        struct UserBannerContainer {
            static let background = UIColor.clear
            static let backgroundForTvMode = UIColor.black
        }
        struct BottomStack {
            static let background = Utils.convertUIColor(r: 250, g: 250, b: 250)
        }
        struct MakeMiss {
            static let label = Utils.convertUIColor(r: 119, g: 119, b: 119)
        }
        struct Separator {
            static let background = lightGray
        }
        struct PlayerView {
            static let background = UIColor.black
        }
    }

    struct ShootingDetail {
        struct MoreVideoButton {
            static let background = UIColor.white
            static let text = Utils.convertUIColor(r: 51, g: 51, b: 51)
            static let border = Utils.convertUIColor(r: 51, g: 51, b: 51)
        }
    }

    struct ShotsVideo {
        struct TopBar {
            static let background = UIColor.black
        }
    }

    struct ShareMode {
        static let background = Utils.convertUIColor(r: 39, g: 40, b: 42)
        static let titleLabel = UIColor.white
        static let doneButton = UIColor.white
    }

    let name: String
    let key: String
    let hotColor: UIColor
    let coldColor: UIColor
    let mainColor: UIColor
    let contrastColor: UIColor
    let zone1Fill: UIColor
    let zone2Fill: UIColor
    let zone3Fill: UIColor
    let zone4Fill: UIColor
    let zone5Fill: UIColor
    let zone6Fill: UIColor
    let zoneHotStroke: UIColor
    let zoneColdStroke: UIColor
    let inactiveColor: UIColor
    let inactiveTextColor: UIColor
    let shootingScoreText: UIColor
    let shootingStopFill: UIColor
    let shootingStopStroke: UIColor
    var zoneColors: [UIColor] {
        return [zone1Fill, zone2Fill, zone3Fill, zone4Fill, zone5Fill, zone6Fill]
    }

    // XXX: Change let to var for appending HomeCourt scheme for dev account, will remove this after color scheme is settled.
    static var schemes = [
        ColorScheme(
            "HomeCourt",
            key: "HomeCourt",
            hotColor: Utils.convertUIColor(r: 255, g: 80, b: 0), // HomeCourt Orange
            coldColor: Utils.convertUIColor(r: 29, g: 66, b: 138), // HomeCourt blue
            mainColor: Utils.convertUIColor(r: 255, g: 80, b: 0), // HomeCourt Orange
            contrastColor: Utils.convertUIColor(r: 29, g: 66, b: 138), // HomeCourt blue
            zone1Fill: Utils.convertUIColor(r: 255, g: 80, b: 0), // HomeCourt Orange
            zone2Fill: Utils.convertUIColor(r: 255, g: 129, b: 71),
            zone3Fill: Utils.convertUIColor(r: 255, g: 182, b: 148),
            zone4Fill: Utils.convertUIColor(r: 160, g: 176, b: 206),
            zone5Fill: Utils.convertUIColor(r: 92, g: 119, b: 171),
            zone6Fill: Utils.convertUIColor(r: 29, g: 66, b: 138), // HomeCourt blue
            zoneHotStroke: UIColor.white,
            zoneColdStroke: UIColor.white,
            shootingScoreText: UIColor.white,
            shootingStopFill: Utils.convertUIColor(r: 200, g: 16, b: 46), // Red
            shootingStopStroke: Utils.convertUIColor(r: 200, g: 16, b: 46)
        ),
        ColorScheme(
            "NBA",
            key: "RNB",
            hotColor: Utils.convertUIColor(r: 200, g: 16, b: 46), // NBA red
            coldColor: Utils.convertUIColor(r: 29, g: 66, b: 138), // NBA blue
            mainColor: Utils.convertUIColor(r: 29, g: 66, b: 138), // NBA blue
            contrastColor: Utils.convertUIColor(r: 200, g: 16, b: 46), // NBA red
            zone1Fill: Utils.convertUIColor(r: 200, g: 16, b: 46), // NBA red
            zone2Fill: Utils.convertUIColor(r: 215, g: 87, b: 108),
            zone3Fill: Utils.convertUIColor(r: 232, g: 158, b: 170),
            zone4Fill: Utils.convertUIColor(r: 164, g: 178, b: 207),
            zone5Fill: Utils.convertUIColor(r: 96, g: 121, b: 172),
            zone6Fill: Utils.convertUIColor(r: 29, g: 66, b: 138), // NBA blue
            zoneHotStroke: UIColor.white,
            zoneColdStroke: UIColor.white,
            shootingScoreText: UIColor.white,
            shootingStopFill: Utils.convertUIColor(r: 200, g: 16, b: 46), // NBA red
            shootingStopStroke: UIColor.white
        ),
        ColorScheme(
            "GSW",
            key: "GSW",
            hotColor: Utils.convertUIColor(r: 253, g: 184, b: 39), // GSW Yellow
            coldColor: Utils.convertUIColor(r: 0, g: 107, b: 181), // GSW Blue
            mainColor: Utils.convertUIColor(r: 0, g: 107, b: 181), // GSW Blue
            contrastColor: Utils.convertUIColor(r: 253, g: 184, b: 39), // GSW Yellow
            zone1Fill: Utils.convertUIColor(r: 253, g: 184, b: 39), // GSW Yellow
            zone2Fill: Utils.convertUIColor(r: 254, g: 208, b: 114),
            zone3Fill: Utils.convertUIColor(r: 254, g: 229, b: 179),
            zone4Fill: Utils.convertUIColor(r: 114, g: 172, b: 213),
            zone5Fill: Utils.convertUIColor(r: 50, g: 135, b: 194),
            zone6Fill: Utils.convertUIColor(r: 0, g: 107, b: 181), // GSW Blue
            zoneHotStroke: Utils.convertUIColor(r: 0, g: 107, b: 181), // GSW Blue
            zoneColdStroke: Utils.convertUIColor(r: 254, g: 208, b: 114),
            shootingScoreText: Utils.convertUIColor(r: 253, g: 184, b: 39), // GSW Yellow
            shootingStopFill: Utils.convertUIColor(r: 253, g: 184, b: 39), // GSW Yellow
            shootingStopStroke: Utils.convertUIColor(r: 0, g: 107, b: 181) // GSW Blue
        ),
        ColorScheme(
            "LAL",
            key: "LAL",
            hotColor: Utils.convertUIColor(r: 253, g: 186, b: 33), // LAL Orange
            coldColor: Utils.convertUIColor(r: 84, g: 33, b: 132), // LAL Purple
            mainColor: Utils.convertUIColor(r: 84, g: 33, b: 132), // LAL Purple
            contrastColor: Utils.convertUIColor(r: 253, g: 186, b: 33), // LAL Orange
            zone1Fill: Utils.convertUIColor(r: 253, g: 186, b: 33), // LAL Orange
            zone2Fill: Utils.convertUIColor(r: 254, g: 210, b: 110),
            zone3Fill: Utils.convertUIColor(r: 254, g: 230, b: 176),
            zone4Fill: Utils.convertUIColor(r: 152, g: 121, b: 181),
            zone5Fill: Utils.convertUIColor(r: 118, g: 77, b: 156),
            zone6Fill: Utils.convertUIColor(r: 84, g: 33, b: 132), // LAL Purple
            zoneHotStroke: Utils.convertUIColor(r: 84, g: 33, b: 132), // LAL Purple
            zoneColdStroke: Utils.convertUIColor(r: 253, g: 186, b: 33), // LAL Orange
            shootingScoreText: Utils.convertUIColor(r: 253, g: 186, b: 33), // LAL Orange
            shootingStopFill: Utils.convertUIColor(r: 253, g: 186, b: 33), // LAL Orange
            shootingStopStroke: Utils.convertUIColor(r: 84, g: 33, b: 132) // LAL Purple
        ),
        ColorScheme(
            "WSH",
            key: "WSH",
            hotColor: Utils.convertUIColor(r: 207, g: 18, b: 48), // Wizards red
            coldColor: Utils.convertUIColor(r: 0, g: 44, b: 92), // Wizards blue
            mainColor: Utils.convertUIColor(r: 0, g: 44, b: 92), // Wizards blue
            contrastColor: Utils.convertUIColor(r: 207, g: 18, b: 48), // Wizards red
            zone1Fill: Utils.convertUIColor(r: 207, g: 18, b: 48), // Wizards red
            zone2Fill: Utils.convertUIColor(r: 220, g: 81, b: 109),
            zone3Fill: Utils.convertUIColor(r: 235, g: 155, b: 171),
            zone4Fill: Utils.convertUIColor(r: 153, g: 170, b: 189),
            zone5Fill: Utils.convertUIColor(r: 76, g: 106, b: 139),
            zone6Fill: Utils.convertUIColor(r: 0, g: 44, b: 92), // Wizards blue
            zoneHotStroke: UIColor.white,
            zoneColdStroke: UIColor.white,
            shootingScoreText: UIColor.white,
            shootingStopFill: Utils.convertUIColor(r: 207, g: 18, b: 48), // Wizards red
            shootingStopStroke: UIColor.white
        ),
        ColorScheme(
            "De Anza",
            key: "DAC",
            hotColor: Utils.convertUIColor(r: 253, g: 186, b: 33), // De Anza yellow
            coldColor: Utils.convertUIColor(r: 140, g: 4, b: 44), // De Anza red
            mainColor: Utils.convertUIColor(r: 140, g: 4, b: 44), // De Anza red
            contrastColor: Utils.convertUIColor(r: 253, g: 186, b: 33), // De Anza yellow
            zone1Fill: Utils.convertUIColor(r: 253, g: 186, b: 33), // De Anza yellow
            zone2Fill: Utils.convertUIColor(r: 253, g: 206, b: 99),
            zone3Fill: Utils.convertUIColor(r: 254, g: 227, b: 165),
            zone4Fill: Utils.convertUIColor(r: 208, g: 153, b: 169),
            zone5Fill: Utils.convertUIColor(r: 173, g: 77, b: 105),
            zone6Fill: Utils.convertUIColor(r: 140, g: 4, b: 44), // De Anza red
            zoneHotStroke: Utils.convertUIColor(r: 140, g: 4, b: 44), // De Anza red
            zoneColdStroke: Utils.convertUIColor(r: 253, g: 206, b: 99),
            shootingScoreText: Utils.convertUIColor(r: 253, g: 186, b: 33), // De Anza yellow
            shootingStopFill: Utils.convertUIColor(r: 253, g: 186, b: 33), // De Anza yellow
            shootingStopStroke: Utils.convertUIColor(r: 140, g: 4, b: 44) // De Anza red
        ),
        ColorScheme(
            "Duke",
            key: "DUK",
            hotColor: Utils.convertUIColor(r: 7, g: 53, b: 164), // Duke Blue
            coldColor: Utils.convertUIColorGrey(rgb: 184),
            mainColor: Utils.convertUIColor(r: 7, g: 53, b: 164), // Duke Blue
            contrastColor: UIColor.white,
            zone1Fill: Utils.convertUIColor(r: 7, g: 53, b: 164), // Duke Blue
            zone2Fill: Utils.convertUIColor(r: 55, g: 92, b: 182),
            zone3Fill: Utils.convertUIColor(r: 105, g: 132, b: 200),
            zone4Fill: Utils.convertUIColor(r: 154, g: 173, b: 218),
            zone5Fill: Utils.convertUIColor(r: 193, g: 204, b: 232),
            zone6Fill: Utils.convertUIColor(r: 217, g: 224, b: 241),
            zoneHotStroke: UIColor.white,
            zoneColdStroke: Utils.convertUIColor(r: 7, g: 53, b: 164), // Duke Blue
            shootingScoreText: UIColor.white,
            shootingStopFill: UIColor.white,
            shootingStopStroke: Utils.convertUIColor(r: 7, g: 53, b: 164) // Duke Blue
        ),
        ColorScheme(
            "Stanford",
            key: "STF",
            hotColor: Utils.convertUIColor(r: 140, g: 21, b: 21), // Stanford Red
            coldColor: Utils.convertUIColorGrey(rgb: 36),
            mainColor: Utils.convertUIColor(r: 140, g: 21, b: 21), // Stanford Red
            contrastColor: UIColor.white,
            zone1Fill: Utils.convertUIColor(r: 140, g: 21, b: 21), // Stanford Red
            zone2Fill: Utils.convertUIColor(r: 162, g: 67, b: 67),
            zone3Fill: Utils.convertUIColor(r: 185, g: 113, b: 113),
            zone4Fill: Utils.convertUIColor(r: 208, g: 160, b: 160),
            zone5Fill: Utils.convertUIColor(r: 225, g: 195, b: 195),
            zone6Fill: Utils.convertUIColor(r: 237, g: 219, b: 219),
            zoneHotStroke: UIColor.white,
            zoneColdStroke: Utils.convertUIColor(r: 140, g: 21, b: 21), // Stanford Red
            shootingScoreText: UIColor.white,
            shootingStopFill: UIColor.white,
            shootingStopStroke: Utils.convertUIColor(r: 140, g: 21, b: 21) // Stanford Red
        ),
        ColorScheme(
            "Little Rock",
            key: "LRT",
            hotColor: Utils.convertUIColor(r: 110, g: 38, b: 57), // Little Rock Red
            coldColor: Utils.convertUIColorGrey(rgb: 170),
            mainColor: Utils.convertUIColor(r: 110, g: 38, b: 57), // Little Rock Red
            contrastColor: UIColor.white,
            zone1Fill: Utils.convertUIColor(r: 110, g: 38, b: 57), // Little Rock Red
            zone2Fill: Utils.convertUIColor(r: 138, g: 80, b: 95),
            zone3Fill: Utils.convertUIColor(r: 167, g: 123, b: 135),
            zone4Fill: Utils.convertUIColor(r: 196, g: 167, b: 174),
            zone5Fill: Utils.convertUIColor(r: 217, g: 199, b: 204),
            zone6Fill: Utils.convertUIColor(r: 232, g: 221, b: 224),
            zoneHotStroke: UIColor.white,
            zoneColdStroke: Utils.convertUIColor(r: 110, g: 38, b: 57), // Little Rock Red
            shootingScoreText: UIColor.white,
            shootingStopFill: UIColor.white,
            shootingStopStroke: Utils.convertUIColor(r: 110, g: 38, b: 57) // Little Rock Red
        ),
        ColorScheme(
            "Berkeley",
            key: "UCB",
            hotColor: Utils.convertUIColor(r: 255, g: 195, b: 35), // Cal Yellow
            coldColor: Utils.convertUIColor(r: 4, g: 30, b: 66), // Cal Blue
            mainColor: Utils.convertUIColor(r: 4, g: 30, b: 66), // Cal Blue
            contrastColor: Utils.convertUIColor(r: 255, g: 195, b: 35), // Cal Yellow
            zone1Fill: Utils.convertUIColor(r: 255, g: 195, b: 35), // Cal Yellow
            zone2Fill: Utils.convertUIColor(r: 255, g: 216, b: 111),
            zone3Fill: Utils.convertUIColor(r: 255, g: 233, b: 177),
            zone4Fill: Utils.convertUIColor(r: 153, g: 164, b: 178),
            zone5Fill: Utils.convertUIColor(r: 77, g: 96, b: 121),
            zone6Fill: Utils.convertUIColor(r: 4, g: 30, b: 66), // Cal Blue
            zoneHotStroke: Utils.convertUIColor(r: 4, g: 30, b: 66), // Cal Blue
            zoneColdStroke: Utils.convertUIColor(r: 255, g: 216, b: 111),
            shootingScoreText: Utils.convertUIColor(r: 255, g: 195, b: 35), // Cal Yellow
            shootingStopFill: Utils.convertUIColor(r: 255, g: 195, b: 35), // Cal Yellow
            shootingStopStroke: Utils.convertUIColor(r: 4, g: 30, b: 66) // Cal Blue
        )
    ]

    init (_ name: String,
          key: String,
          hotColor: UIColor,
          coldColor: UIColor,
          mainColor: UIColor,
          contrastColor: UIColor,
          zone1Fill: UIColor,
          zone2Fill: UIColor,
          zone3Fill: UIColor,
          zone4Fill: UIColor,
          zone5Fill: UIColor,
          zone6Fill: UIColor,
          zoneHotStroke: UIColor,
          zoneColdStroke: UIColor,
          inactiveColor: UIColor = Utils.convertUIColorGrey(rgb: 229), // Light Gray
          inactiveTextColor: UIColor = Utils.convertUIColorGrey(rgb: 163), // Gray
          shootingScoreText: UIColor,
          shootingStopFill: UIColor,
          shootingStopStroke: UIColor) {
        self.name = name
        self.key = key
        self.hotColor = hotColor
        self.coldColor = coldColor
        self.mainColor = mainColor
        self.contrastColor = contrastColor
        self.zone1Fill = zone1Fill
        self.zone2Fill = zone2Fill
        self.zone3Fill = zone3Fill
        self.zone4Fill = zone4Fill
        self.zone5Fill = zone5Fill
        self.zone6Fill = zone6Fill
        self.zoneHotStroke = zoneHotStroke
        self.zoneColdStroke = zoneColdStroke
        self.inactiveColor = inactiveColor
        self.inactiveTextColor = inactiveTextColor
        self.shootingScoreText = shootingScoreText
        self.shootingStopFill = shootingStopFill
        self.shootingStopStroke = shootingStopStroke
    }

    class func getByName(_ name: String?) -> ColorScheme? {
        for scheme in schemes where scheme.name == name {
            return scheme
        }
        return nil
    }

    class func getByKey(_ key: String) -> ColorScheme? {
        for scheme in schemes where scheme.key == key {
            return scheme
        }
        print("Color Scheme for key not found: \(key)")
        return nil
    }

    class func getDefault() -> ColorScheme {
        return schemes[0]
    }
}
