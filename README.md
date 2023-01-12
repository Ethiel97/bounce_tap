
- A great flutter package for an **on-tap bounce** animation on any flutter widget


    
## Usage

To use this package, add `bounce_tap` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

## Demo

[//]: # (TODO) add wallinice demo here
[//]: # (TODO) add example folder

## Example

- Import the library

```dart
import 'package:bounce_tap/bounce_tap.dart';
```

- In order to use this package, we just need to wrap the content with the widget `BounceTap`.
- Only `child`,`onTap` are mandatory in the widget.
- `tapInensity` is used to define how much the widget should scale down when pressed
- `tapIntensity`,`onTap` and `duration` can have `null` in the widget. By default `duration` is set to `200 milliseconds`.
- **Please Note:** Always pass the duration in `milliseconds` for best result

```dart
BounceTap(
  duration: Duration(milliseconds: 110),
  onPressed: (){ YOUR_FUNCTION },
  child: YOUR_WIDGET,
  tapIntentisty: TapIntensity.strong
)
```

## Documentation

### BounceTap properties

| Name              | Type                     |  Default | Description |
|-------------------|--------------------------|---|--|
| child              | `Widget`                   | required|child widget |
| onTap            | `VoidCallback`                 | required | onTap event handler |
| tapIntensity    | `TapIntensity`                  | TapIntensity.mid| Set the intensity of the tap |
| duration         | `Duration`              | `Duration(milliseconds:200)`  | Set the text style of your carousel|
| onLongPressed | `VoidCallback` |`null` | onLongPress event handler|
| tapDelay     | `int`                   |200 | how long the widget should wait before calling the `onTap`/`onLongPress` events handlers|


Now enjoy!

**Refer to [example folder](example/README.md) and the source code for more information.**

## Acknowledgement

- I would like to thank [Mohsin](https://github.com/mohsin2596) for the indirect motivation for his widget, to come up with an efficient work around, which will now be useful for our flutter community people
