# 3.0.0

**Breaking changes**

- Migrates the package to [`material_ui`](https://pub.dev/packages/material_ui). All Material types
  exposed by the API (`InputDecoration`, `Icon`, `InputCounterWidgetBuilder`, ...) now come from
  `package:material_ui/material_ui.dart` instead of `package:flutter/material.dart`. Apps must import
  Material from `material_ui` to keep using `FancyPasswordField`.
- Requires Flutter `>=3.44.0` and Dart `^3.12.0`.

**Fixes**

- Fixes a semantics assertion (`node.isMergedIntoParent`) thrown on Flutter 3.47 when typing into the
  field. The widget no longer wraps itself in a `MergeSemantics`, since a text field owns a semantics
  node that cannot be merged into an ancestor. `identifier` and `semanticsLabel` are still exposed,
  now on a container node that keeps the text field as an explicit child.

**Other**

- Bumps `flutter_lints` to `^6.0.0` and reformats the sources with the Dart 3.12 formatter.
- Adopts private named parameters for every parameter that is stored in a private field. This is
  purely internal: the parameter names callers use (`regex:`, `customText:`, `min:`, `showName:`,
  ...) are unchanged.

# 2.0.8

- Formatting files

# 2.0.7

- Adds semantics capabilities

# 2.0.6

- Removes font_awesome_flutter dependency

# 2.0.5

- Add RegexValidation rule to enable the use of Regex on the rules

# 2.0.4

- Add parameter to show or not the incorrect rule

# 2.0.3

- Fixes initial validation of the FormField
  
# 2.0.2

- Adding possibility to customize show and hide icons

# 2.0.1

- Updating dependencies
  
# 2.0.0

- Adding Icon instead of IconData for the icons
- Adding the possibility to pass custom text to the validation rules

# 1.0.4

- Centering eye icon

# 1.0.3

-  Adding custom input decoration possibility

# 1.0.2+2

-  Upgrading dependencies

# 1.0.2+1

-  Small linting adjusts

# 1.0.2

- Adding obscure text and text controller properties

# 1.0.1

- Proxing all TextFormFields properties

# 1.0.0+9

- Formatting

# 1.0.0+8

- File formatting

# 1.0.0+7

- Adjusting package description and formatting files

# 1.0.0+6

- Adjusting README

# 1.0.0+5

- Adding one more sample to samples section

# 1.0.0+4

- Adjusting package description

# 1.0.0+3

- Uploaded samples and changed url

# 1.0.0+2

- Fixing sample images

# 1.0.0+1

- Fixing links on the docs

# 1.0.0

- First release!
