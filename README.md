# Utensils+Extensions [![Cocoapod Version](https://img.shields.io/cocoapods/v/Utensils+Extensions.svg)](https://github.com/rbaumbach/Utensils-Extensions) [![SPM Compatible](https://img.shields.io/badge/SPM-Compatible-blue)](https://swift.org/package-manager/) [![Cocoapod Platform](https://img.shields.io/badge/platform-iOS-blue.svg)](https://github.com/rbaumbach/Utensils-Extensions) ![iOS Deployment Target](https://img.shields.io/badge/iOS_Deployment_Target-13.0-964B00) [![License](https://img.shields.io/dub/l/vibe-d.svg)](https://github.com/rbaumbach/Utensils-Extensions/blob/maestro/MIT-LICENSE.txt)

This project extends [Utensils](https://github.com/rbaumbach/Utensils), by allowing a higher deployment target with added functionality.  This will allow consumers to continue to use `Utentils` with projects locked at an iOS deployment target of `12.0`, while allowing newer features to be added reguarily with newer syntax and tooling.

## Adding Utensils+Extensions to your project

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to add Utensils to your project.

1.  Add Utensils to your Podfile `pod 'Utensils+Extensions'`.
2.  Install the pod(s) by running `pod install`.
3.  Add Utensils to your files with `import UtensilsExtensions`.

### Swift Package manager

[Swift Package Manager](https://swift.org/package-manager/) can be used to add `Utensils+Extensions` the to your project:

1.  Add `.package(url: "https://github.com/rbaumbach/Utensils+Extensions", from: "0.0.5")`
2.  [Follow intructions to add](https://swift.org/getting-started/#using-the-package-manager) the Utensils package to your project.
3.  Add Utensils to your files with `import Utensils_Extensions`.

### Clone from Github

1.  Clone repository from github and copy files directly, or add it as a git submodule.
2.  Add all files from `Source` directory to your project.

## What tools are extended?

* Extending the "pequeno" networker to include `async` versions of networking requests

```swift
let networker = PequenoNetworking(baseURL: "https://dogsrbettahthancats.party")

let model = try await subject.get(endpoint: "/dogs",
                                  headers: ["version": "v1"],
                                  parameters: ["breed": "chihuahua"])
```

Note: Methods exist for both `Any` and codable json responses

## Testing

* Prerequisites: [ruby](https://github.com/sstephenson/rbenv), [ruby gems](https://rubygems.org/pages/download), [bundler](http://bundler.io)

This project has been setup to use [fastlane](https://fastlane.tools) to run the specs.

First, bundle required gems, install [Cocoapods](http://cocoapods.org). Next, inside the root project directory run:

```bash
$ bundle
$ bundle exec pod install
```

And then use fastlane to run all the specs on the command line:

```bash
$ bundle exec fastlane specs
```

## Suggestions, requests, and feedback

Thanks for checking out Utensils+Extensions.  Any feedback, suggestions and feedback can be can be sent to: github@ryan.codes, or opened as a github issue.
