# Flutter Project

This is a Flutter project that generates product variant options and names.

## Project Structure

- `lib/`: This is where the main Dart code resides.
  - `constants/`: This directory contains all the constant values used across the project.
  - `pages/`: This directory contains all the pages of the application.
  - `providers/`: This directory contains the state management logic using Riverpod.
  - `widgets/`: This directory contains all the custom widgets used across the project.
- `assets/`: This directory contains all the assets like images used in the project.

## Widgets

- `UserVariantCard`: This widget displays a card with the selected product variants. It watches the `userSelectedCombinations` provider to get the selected variants.

## Logic

The product variant options and names are generated using a combination of user selections. The selected options are managed using the `userSelectedCombinations` provider in the `providers/` directory. When a user selects or deselects an option, the `userSelectedCombinations` state is updated, which in turn updates the `UserVariantCard` widget.

## Running the Project

To run the project, use the following command:

```sh
flutter run
```
