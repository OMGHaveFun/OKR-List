//
//  Copyright © 2018 Alexander Yalchik. All rights reserved.
//

import SwiftyBeaver
let logger = SwiftyBeaver.self

struct Logger {
    static func setup() {

        // add log destinations. at least one is needed!
        let console = ConsoleDestination()  // log to Xcode Console
        let file = FileDestination()  // log to default swiftybeaver.log file
        //        let cloud = SBPlatformDestination(appID: "foo", appSecret: "bar", encryptionKey: "123") // to cloud

        // use custom format and set console output to short time, log level & message
        console.format = "$DHH:mm:ss$d $L $M"

        // add the destinations to SwiftyBeaver
        logger.addDestination(console)
        logger.addDestination(file)
        //        log.addDestination(cloud)
    }
}
