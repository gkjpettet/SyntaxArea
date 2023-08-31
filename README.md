## About
`SyntaxArea` is a free, open source, code editor written in 100% Xojo. It's built upon the open source [`TextInputCanvas`][tic] desktop control and implements all keyboard shortcuts and fully supports international input.

## Background
This is the third (and currently best!) code editor that I've written in Xojo. `SyntaxArea` began as an API 2.0 port of the venerable [`CustomEditField`][cef] (CEF) control but has been significantly refactored, is better documented and many bugs have been fixed.

Rather than numerous classes, interfaces and images scattered in multiple folders as was the case with CEF, everything you need for to use the `SyntaxArea` `Editor` is contained within the `SyntaxArea` module (and two support modules).

## Features
Here is a list of the some of the editor's features:
- Works on macOS and Windows (Linux should work but is untested)
- 100% API 2.0
- Syntax highlighting (implemented through XML definition files)
- Dark mode support
- High performance (handles thousands of lines of code with ease)
- Extensive support for keyboard shortcuts
- Autocomplete support
- Line numbers
- Optional block folding
- Very customisable appearance
- Dirty line support
- Optional right margin ruler
- Undo / redo
- Native scrollbars on macOS with support for Xojo scrollbars on Windows.

## Requirements
The editor is 100% native Xojo code. The only dependency is the free and open source [`TextInputCanvas`][tic] plugin. This plugin is a Xojo `Canvas` control that handles international input. Make sure you download it and put it in your Xojo `plugins` folder before launching the Xojo IDE.

## Usage
The best way to get a feel for the editor is to open and run the demo project included in the repo.

The editor is a `TextInputCanvas` subclass and is found within the `SyntaxArea` module. You will need to copy three modules from the demo project into your own:
- `SyntaxArea`: Contains all classes related to the editor.
- `UndoKit`: Contains classes to support undo/redo. This is in a separate module so that you can use it in other projects.
- `MessageCentre`: Supports sending and receiving messages between components in a project. It's used internally within SyntaxArea but you can also use it for your own purposes within your own projects.

## Feedback
I welcome feedback, bug reports and feature requests. Please open a GitHub issue. I'm also happy to take pull requests - if you make one please make sure you stick to the formatting styles used throughout the project.

[tic]: https://einhugur.com/Html/opensource.html 
[cef]: https://github.com/tempelmann/custom-editfield