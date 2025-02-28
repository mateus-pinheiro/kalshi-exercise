# Kalshi Financial Wellness App

## Overview
This Flutter application implements a financial wellness assessment tool using Clean Architecture principles. The app allows users to input their financial information and receive a wellness assessment based on their financial health indicators.

https://github.com/user-attachments/assets/7b28ddf9-1c23-4c0a-ad2c-f63bc92ceb6c

## Architecture

### Clean Architecture Implementation
The project follows Clean Architecture principles, divided into three main layers:

```
lib/
├── src/
    ├── domain/      # Business logic and entities
    ├── datasource/  # Data handling and external interfaces
    ├── presentation/# UI components and state management
    └── core/        # Core utilities and shared components
```

#### Domain Layer
- Contains business logic and entities
- Defines use cases and repository interfaces
- Pure Dart code with no dependencies on external packages
- Location: `lib/src/domain/`

#### Data Layer
- Implements repository interfaces
- Handles data persistence and external API communication
- Location: `lib/src/datasource/`

#### Presentation Layer
- Contains UI components and state management
- Implements BLoC pattern using Cubit
- Location: `lib/src/presentation/`

### Core Concepts
- **Dependency Injection**: Using `get_it` for service location
- **State Management**: BLoC pattern with `flutter_bloc`
- **Navigation**: Declarative routing with `go_router`
- **Error Handling**: Using `either_dart` for functional error handling
- **Internationalization**: Using `slang` for type-safe translations
- **Testing**: Comprehensive testing with `flutter_test`, `bloc_test`, and `mockito`
- **Use Cases**: Generic abstract class pattern for business logic implementation

### Use Case Pattern
The application implements a generic use case pattern for consistent business logic handling:
```dart
abstract class Usecase<T, Params> {
  Either<Failure, T> call(Params params);
}
```
This pattern provides:
- Type-safe error handling with Either
- Standardized interface for all business operations
- Clear separation between success (T) and failure (Failure) cases
- Consistent parameter passing through Params type

Each use case in the application follows this pattern, ensuring:
- Consistent error handling across the application
- Clear separation of concerns
- Easy testability
- Type safety at compile time

## Key Libraries

### State Management
- **flutter_bloc (^9.0.0)**: Implements the BLoC pattern for state management
  - Used for managing financial wellness assessment flow
  - Separates business logic from UI
  - Provides predictable state transitions
- **bloc_test (^10.0.0)**: Testing utilities for BLoC/Cubit

### Dependency Injection
- **get_it (^8.0.3)**: Service locator for dependency injection
  - Manages singleton instances
  - Facilitates testing through easy dependency swapping
  - Reduces widget tree complexity

### Navigation
- **go_router (^14.8.0)**: Declarative routing solution
  - Type-safe route parameters
  - Nested navigation support

### Internationalization
- **slang (^4.4.1)** & **slang_flutter (^4.4.0)**: Type-safe internationalization
  - Compile-time translation key verification
  - Supports plural forms and interpolation
  - Easy integration with Flutter widgets

### Error Handling
- **either_dart (^1.0.0)**: Functional error handling
  - Type-safe error handling
  - Eliminates null checks and try-catchs
  - Improves error propagation

### Code Generation
- **freezed (^2.4.7)**: Code generation for data classes
  - Immutable state management
  - Union types / sealed classes for state handling
  - Pattern matching support
  - Automatic toString, equality, and hashCode implementations
  - Example implementation in state management:
    ```dart
    @Freezed(equal: false)
    sealed class FinancialWellnessState with _$FinancialWellnessState {
      const FinancialWellnessState._();

      factory FinancialWellnessState.initial() = FinancialWellnessStateInitial;

      factory FinancialWellnessState.error({
        @Default(FinancialWellnessFailure("Generic Error"))
        FinancialWellnessFailure failure,
      }) = FinancialWellnessStateError;

      factory FinancialWellnessState.success({
        required FinancialWellnessStatus financialWellnessStatus,
      }) = FinancialWellnessStateSuccess;
    }
    ```

### UI Components
- **flutter_svg (^2.0.17)**: SVG rendering support
  - Used for displaying vector graphics
  - Maintains quality across different screen sizes

### Testing
- **flutter_test**: Flutter's built-in testing framework
- **mockito (^5.4.5)**: Mocking framework for tests
- **bloc_test**: Specialized testing for BLoC/Cubit

### Development Tools
- **build_runner (^2.4.15)**: Code generation tool
- **freezed_annotation**: Annotations for freezed code generation
- **freezed**: Code generation for immutable classes
- **slang_build_runner (^4.4.2)**: Generates type-safe translations
- **flutter_lints (^5.0.0)**: Lint rules for consistent code style

## Typography and Assets

### Custom Fonts
The application uses two custom font families:

#### Rubik
- Regular Variable Font
- Italic Variable Font
- Bold
- Bold Italic
- SemiBold
- SemiBold Italic

#### Work Sans
- Regular Variable Font
- Italic Variable Font

### Assets
- Images and SVGs stored in `assets/images/`
- Font files stored in `assets/fonts/`
- Internationalization files in `assets/i18n/`

## Project Structure

```
lib/
├── main.dart           # Application entry point
├── gen/               # Generated files (i18n)
└── src/
    ├── core/          # Core utilities
    │   ├── app_router.dart    # Navigation routes
    │   ├── di.dart           # Dependency injection setup
    │   └── failure.dart      # Error handling
    ├── domain/
    │   ├── entities/         # Business objects
    │   ├── failures/         # Domain-specific errors
    │   └── usecases/        # Business logic
    ├── presentation/
    │   ├── financial_wellness/
    │   │   ├── bloc/        # State management
    │   │   ├── pages/       # Screen widgets
    │   │   └── widgets/     # Reusable components
    │   └── shared/          # Shared UI components
    └── datasource/          # Data handling
```

## Testing Strategy

### Unit Tests
- Domain layer testing
- Use case validation
- Business logic verification
- BLoC/Cubit state testing using bloc_test

### Widget Tests
- Component rendering verification
- User interaction testing
- Navigation flow validation
- Mocking dependencies with mockito

### Integration Tests
- End-to-end flow testing
- State management verification
- Component interaction testing

## Getting Started

### Prerequisites
- Flutter SDK (^3.6.0)
- Dart SDK
- Android Studio / VS Code with Flutter plugins

### Setup
1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Generate internationalization, object files for freezed and mockito files:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
4. Run tests:
   ```bash
   flutter test
   ```
5. Run the app:
   ```bash
   flutter run
   ```

## Development Guidelines

### Code Style
- Follow Flutter's style guide
- Use meaningful variable and function names
- Document complex business logic
- Keep widgets focused and single-purpose
- Use provided lint rules (flutter_lints)

### State Management
- Use Cubits for simple state management
- Implement proper error handling with Either
- Keep presentation logic in the presentation layer
- Test state changes with bloc_test

### Internationalization
- Add new strings to `assets/i18n/en.i18n.json`
- Run build_runner to generate type-safe access
- Use generated accessors in widgets

## Feature: Financial Wellness Assessment

### Flow
1. User inputs financial information
   - Annual gross income
   - Average monthly costs
2. System calculates financial wellness score
3. Results displayed with recommendations

### Implementation Details
- Form validation in presentation layer
- Score calculation in domain layer
- Result persistence in data layer
- Clean separation of concerns
- Type-safe translations for all text

## Security Considerations
- No sensitive data stored locally
- Input validation on all forms
- Secure navigation implementation

## Technical Future Improvements
- Create a complete theme for the app
- Create testing for widgets
- Create a network handler for API calls
- Support for more locales

## Contributing
1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Create a pull request

## License
This project is not for production.
