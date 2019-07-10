import Foundation
import ProjectSpec
import SwiftCLI

public class XcodeGenCLI {

    let cli: CLI

    public init(version: Version) {
        let generateCommand = GenerateCommand(version: version)

        cli = CLI(
            name: "xcodegen",
            version: version.string,
            description: "Generates Xcode projects",
            commands: [generateCommand]
        )
        cli.parser = Parser()
        cli.argumentListManipulators.append(CommandRouter(
            defaultCommand: generateCommand
        ))
    }

    public func execute(arguments: [String]? = nil) {
        let status: Int32
        if let arguments = arguments {
            status = cli.go(with: arguments)
        } else {
            status = cli.go()
        }
        exit(status)
    }
}
