package main

var keywords = []string{"break", "else", "continue", "class", "module", "elsif", "end", "def", "begin"}

var groups = []struct {
	name        string   // name of the function / method
	comment     string   // comment appended to name
	variadic    bool     // is the parameter variadic?
	opening     string   // opening token
	closing     string   // closing token
	separator   string   // separator token
	multi       bool     // items are always on multiple lines
	parameters  []string // parameter names
	preventFunc bool     // prevent the fooFunc function/method
	indent      bool     // indent the body
}{
	{
		name:       "Parens",
		comment:    "renders a single item in parenthesis. Use for type conversion or to specify evaluation order.",
		variadic:   false,
		opening:    "(",
		closing:    ")",
		separator:  "",
		parameters: []string{"item"},
	},
	{
		name:       "List",
		comment:    "renders a comma separated list. Use for multiple return functions.",
		variadic:   true,
		opening:    "",
		closing:    "",
		separator:  ",",
		parameters: []string{"items"},
	},
	{
		name:       "Index",
		comment:    "renders a colon separated list enclosed by square brackets. Use for array / slice indexes and definitions.",
		variadic:   true,
		opening:    "[",
		closing:    "]",
		separator:  ",",
		parameters: []string{"items"},
	},
	{
		name:       "Block",
		comment:    "renders a statement list enclosed by curly braces. Use for code blocks. A special case applies when used directly after Case or Default, where the braces are omitted. This allows use in switch and select statements.",
		variadic:   true,
		opening:    "begin",
		closing:    "end",
		multi:      true,
		parameters: []string{"statements"},
	},
	{
		name:       "Call",
		comment:    "renders a comma separated list enclosed by parenthesis. Use for function calls.",
		variadic:   true,
		opening:    "(",
		closing:    ")",
		separator:  ", ",
		parameters: []string{"params"},
	},
	{
		name:       "Params",
		comment:    "renders a comma separated list enclosed by parenthesis. Use for function parameters and method receivers.",
		variadic:   true,
		opening:    "(",
		closing:    ")",
		separator:  ",",
		parameters: []string{"params"},
	},
	{
		name:       "Hash",
		comment:    "renders the keyword followed by a single item enclosed by square brackets. Use for map definitions.",
		variadic:   false,
		opening:    "{",
		closing:    "}",
		separator:  "",
		parameters: []string{"typ"},
	},
	{
		name:       "If",
		comment:    "renders the keyword followed by a semicolon separated list.",
		variadic:   false,
		opening:    "if ",
		closing:    "",
		separator:  ";",
		parameters: []string{"conditions"},
	},
	{
		name:       "Return",
		comment:    "renders the keyword followed by a comma separated list.",
		variadic:   true,
		opening:    "return ",
		closing:    "",
		separator:  ",",
		parameters: []string{"results"},
	},
	{
		name:       "Case",
		comment:    "renders the keyword followed by a semicolon separated list.",
		variadic:   false,
		opening:    "case ",
		closing:    "end",
		separator:  "",
		parameters: []string{"conditions"},
	},
	{
		name:       "Wjen",
		comment:    "renders the keyword followed by a comma separated list.",
		variadic:   true,
		opening:    "when ",
		closing:    "",
		separator:  ",",
		parameters: []string{"cases"},
	},
	{
		name:       "Ended",
		comment:    "renders the body followed by the end keyword. Use for code blocks.",
		closing:    "end",
		separator:  "",
		multi:      true,
		variadic:   true,
		parameters: []string{"body"},
		indent:     true,
	},
}
