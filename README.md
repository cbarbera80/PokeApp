# PokeApp

## Requirements

* Xcode 12
* Swift 5.3

## Philosophy

* No Styoryboard 
* No View Controller XIB
* No pods :)
* UI by code
* MVVM+Coordinator

## Implementation choices

### The app is built using an MVVM + Coordinators architecture.
The AppDelegate is kept as lean as possible.
A routing file, AppCoordinator, is used to coordinate the overall app flows.
View controllers make use of view models and states.
Network services have a modular implementation that allows the app to switch between different service implementations. 

For example, in AppDelegate, we could switch this:

```swift
let services = RealPokemonServices()
```
with this

```swift
let services = MockPokemonServices()
```

Doing this, we could completely simulate the application with local data.
The app has caching mechanisms that allow it to be partially usable offline.
