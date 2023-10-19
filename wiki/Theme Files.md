The `SyntaxArea` editor has many customisable properties that let you adjust its look to suit your needs. In addition to colour properties such as `CaretColor` and `BackColor`, _tokens_ (which are produced by the syntax highlighting engine and defined in [[syntax definition files|Syntax Definitions]]) can also be styled. This can be done manually using the `SyntaxArea.Editor.AddToken()` method or these can be specified in _theme files_.

Theme files are specially formatted JSON files that define the colours to use for the editor as well as defining styles for tokens.

## Example
Below is a barebones theme that provides style information for the editor and a minimal number of tokens:

```json
{
	"name": "Example Theme",
	"author": "Garry Pettet",
	"version": "1.0.0",
	"defaultStyle": {
		"textColor": "&h00000000",
		"backColor": "&h00000000",
		"hasBackColor": false,
		"bold": false,
		"italic": false,
		"underline": false
	},
	"invisibleCharacterColor": "&h00BFC5CC",
	"styles": {
		"comment": {
			"textColor": "&h00FF0000",
			"backColor": "&h00000000",
			"hasBackColor": true,
			"bold": false,
			"italic": true,
			"underline": false
		},		
		"keyword": {
			"textColor": "&h000000FF",
			"backColor": "&h00000000",
			"hasBackColor": false,
			"bold": false,
			"italic": false,
			"underline": false
	},
	"backColor": "&h00FFFFFF",
	"blockFoldedColor": "&h00FF8000",
	"blockFoldedEllipsisColor": "&h00AAAAAA",
	"blockFoldMarkerColor": "&h00555555",
	"bookmarkColor": "&h000000FF",
	"bracketHighlightColor": "&h000000FF",
	"caretColor": "&h00000000",
	"dirtyLinesColor": "&h00FFFF00",
	"gutterBackColor": "&h00FFFFFF",
	"gutterBorderColor": "&h00000000",
	"lineNumbersColor": "&h00000000",
	"verticalRulerColor": "&h00AAAAAA",
	"suggestionPopupBackColor": "&h00FFFFFF",
	"suggestionPopupSelectedTextColor": "&h00000000",
	"suggestionPopupTextColor": "&h00000000",
	"textColor": "&h00000000",
	"textSelectionColor": "&h00A4CCFE"
}
```

## Keys
All themes should consider the below keys as **mandatory**.

`name`: The name of the theme as a string.

`author`: The name of the theme's author as a string.

`version`: The theme's version as a semantic version string.

`defaultStyle`: The `TokenStyle` object (see below) for default text.

`invisibleCharacterColor`: The colour to use for invisible characters (e.g. spaces, tabs).

`styles`: An object containing zero or more `TokenStyle` objects. Each key is the name of the token to which the style belongs.

`backColor`: The editor's background colour.

`blockFoldedColor`: The colour of the triangular icon in the gutter used to indicate a folded block.

`blockFoldedEllipsisColor`: The colour of the ellipsis shown within a folded block.

`blockFoldMarkerColor`: The colour of the triangular opening and closing block markers in the gutter.

`bookmarkColor`: The colour of the bookmark icon that appears in the gutter.

`bracketHighlightColor`: The colour used when highlighting matching brackets.

`caretColor`: The colour of the caret (insertion point).

`dirtyLinesColor`: The colour to use for the icon in the gutter that indicates a line is dirty.

`gutterBackColor`: The background colour of the line number gutter.

`gutterBorderColor`: The border colour of the line number gutter.

`lineNumbersColor`: The colour of the line numbers.

`verticalRulerColor`: The colour to use for the optional vertical ruler.

`suggestionPopupBackColor`: The background colour of the autocompletion suggestion window.

`suggestionPopupSelectedTextColor`: The colour of the text of the currently selection option in the autocompletion suggestion window.

`suggestionPopupTextColor`: The colour of text in the autocompletion suggestion window.

`textColor`: The default text colour.

`textSelectionColor`: The colour to use when selecting text.

## Color keys
Where a key expects a colour in the form of a string it should be formatted as:

```nohighlight
"&hAARRGGBB"

Where:
AA: Alpha component (hex)
RR: Red component (hex)
GG: Green component (hex)
BB: Blue component (hex)
```

## TokenStyle objects
The `defaultStyle` key and the keys within the `styles` object expect `TokenStyle` JSON objects. A `TokenStyle` object defines the visual style of a token in the editor and has the following structure:

```json
{
  "textColor": "&h00000000",
  "backColor": "&h00E5E5E5",
  "hasBackColor": true,
  "bold": false,
  "italic": false,
  "underline": false
}
``` 

The structure is fairly self explanatory. The only slightly unexpected requirement is that you must specify a `backColor` even if the token will not have a background colour. The `hasBackColor` key specifies if the token should use the background colour specified by the `backColor` key.