## About
`SyntaxArea` is a free, open source, code editor written in 100% Xojo. It's built upon the open source [`TextInputCanvas`][tic] desktop control and implements all standard keyboard shortcuts and fully supports international input.

## Background
This is the third code editor that I've written in Xojo. `SyntaxArea` began as an API 2.0 port of the venerable [`CustomEditField`][cef] (CEF) control but it has been significantly refactored, new features added, is better documented and many bugs have been fixed.

Rather than numerous classes, interfaces and images scattered in multiple folders as was the case with CEF, everything you need to use the `Editor` is contained within the `SyntaxArea` module (and two support modules).

The syntax highlighting engine has been improved and styling information removed from the definition files. The editor now has a theming engine to allow easier switching of its appearance when moving between light and dark mode.

## Features
Here's a list of the some of the editor's features:
- Works on macOS and Windows (Linux _should_ work but is untested)
- 100% API 2.0
- Syntax highlighting (implemented through XML definition files)
- Theme support
- High performance (handles thousands of lines of code with ease)
- Extensive support for keyboard shortcuts
- Autocomplete
- Line numbers
- Optional block folding
- Dirty line support
- Optional right margin ruler
- Undo / redo
- Native scrollbars on macOS with support for Xojo scrollbars on Windows

## Requirements
The editor is 100% native Xojo code. The only dependency is the free and open source [`TextInputCanvas`][tic] plugin. This plugin is a Xojo `Canvas` control that handles international input. Make sure you download it and put it in your Xojo `plugins` folder before launching the Xojo IDE.

## Usage
The best way to get a feel for the editor is to open and run the demo project included in the repo.

The editor is a `TextInputCanvas` subclass and is found within the `SyntaxArea` module. You will need to copy three modules from the demo project into your own:
- `SyntaxArea`: Contains all classes related to the editor.
- `UndoKit`: Contains classes to support undo/redo. This is in a separate module so that you can use it in other projects.
- `MessageCentre`: Supports sending and receiving messages between components in a project. It's used internally within `SyntaxArea` but you can also use it for your own purposes within your own projects.

For more detailed information, [see the Wiki][wiki].

## Feedback
I welcome feedback, bug reports and feature requests. Please open a GitHub issue. I'm also happy to take pull requests - if you make one please make sure you stick to the formatting styles used throughout the project.

## License
This software is provided "as-is" under the MIT license.

## Acknowledgements
- [Alex Restrepo][alexr], the author of the original `CustomEditField`.
- [Thomas Tempelmann][thomast] who has acted as a steward for `CustomEditField` for several years.
- [Matthew Combatti][matthewc] who shared an early port of `CustomEditField` to API 2.0.

[tic]: https://einhugur.com/Html/opensource.html 
[cef]: https://github.com/tempelmann/custom-editfield
[alexr]: https://github.com/alexrestrepo
[thomast]: https://www.tempel.org
[matthewc]: https://github.com/simulanics
[wiki]: https://github.com/gkjpettet/SyntaxArea/wiki