# List Users project

Project intended to list users from an API given by user.

This project is developed with MVVM-C architecture.

## Features

- Input to change the server address
- Show the list of users without duplicates
- Loading avatars with lazy loading

## Components and classes developed

- Toast to show messages and warnings to users
- Loading screen
- Custom button
- Custom label
- Custom text field
- Custom implementation of Alamofire to reduce dependency
- Simple validator
- Colors and margins constants

## Third-party libraries used

- Alamofire
- AlamofireImage
- SnapKit
- IQKeyboardManager

I choosed these libraries to save time on my implementation.

### Roadmap

- Implement native networking library
- Implement Logger class to handle all logs considering level (debug, dev, production)
- Implement strings handling to support multi-language
- Implement Pods
