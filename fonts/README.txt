# INPUT

Input is a font family designed for computer programming, data, and text composition. It was designed by David Jonathan Ross between 2012 and 2014. It contains a mulititude of styles so you can select what works best for you and fine-tune your coding environment. It includes Sans, Serif, and Monospaced families, each with four widths, seven weights, and italics. It also includes inputCustomize.py, a command line tool that you can use to further customize the fonts.

You can find more information about the fonts, as well as some examples of them in use, at <http://input.fontbureau.com>.

The entire Input font family is freely available for use on your own computer in plaintext and code. You must purchase inexpensive publishing licenses to use Input in print, on the web, or in any publishing context. Read the enclosed LICENSE.txt for more information, or learn more here: <http://input.fontbureau.com/download>

## FAMILIES

Input Mono is a monospaced typeface, where all characters occupy a fixed width. Input Sans and Serif are proportional typefaces that are designed with all of the features of a good monospace — generous spacing, large punctuation, and easily distinguishable characters — but without the limitations of a fixed width.

## WIDTHS

Input comes in four widths: Normal, Narrow, Condensed, and Compressed. 

I generally tend towards the wider widths, though the narrower widths can be handy if you use a smaller screen, have multiple files side-by-side, or if your code tends to have many characters per line. 

Input Mono Narrow approximates the copyfit of a 10-pitch font, and can be used as an alternative to Courier at the same size.

## WEIGHTS

Input comes in seven weights: Thin, Extra Light, Light, Regular, Medium, Bold, Black.

The Light and Medium weights were designed to be only slightly lighter than Regular and Bold, so that they can appear to be a similar weight when used with light text on a dark background. However, on some operating systems (like Mac OS), a dark background color can cause such significant haloing that the Extra Light or Thin weights may be a better approximation.

In Input’s proportional styles, the Thin, Extra Light, Light, and Regular weights all share the same setwidths, as do the Medium and Bold.

## ITALICS

Input’s Italics are always drawn on the same widths as the correspoding upright style. Input Serif’s Italics have an alternative serif arrangement, which makes them especially distinctive and useful when setting apart blocks of text.

## SIZE

These fonts are primarily intended for small sizes in subpixel-rendered environments. The design’s target size is 11px, but the core weights (Light, Regular, Medium, and Bold) can go anywhere from 9px to 16px, and are manually hinted to improve performance at small sizes across operating systems. The extreme weights (Thin, Extra Light, and Black) styles are intended for 16px+. For use at display sizes, I recommend applying negative tracking and reducing the wordspace.

## COMBINING STYLES

Input’s styles are designed to mix and match, so you can  I can’t predict which styles will work best for you in which combinations, which is why I offer them all. There are plenty of ways that you can mix and match these styles. I have been experimenting with setting my code as follows:

	- Sans for keywords, variables, and text
	- Serif for strings, tags, and values
	- Mono for working in a Terminal, or while editing code that uses wordspaces/tabs for alignment
	- Bold for class and function definitions
	- Italic for comments, special words (like ‘this’ or ‘self’), and secondary languages (like CSS within an HTML document)

## ALTERNATES

Input allows you to use OpenType features or a command-line interface to select your preferred form of easily confusable characters:

	* Stylistic Set 01: Schoolbook a
	* Stylistic Set 02: Schoolbook g

	* Stylistic Set 03: i with top serif (Sans and Mono only)
	* Stylistic Set 04: l with top serif (Sans and Mono only)

	* Stylistic Set 05: i with top and bottom serif (Sans and Mono only)
	* Stylistic Set 06: l with top and bottom serif (Sans and Mono only)

	* Stylistic Set 07: i with full serif (Sans only)
	* Stylistic Set 08: l with full serif (Sans only)

	* Stylistic Set 09: i with top serif and tail (Sans and Mono only)
	* Stylistic Set 10: l with top serif and tail (Sans and Mono only)

	* Stylistic Set 11: Mid-height asterisk
	* Slashed Zero

Here are some examples of how you can customize Input to mimic the arrangement of these characters in common fonts:

	* Monaco 
		* OpenType features: ss01, ss02, ss05, ss06, zero
		* inputCustomize.py: --a=ss --g=ss --i=serifs --l=serifs --zero=slash
	* Menlo 
		* OpenType features: ss02, ss07, ss10, ss11, zero
		* inputCustomize.py: --g=ss --i=serif --l=serifs_round --asterisk=height --zero=slash
	* Andale Mono
		* OpenType features: ss03, ss06
		* inputCustomize.py: --i=topserif --l=serifs
	* Consolas
		* OpenType features: ss07, ss08, zero
		* inputCustomize.py: --i=serif --l=serif --zero=slash
	* Source Code Pro: 
		* OpenType features: ss03, ss10
		* inputCustomize.py: --i=topserif --l=serifs_round --asterisk=height

## CUSTOMIZATION

inputCustomize.py is a command-line python script that allows you to easily make adjustments to your fonts. It requires TTX/FontTools <http://sourceforge.net/projects/fonttools/>.

My hope is that Input will encourage developers of source code editors to include better typographic support, so that these issues don’t need to be addressed in such a hacky way.

### Alternates

Since most coding applications don’t offer support of OpenType features, this tool will swap out default glyphs for their alternate forms. See description of the alternates above.

### Hack for line-spacing

Since many coding applications don’t include the option to adjust line-spacing, you can modify the built-in linespacing of the fonts.

### Hack for four-style families

Since most coding applications don’t allow you to use more than one four-style family, Input allows you to assemble arbitrary four-style families. I use this in order to combine Sans and Serif, by slotting InputSerif–Regular into the Bold Italic position.

Input Sans Hack
	Regular: Input Sans Regular
	Italic: Input Sans Italic
	Bold: Input Sans Bold
	Bold Italic: Input Serif Regular

### Examples

You can use inputCustomize.py like this to work on all fonts in the current working directory:

	$ cd /path/to/the/fonts/you/want/to/edit
	$ python /path/to/inputCustomize.py --dest=/path/to/output  --lineHeight=1.5 --fourStyleFamily --a --g --i=topserif --l=serifs_round --zero --asterisk

Or like this, to create a family out of any four styles:
    
	$ python /path/to/inputCustomize.py InputSans-Regular.ttf InputSans-Italic.ttf InputSans-Bold.ttf InputSerif-Regular.ttf --suffix=Hack --fourStyleFamily --a

For more details, see the script’s help:

	$ python /path/to/inputCustomize.py -h
