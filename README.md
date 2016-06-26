# FlurryEventLogger

Event logging wrapper for Flurry iOS SDK.

## Example

```swift
enum FlurryEvent: String {
    case Theatres
    case Theatre
    case Plays
    case Play
}

// MARK: - FlurryEventType

extension FlurryEvent: FlurryEventType {
    var eventName: String { return rawValue }
    
    var parameterKeys: [String]? {
        switch self {
        case .Play: return ["PlayID"]
        case .Theatre: return ["TheatreID"]
        default: return nil
        }
    }
}
```

```swift
Flurry.log(event: FlurryEvent.Theatre, parameterValues: [theatre.theatreID])
// is equivalent to this:
Flurry.logEvent("Theatre", parameters: ["TheatreID": theatre.theatreID])
```

## Installation

FlurryLogger is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FlurryEventLogger', :git => 'https://github.com/anilgoktas/FlurryEventLogger.git'
```

## Author

Anıl Göktaş, goktas.anil@gmail.com

## License

FlurryEventLogger is available under the MIT license. See the LICENSE file for more info.


