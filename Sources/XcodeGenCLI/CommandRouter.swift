import Foundation
import SwiftCLI

class CommandRouter: ArgumentListManipulator {
    let defaultCommand: Command

    init(defaultCommand: Command) {
        self.defaultCommand = defaultCommand
    }

    func manipulate(arguments: ArgumentList) {
        if !arguments.hasNext() || arguments.nextIsOption() {
            arguments.manipulate { existing in
                [defaultCommand.name] + existing
            }
        }
    }
}
