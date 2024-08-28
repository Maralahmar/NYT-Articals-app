# mariam_task
# NY Times Most Popular Articles App


## Overview

This project is a Flutter application that fetches and displays the most popular articles from The New York Times using their Most Popular Articles API. The app features a master/detail view where users can see a list of articles and tap on them to view detailed information. The application is built with a focus on clean architecture, best coding practices, and it supports both web and mobile platforms.


## Features

- **List View of Articles**: Fetches and displays a list of the most popular articles from The New York Times.
- **Article Details View**: Provides detailed information about each article when selected.
- **Responsive UI**: The app is designed to work on both mobile and web, with responsive layouts for different screen sizes.
- **API Integration**: Uses The New York Times Most Popular Articles API.
- **Clean Architecture**: Implements a clean architecture pattern using BLoC and Dependency Injection (DI) with GetIt.
- **Unit Testing**: Includes unit tests with a focus on code coverage.
- **Error Handling**: Comprehensive error handling for API calls and data processing.


## Prerequisites

- **Flutter SDK**: Install Flutter SDK from [Flutter's official site](https://flutter.dev/docs/get-started/install).
- **NY Times API Key**: Obtain an API key from the [NY Times Developer Portal](https://developer.nytimes.com/get-started).


## Getting Started

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/nytimes-most-popular-articles.git
   cd nytimes-most-popular-articles
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```
3. **Generate JSON Code**:
- If your app requires JSON serialization, run the following command to generate the necessary JSON serialization code:
   ```bash
    flutter pub run build_runner build
   ```
3. **Set up your API Key**:
    - Replace `sample-key` in the API URL with your actual NY Times API key in the codebase.
4. **Run the app**:
    - **On Mobile**:
      ```bash
      flutter run
      ```
    - **On Web**:
      ```bash
      flutter run -d chrome
      ```

## Project Structure

- **lib/**: Contains the Dart source files.
    - `main.dart`: Entry point of the application.
    - `core/`: Contains core utilities, constants, and common widgets.
    - `data/`: Handles data fetching, API integration using Dio, and models.
    - `domain/`: Contains business logic, entities, and use cases.
    - `presentation/`: Includes UI components like screens, BLoCs, and widgets.
    - `di/`: Set up for Dependency Injection using GetIt.

## Low-Level Design

### Architecture

The app follows a **Clean Architecture** pattern:

- **Presentation Layer**: Contains UI components and BLoCs to handle state management.
- **Domain Layer**: Contains the business logic and entities.
- **Data Layer**: Manages data retrieval using Dio for API calls and handles models.

### State Management

- **BLoC (Business Logic Component)**: Used for state management, separating business logic from UI components.

### Dependency Injection

- **GetIt**: Used for dependency injection, allowing for decoupling of components and easier testing.

## Software Development Practices

- **Object-Oriented Programming (OOP)**: The app is built with an OOP approach, ensuring modularity and reuse.
- **Clean Code**: Emphasizes readability, simplicity, and consistency.
- **Unit Testing**: Includes unit tests for critical components with high code coverage.
- **Error Handling**: Robust error handling for API calls and data processing.

## Testing

- **Run Unit Tests**:
  ```bash
  flutter test
  ```

- **Code Coverage**: Reports can be generated to ensure sufficient code coverage.

## API Integration

The app integrates with the NY Times Most Popular Articles API. The API endpoint used is:

```
http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/30.json?api-key=sample-key
```

- **Section**: `all-sections`
- **Period**: `30` (represents the last 30 days)
- **API Key**: Replace `sample-key` with your actual key.

## Deployment

The app can be deployed both on mobile devices and the web. Ensure you have configured the Flutter environment correctly for both platforms.

### Web Deployment

The app is responsive and can be deployed on the web. You can build the web version using the following command:

```bash
flutter build web
```

The build artifacts will be available in the `build/web` directory.

## Future Enhancements

- **Integration Tests**: Add integration tests for full end-to-end testing.
- **Advanced Error Handling**: Implement more granular error handling strategies.
- **Caching**: Implement local caching to improve performance and offline availability.

## Author

- **Mariam Alahmar**

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to [NY Times](https://developer.nytimes.com/) for providing the API.

---