/** 02.typ
 *
 * This is an example chapter in a multi-file typst project.
 *
***/

#import "../preamble.typ": *
#import "@preview/scholarly-tauthesis:0.8.0" as tauthesis

= Writing practices <writing-practices>

Effective written communication requires both sound content and clear style.
Keep the layout of your thesis neat and pay attention to your writing style.

== Text <text>

Do not worry about the layout of the text, this template takes care of it
already. Brief basics of writing style:

- Always think of your reader when you are writing and proceed logically from
  general to specific.
- Highlight your key points, for example, by discussing them in a
  separate section or subsection, or presenting them in a table
  or figure. Use _italics_ (`_text_`) for emphasis, but don’t
  overdo it.
- Avoid long sentences and complicated statements. A full stop is
  the best way
  to end a sentence.
- Use active verbs to make a dynamic impression but avoid the
  first person pronoun I, except in your preface.
- Avoid jargon and wordiness. Use established terminology and
  neutral language.
- The minimum length of sections and subsections is two
  paragraphs, and you need to consider the balance of chapters.
  Paragraphs must always consist of more than one sentence.
- Do not use more than three levels of numbered headings, such as
  $4.4.2$. However, keep in mind that $3$ different levels of
  sections is already a bit much.
- Do not use too many abbreviations. Use capital and small
  letters consistently. You might wish to define new commands in
  the `preamble.typ` file, for words you do not wish to misspell.
  For example, the `preamble.typ` file defines the command `#eeg`,
  which is typeset as #eeg.

== Images <figures>

You must refer to all the images in the body text. The reference should
preferably appear on the same page as the actual image or before it. Images and
tables must be numbered consistently and primarily placed at the top of the
page, but you are free to decide where they fit best. typst takes care of the
numbering, if you specify a unique label `<label-name>` right after the a image
or a table. Cross-referencing is done by prefixing the identifier inside the
angle brackets with a `@` symbol: `@label-name`. For example, the code
```typst
#figure(
    image(
        "../images/tau-logo-fin-eng.svg",
        width: 80%
    ),
    caption: [Tampere University logo.],
) <tau-logo>
```
is rendered as seen in @tau-logo:
#figure(
    image(
        "../images/tau-logo-fin-eng.svg",
        width: 80%
    ),
    caption: [Tampere University logo. @tau-logo-image],
) <tau-logo>

Never start or end a chapter with a image, table, equation or list. The caption
is placed under an image. The contents of all images must be explained in the
text body, so that the readers know what they are supposed to notice. Images
generated by analysis software usually need further editing. The figures should
be in the same language as other text. The recommended font size is the same as
that of the body text, #unitful(11, "pt"). All images must be readable, even if
your thesis is printed in greyscale. Whenever possible, use images in vector
formats such as `.svg` (typst version #version(0,11,0) does not digest `.pdf`
or `.eps` files), as they can be scaled without loss of quality.

== Tables <tables>

Tables are convenient for presenting information in a concise way, especially
numerical data. Tables have numbered captions, see @tab-evaporation-conditions
for an example. The caption is placed on the same page but above the table,
unlike the captions that accompany images. You must refer to all the tables in
the body text. In addition, you must discuss the content of any tables in the
body text to ensure that readers understand their relevance.

Mark the titles of the columns and units clearly. You can use underscores
`_emph_` to highlight the titles, if necessary. The order of the columns and
rows must be carefully considered. Ideally, all cells should _not_ be
surrounded with a border, as it may make your table harder to read. The numbers
should be aligned at the decimal point for easy comparison. You should
preferably use SI units, established prefixes and rewrite large numbers so that
the power of ten should be placed in the title of the column instead of each
row, if possible. More suggestions can be found in @pubadvice2009.

To actually draw a table, we issue a ```typst #figure``` call
with a `table` as its argument:
```typst
#import table: cell, header, hline, vline
#[
    #show table.cell.where(y: 0): strong
    #figure(
        table(
            columns: 5,
            stroke: none,
            align: center + horizon,
            table.header(
                [Substance],
                table.vline(),
                [Pressure (#unit(pascal))],
                table.vline(),
                [Pressure (#unit(bar))],
                table.vline(),
                [Pressure (#unit(mmHg))],
                table.vline(),
                [Temprature ($degree.c$)]
            ),
            table.hline(),
            [Mercury],
            num(1.0),
            num(0.0001),
            num(0.0075),
            num(41.85),
            [Tungsten],
            num(1.0),
            num(0.0001),
            num(0.0075),
            num(3203),
        ),
        caption: [Vapour pressures of two metals. @wikipedia-vapor-pressure],
    ) <tab-evaporation-conditions>
]
```
The added ```typst #[...]``` around the whole figure restricts the scope of the
show rule to this table. This results in @tab-evaporation-conditions being
displayed:
#[
    #import table: cell, header, hline, vline
    #show table.cell.where(y: 0): strong
    #figure(
        table(
            columns: 5,
            stroke: none,
            align: center + horizon,
            table.header(
                [Substance],
                table.vline(),
                [Pressure (#unit(pascal))],
                table.vline(),
                [Pressure (#unit(bar))],
                table.vline(),
                [Pressure (#unit(mmHg))],
                table.vline(),
                [Temprature ($degree.c$)]
            ),
            table.hline(),
            [Mercury],
            num(1.0),
            num(0.0001),
            num(0.0075),
            num(41.85),
            [Tungsten],
            num(1.0),
            num(0.0001),
            num(0.0075),
            num(3203),
        ),
        caption: [Vapour pressures of two metals. @wikipedia-vapor-pressure],
    ) <tab-evaporation-conditions>
]

A table should not end a section. That is why after every table
we state some observations about the table. Here we notice that
mercury and tungsten have identical vapour pressures, but at very
different tempratures.

== Mathematical notation and equations <equations>

Numbers are generally written using numerals for the sake of clarity, for
example "6 stages" rather than "six stages", which is nevertheless strongly
preferred to "a couple of stages". You should also use a thousand separator,
i.e. instead of $55700125$ write #num(55700125). Never omit the leading zero in
decimals. A comma is used as a decimal separator in the Finnish language and a
period in the English language.

Like numbers, it is advisable to abbreviate units of measurement. There is a
space between the number and the unit, but you must keep them on the same line.
The space is somewhat shorter than a word space, see 1.0 $mu$m and
$1.0 mu"m"$ for comparison. It is better to compile a table or graph
than include a great deal of numerical values in the body text. Use precise
language and put numbers on a scale (small, fast, expensive).

Use generally known and well defined concepts and standard conventions and
symbols for representing them. New concepts should be defined when they appear
in the text for the first time. Upper case and lower case letters mean
different things in symbols and units of measurement. Do not use the same
symbol to mean different things.

Strings of mathematical symbols such as $Theta(n^2)$ are typeset
in typst using the math mode, between dollar signs: ```typst $math$```
for inline mathematics or ```typst $ math $``` with spaces for
display math. Simple formulas may be displayed within the body of
the text without numbering. As an example of a highlighted
formula, the Fundamental theorem of calculus can be written in the
following way:
$
    integral_[a,b]
    f(x)
    dif x
    =
    F(b) - F(a)
    .
$ <fundamental-theorem-of-calculus>
Here $f$ is the _integrand_, $F$ its _anti-derivative_ and
$[a,b]$ the integration interval.
Please note that all the variables must be defined at the point
of their first appearance. The formulae are shown in a different
typeface on purpose and the symbols are almost always italicised.
Vectors can be written in slanted or upright boldface, or with
arrows:
$
    bold(v)
    &=
    derivative(bold(x), t)
    \
//
    upright(bold(v))
    &=
    derivative(upright(bold(x)), t)
    \
//
    arrow(v)
    &=
    derivative(arrow(x),t)
$
The most important thing is to be consistent throughout your
thesis. Do not mix and match notations, as it will confuse the
reader.  See the file `preamble.typ` for an example of how
you might define a `#vector` command for typesetting vectors
consistently. Defining a command also allows you to easily switch
notations globally, if you are not satisfied with your current
choice.

Units are written in an upright font with a normal weight, to
distinquish them from variables:
$
    |force|
    &=
    mass |acceleration|
    =
    unitful(10.0, #kilo#gram)
    dot
    unitful(9.81, #meter/#second^2)
    =
    unitful(98.1, #newton)
    .
$
Here $force$ is a force vector, $mass$ is the mass of the object
experiencing the force, and $acceleration$ is its acceleration
vector. Again, see the `preamble.typ` file for how you might
define commands for units.

Mathematical formulae are numbered, if they are written on
separate lines and referred to in the main body of the text. The
number is usually put in parenthesis and right aligned, see
@fundamental-theorem-of-calculus for an example. Include any punctuation
(commas, periods) surrounding an equation in the equations
themselves, as is again shown in @fundamental-theorem-of-calculus. Occasionally
the elements of mathematical text are preceded by an identifier,
such as Definition 1 or Theorem 1.

Do not start a sentence with a mathematical symbol but add some
word, such as the name or type of the symbol in front of it.
Variables, such as $x$ and $y$, are generally presented in
italics, whereas elementary functions, special functions and
multi-letter operators are not:
$
    sin(2x + y)
    "  or  "
    lim_(x arrow.r -1)
    (x^2 - 1) / (x + 1)
    =
    -2.
$ <lim-example>
As a rule of thumb, it is best to rely on the automated
formatting of an equation editor, such as the one provided by
typst.

Vectors and matrices are written with the `vec` and `mat` functions:
$
    matrix(A)
    vector(x)
    =
    mat(
        A_(1,1), A_(1,2) ;
        A_(2,1), A_(2,2) ;
    )
    vec(x_1,x_2)
    =
    vec(b_1,b_2)
    =
    vector(b)
    .
$
See the typst documentation on mathematics @typst-math for examples of how
different symbols are written.

== Programs and algorithms <algorithms>

Codes and algorithms are written using a monospaced font. If the
length of the code or algorithm is less than 10 lines and you do
not refer to it later on in the text, you can present it
similarly to formulas. If the code is longer but shorter than a
page, you present like a figure titled "Listing" or "Algorithm".
In typst, code blocks are presented in backticks:
``````typst
```typst
#figure(
    raw(
        read("../code/square.jl"),
        lang: "julia",
        block : true
    ),
    caption: [The square of $x in bb(R)$ and $x in bb(C)$, written in Julia.],
) <program-example>
```
``````
The above results in what is seen in @program-example-example:
#figure(
    ```typst
#figure(
    raw(
        read("../code/square.jl"),
        lang: "julia",
        block : true
    ),
    caption: [The square of $x in bb(R)$ and $x in bb(C)$, written in Julia.],
) <program-example>
    ```,
    caption: [ A code block.]
) <program-example-example>
and removing the backticks would actually load code from the file `code/square.jl`
to be displayed in the numbered @program-example:

#figure(
    raw(
        read("../code/square.jl"),
        lang: "julia",
        block : true
    ),
    caption: [The square of $x in bb(R)$ and $x in bb(C)$, written in Julia.],
) <program-example>

Again, listings should not end sections. You should always
describe what is going on in the displayed code after presenting
a listing.


== Theorem blocks <theorems>

@pythagorean-theorem and @pythagoraan-lause show examples of theorem blocks:

#tauthesis.example(
    title: [Pythagorean theorem],
    reflabel: "pythagorean-theorem"
)[
For sides $a$, $b$ and $c$ of a right triangle, where $c$ is the _hypotenuse_, the following equality holds:
$
    a^2 + b^2 = c^2.
$
]

#tauthesis.esimerkki(
    title: [Pythagoraan lause],
    reflabel: "pythagoraan-lause"
)[
Suorakulmaisen kolmion sivut $a$, $b$ and $c$, missä $c$ on _hypotenuusa_, toteuttavat yhtälön
$
    a^2 + b^2 = c^2.
$
]

As one can see, these follow the same counter. The theorem box has been typeset with the command
```typst
#tauthesis.example(
    title: [Pythagorean theorem],
    reflabel: "pythagorean-theorem"
)[
    For sides $a$, $b$ and $c$ of a right triangle, where $c$ is the _hypotenuse_, the following equality holds:
    $
        a^2 + b^2 = c^2.
    $
]
```
Notice that the reference label is not placed after the function call,
but given as a named argument to the function.

The module `tauthesis` defines the theorem box functions
- `definition`,
- `theorem`,
- `lemma`,
- `corollary` and
- `example`,
and their Finnish equivalents
- `määritelmä`,
- `lause`,
- `apulause`,
- `seurauslause` and
- `esimerkki`.
These all follow the same counter, and can all be referenced by
suffixing the equivalent function call with a tag.

Try not to overuse these, however. Academic theses should _not_ be written in
the _Landau style_, where the entire text consists of definitions after
definitions and theorems after theorems. There should always be a full
paragraph between two theorems or other objects, such as figures and tables.