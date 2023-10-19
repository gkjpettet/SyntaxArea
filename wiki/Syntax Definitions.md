A syntax definition is an XML file that describes to `SyntaxArea` how to highlight a syntax (language).

Examples of definition files can be found in the `definitions` folder and their effects can be seen within the demo application.

Below is a simplified example of ObjoScript's language definition. The full version can be found within `definitions/Objo.xml`. Note that regular expressions must be escaped for use within XML. This means symbols's such as `>` must be represented as `&gt;` see [this excellent StackOverflow answer][xmlEscapes] for a complete list.

## Example

```xml
<highlightDefinition>
  <name>Objo</name> <!-- The name of the language. Mandatory -->
  
  <!-- This pattern stipulates the start and end of a block. Multiple block start and end tags can be used -->
  <blockStartMarker indent="1">\{\W*(?:$|#)</blockStartMarker> <!-- `indent` stipulates how much to indent. If in doubt, use 1 -->
  <blockEndMarker>^\W*\}</blockEndMarker>

  <!-- Symbols are optional. These represent tokens in the source code that have a semantic meaning. 
  They are accessible within the editor and can be navigated to. This can be seen in the demo application by clicking on the 
  symbol bar beneath the editor text. This example just has one symbol but you can have zero or many. -->
  <symbols>
	<symbol type="class">
	  <entryRegEx>^\s*class [^ {]*</entryRegEx>
	</symbol>
  </symbols>

  <!-- Each definition file should have at least one `contexts` element. Nested within `contexts` are `highlightContext` nodes which 
  define the regular expressions to match tokens in the editor's text that can be styled. You can stipulate the case sensitivity at the `contexts` or `highlightContext` level. -->
  <contexts caseSensitive="yes"><!-- ObjoScript is case-sensitive -->
	<!-- Each highlight context should have a unique name. The editor will look for a style in the current theme matching this name in order to style the token. Themes are encouraged to define a handful of common style names. Thanks to this you can
	define a "fallback" name to use in case the theme currently being used doesn't define a style for "name". You can see an
	example of this in the "uppercaseIdentifier" context below. -->
	<highlightContext name="objoComment" fallback="comment">
	  <startRegEx>#</startRegEx> <!-- everything between `startRegEx` and `endRegEx` will be a "comment" -->
	  <endRegEx>[\n\r]</endRegEx>
	</highlightContext>

	<highlightContext name="objoUppercaseIdentifier" fallback="identifier">
	<!-- Anything matching `entryRegEx` pattern will be styled as "uppercaseIdentifier". If the current theme doesn't define
	this style then "identifier" will be used. -->
	  <entryRegEx>\b[A-Z]\w*</entryRegEx>
	</highlightContext>

	<highlightContext name="objoType", fallback="identifier">
	<!-- Any strings exactly listed within a `keywords` element will be matched.-->
	  <keywords>
		<string>Boolean</string>
		<string>Number</string>
	  </keywords>
	</highlightContext>
  </contexts>
</highlightDefinition>
```

Let's take a closer look at each section more closely.

## Name
The `<name>` node stipulates the definition's name.

## Block markers
SyntaxEditor supports automatically indenting code within blocks and can optionally allow the folding of blocks of code. To do this the editor needs to know what constitutes the start and end of a block. For example, in a curly brace language, `{` is the start of a block and `}` is the end of a block. We indicate this to the editor in a definition file using the `<blockStartMarker>` and `<blockEndMarker>` nodes.

`<blockStartMarker>` and `<blockEndMarker>` nodes should be provided **as a pair**. A definition may provide no block markers (for example plain text or Markdown doesn't really have a context of blocks) or any number so long as they are paired. This is useful for languages such as Xojo which have blocks demarcated with lots of different keywords (`do...loop`, `if...end if`, etc).

The text within a `<blockStartMarker>` and `<blockEndMarker>` is the regex pattern to match the block start or end marker. For example, to match a block opening `{` in Objo we would write:

```xml
<blockStartMarker>\{\W*(?:$|#)</blockStartMarker>
```

This pattern says to match a literal `{` character followed by optional whitespace up to the end of the line or the start of a comment (which in Objo begins with a `#`). The block end marker is simpler:

```xml
<blockEndMarker>^\W*\}</blockEndMarker>
```

This states that block end markers are the `}` character at the start of a line preceded by any non-word characters.

## Symbols
The `<symbols>` node is optional.

Symbols are tokens that can be matched by the editor using a regex pattern specified in the definition file. Unlike highlight contexts (see later) these matches are not styled but can be used to navigate through the document in the editor. In the Objo example above there is a single symbol "class" that will find all class definitions in the text and keep a reference to where they are in the document. In the demo app you can click the symbol navigator in the bottom right to see all class definitions. Clicking on one will jump to the line in the document that the symbol occurs on.

Here's the simplified Objo class symbol definition:

```xml
<symbol type="class">
	<entryRegEx>^\s*class [^ {]*</entryRegEx>
</symbol>
```

Notice that the regex pattern is contained within a tag named `<entryRegEx>`. This is different from the block markers described above where the regex pattern is the only contents of the node. The regex in the example looks for the word `class` at the start of a line (forgiving preceding whitespace) followed by any characters except a `{` (since the `{` marks the beginning of the class block).

## Contexts
Contexts are the meat of a definition file. Every definition file should have at least one `<contexts>` node. You only need one but you can have multiple to help you organise your code more easily. When the editor parses the definition file it lumps all contexts together. You can specify the case-sensitivity of all searches within a context using the `caseSensitive` attribute which should be set to either `"yes"` or `"no"`. This setting can be overridden by individual highlight contexts within the main context (see below).

### Highlight contexts
The `<contexts>` node should contain one or more `<highlightContext>` nodes. 

Each `<highlightContext>` node describes some text that can be styled by a theme within the editor. Let's take a closer look at a simple highlight context for Objo that matches a comment:

```xml
<highlightContext name="objoComment" fallback="comment">
  <startRegEx>#</startRegEx> <!-- everything between `startRegEx` and `endRegEx` will be a "comment" -->
  <endRegEx>[\n\r]</endRegEx>
</highlightContext>
```

Each `highlightContext` needs a unique name. It's highly recommend that you prefix the name with the name of the language. For example, the highlight context that defines comments in Objo is named `objoComment` rather than `comment`. This is important for extensions (defined later).

You can also provide a _fallback_ name for a highlight context. Take the example above. If the theme currently in use by the editor doesn't define a style for a token named `objoComment` then it would check to see if it has a style named `comment` instead. If it did it would fallback to using that styling data. If you don't provide a fallback or if neither the original name or the fallback style are available then the default theme style is used for the token.

You must provide a regex pattern for each `highlightContext` that represents the whole token. This can either match on a single line as (using the `<entryReg>` node) or can span multiple lines using the `<startRegEx>` and `<endRegEx>` nodes as in the example above.

In the above example the highlighting engine will try to match the `#` character. If it does it will match everything after it up until the pattern in `<endRegEx>` which in this case is a newline.

### Nested highlight contexts
It's perfectly reasonable to nest highlight contexts. Take a look at the snippet below taken from the `Html.xml` definition in the demo app:

```xml
<highlightContext name="htmlTag" fallback="tag">
	<entryRegEx>(&lt;[^&gt;]*&gt;)</entryRegEx>
	<highlightContext name="htmlStringInTag" fallback="string">
		<entryRegEx>("[^"&gt;&lt;]*")</entryRegEx>
	</highlightContext>
</highlightContext>
```

Firstly notes again how the `<` and `>` have to be escaped in XML (as &lt; and &gt; respectively). In this example the highlighter will first find an html tag (e.g. `<div name="main">`) and mark it as an `htmlTag` (falling back to `tag` if the theme doesn't have a style named `htmlTag`). Then the highlighter will take the string matched by the regex in `<entryRegEx>` and forward it for processing to any sub contexts (i.e. nested highlight contexts). In this case it will look for characters encased within double quotes. If it finds any it marks them as `htmlStringInTag` tokens for further styling.

## Definition extensions
A powerful feature of SyntaxArea is its ability to extend one definition with the contents of another definition. Let's take a look at what this looks like, this time with a snippet from the `Markdown.xml` definition for code fences:

```xml
<highlightContext name="xojoCodeFence" fallback="codeFence" extension="xojo">
	<startRegEx>^```xojo[ ]*\n</startRegEx>
	<endRegEx>^```(\n|$)</endRegEx>
</highlightContext>
```

Notice the `extension="xojo"` attribute. What this does is when the definition is **first loaded from XML** the editor that the definition belongs to will ask the host application (via the `SyntaxArea.Editor.RequestDefinitionExtension(name)`) event for the `SyntaxArea.HighlightDefinition` corresponding to `name`. In this case, the host will be asked for a definition for "xojo". If the host app doesn't have a definition for that language it returns Nil. Since this is only done once when the definition is first loaded there is no performance impact whilst typing from the use of extensions. The editor will then inject all highlight contexts defined in the "xojo" definition into the "xojoCodeFence" context.

In this specific example what will happen is that the engine first matches all text that is flanked by ```` ```xojo ```` and ```` ``` ````. It will then pass the matched text to the contexts defined in the "xojo" definition. This allows us to highlight Xojo code within a Markdown code fence. Pretty cool right?

It should be clear now why I recommend giving every highlight context name a language-specific prefix as it makes styling easier.

I encourage you to look through the `Markdown.xml` and `Html.xml` definition files as they both make heavy use of extensions.

[xmlEscapes]: https://stackoverflow.com/a/1091953/278816 