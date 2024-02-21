// This file is generated - do not edit.

package rubby

// Parens renders a single item in parenthesis. Use for type conversion or to specify evaluation order.
func Parens(item Code) *Statement {
	return newStatement().Parens(item)
}

// Parens renders a single item in parenthesis. Use for type conversion or to specify evaluation order.
func (g *Group) Parens(item Code) *Statement {
	s := Parens(item)
	g.items = append(g.items, s)
	return s
}

// Parens renders a single item in parenthesis. Use for type conversion or to specify evaluation order.
func (s *Statement) Parens(item Code) *Statement {
	g := &Group{
		close:     ")",
		indent:    false,
		items:     []Code{item},
		multi:     false,
		name:      "parens",
		open:      "(",
		separator: "",
	}
	*s = append(*s, g)
	return s
}

// List renders a comma separated list. Use for multiple return functions.
func List(items ...Code) *Statement {
	return newStatement().List(items...)
}

// List renders a comma separated list. Use for multiple return functions.
func (g *Group) List(items ...Code) *Statement {
	s := List(items...)
	g.items = append(g.items, s)
	return s
}

// List renders a comma separated list. Use for multiple return functions.
func (s *Statement) List(items ...Code) *Statement {
	g := &Group{
		close:     "",
		indent:    false,
		items:     items,
		multi:     false,
		name:      "list",
		open:      "",
		separator: ",",
	}
	*s = append(*s, g)
	return s
}

// ListFunc renders a comma separated list. Use for multiple return functions.
func ListFunc(f func(*Group)) *Statement {
	return newStatement().ListFunc(f)
}

// ListFunc renders a comma separated list. Use for multiple return functions.
func (g *Group) ListFunc(f func(*Group)) *Statement {
	s := ListFunc(f)
	g.items = append(g.items, s)
	return s
}

// ListFunc renders a comma separated list. Use for multiple return functions.
func (s *Statement) ListFunc(f func(*Group)) *Statement {
	g := &Group{
		close:     "",
		indent:    false,
		multi:     false,
		name:      "list",
		open:      "",
		separator: ",",
	}
	f(g)
	*s = append(*s, g)
	return s
}

// Index renders a colon separated list enclosed by square brackets. Use for array / slice indexes and definitions.
func Index(items ...Code) *Statement {
	return newStatement().Index(items...)
}

// Index renders a colon separated list enclosed by square brackets. Use for array / slice indexes and definitions.
func (g *Group) Index(items ...Code) *Statement {
	s := Index(items...)
	g.items = append(g.items, s)
	return s
}

// Index renders a colon separated list enclosed by square brackets. Use for array / slice indexes and definitions.
func (s *Statement) Index(items ...Code) *Statement {
	g := &Group{
		close:     "]",
		indent:    false,
		items:     items,
		multi:     false,
		name:      "index",
		open:      "[",
		separator: ",",
	}
	*s = append(*s, g)
	return s
}

// IndexFunc renders a colon separated list enclosed by square brackets. Use for array / slice indexes and definitions.
func IndexFunc(f func(*Group)) *Statement {
	return newStatement().IndexFunc(f)
}

// IndexFunc renders a colon separated list enclosed by square brackets. Use for array / slice indexes and definitions.
func (g *Group) IndexFunc(f func(*Group)) *Statement {
	s := IndexFunc(f)
	g.items = append(g.items, s)
	return s
}

// IndexFunc renders a colon separated list enclosed by square brackets. Use for array / slice indexes and definitions.
func (s *Statement) IndexFunc(f func(*Group)) *Statement {
	g := &Group{
		close:     "]",
		indent:    false,
		multi:     false,
		name:      "index",
		open:      "[",
		separator: ",",
	}
	f(g)
	*s = append(*s, g)
	return s
}

// Block renders a statement list enclosed by curly braces. Use for code blocks. A special case applies when used directly after Case or Default, where the braces are omitted. This allows use in switch and select statements.
func Block(statements ...Code) *Statement {
	return newStatement().Block(statements...)
}

// Block renders a statement list enclosed by curly braces. Use for code blocks. A special case applies when used directly after Case or Default, where the braces are omitted. This allows use in switch and select statements.
func (g *Group) Block(statements ...Code) *Statement {
	s := Block(statements...)
	g.items = append(g.items, s)
	return s
}

// Block renders a statement list enclosed by curly braces. Use for code blocks. A special case applies when used directly after Case or Default, where the braces are omitted. This allows use in switch and select statements.
func (s *Statement) Block(statements ...Code) *Statement {
	g := &Group{
		close:     "end",
		indent:    false,
		items:     statements,
		multi:     true,
		name:      "block",
		open:      "begin",
		separator: "",
	}
	*s = append(*s, g)
	return s
}

// BlockFunc renders a statement list enclosed by curly braces. Use for code blocks. A special case applies when used directly after Case or Default, where the braces are omitted. This allows use in switch and select statements.
func BlockFunc(f func(*Group)) *Statement {
	return newStatement().BlockFunc(f)
}

// BlockFunc renders a statement list enclosed by curly braces. Use for code blocks. A special case applies when used directly after Case or Default, where the braces are omitted. This allows use in switch and select statements.
func (g *Group) BlockFunc(f func(*Group)) *Statement {
	s := BlockFunc(f)
	g.items = append(g.items, s)
	return s
}

// BlockFunc renders a statement list enclosed by curly braces. Use for code blocks. A special case applies when used directly after Case or Default, where the braces are omitted. This allows use in switch and select statements.
func (s *Statement) BlockFunc(f func(*Group)) *Statement {
	g := &Group{
		close:     "end",
		indent:    false,
		multi:     true,
		name:      "block",
		open:      "begin",
		separator: "",
	}
	f(g)
	*s = append(*s, g)
	return s
}

// Call renders a comma separated list enclosed by parenthesis. Use for function calls.
func Call(params ...Code) *Statement {
	return newStatement().Call(params...)
}

// Call renders a comma separated list enclosed by parenthesis. Use for function calls.
func (g *Group) Call(params ...Code) *Statement {
	s := Call(params...)
	g.items = append(g.items, s)
	return s
}

// Call renders a comma separated list enclosed by parenthesis. Use for function calls.
func (s *Statement) Call(params ...Code) *Statement {
	g := &Group{
		close:     ")",
		indent:    false,
		items:     params,
		multi:     false,
		name:      "call",
		open:      "(",
		separator: ", ",
	}
	*s = append(*s, g)
	return s
}

// CallFunc renders a comma separated list enclosed by parenthesis. Use for function calls.
func CallFunc(f func(*Group)) *Statement {
	return newStatement().CallFunc(f)
}

// CallFunc renders a comma separated list enclosed by parenthesis. Use for function calls.
func (g *Group) CallFunc(f func(*Group)) *Statement {
	s := CallFunc(f)
	g.items = append(g.items, s)
	return s
}

// CallFunc renders a comma separated list enclosed by parenthesis. Use for function calls.
func (s *Statement) CallFunc(f func(*Group)) *Statement {
	g := &Group{
		close:     ")",
		indent:    false,
		multi:     false,
		name:      "call",
		open:      "(",
		separator: ", ",
	}
	f(g)
	*s = append(*s, g)
	return s
}

// Params renders a comma separated list enclosed by parenthesis. Use for function parameters and method receivers.
func Params(params ...Code) *Statement {
	return newStatement().Params(params...)
}

// Params renders a comma separated list enclosed by parenthesis. Use for function parameters and method receivers.
func (g *Group) Params(params ...Code) *Statement {
	s := Params(params...)
	g.items = append(g.items, s)
	return s
}

// Params renders a comma separated list enclosed by parenthesis. Use for function parameters and method receivers.
func (s *Statement) Params(params ...Code) *Statement {
	g := &Group{
		close:     ")",
		indent:    false,
		items:     params,
		multi:     false,
		name:      "params",
		open:      "(",
		separator: ",",
	}
	*s = append(*s, g)
	return s
}

// ParamsFunc renders a comma separated list enclosed by parenthesis. Use for function parameters and method receivers.
func ParamsFunc(f func(*Group)) *Statement {
	return newStatement().ParamsFunc(f)
}

// ParamsFunc renders a comma separated list enclosed by parenthesis. Use for function parameters and method receivers.
func (g *Group) ParamsFunc(f func(*Group)) *Statement {
	s := ParamsFunc(f)
	g.items = append(g.items, s)
	return s
}

// ParamsFunc renders a comma separated list enclosed by parenthesis. Use for function parameters and method receivers.
func (s *Statement) ParamsFunc(f func(*Group)) *Statement {
	g := &Group{
		close:     ")",
		indent:    false,
		multi:     false,
		name:      "params",
		open:      "(",
		separator: ",",
	}
	f(g)
	*s = append(*s, g)
	return s
}

// Hash renders the keyword followed by a single item enclosed by square brackets. Use for map definitions.
func Hash(typ Code) *Statement {
	return newStatement().Hash(typ)
}

// Hash renders the keyword followed by a single item enclosed by square brackets. Use for map definitions.
func (g *Group) Hash(typ Code) *Statement {
	s := Hash(typ)
	g.items = append(g.items, s)
	return s
}

// Hash renders the keyword followed by a single item enclosed by square brackets. Use for map definitions.
func (s *Statement) Hash(typ Code) *Statement {
	g := &Group{
		close:     "}",
		indent:    false,
		items:     []Code{typ},
		multi:     false,
		name:      "hash",
		open:      "{",
		separator: "",
	}
	*s = append(*s, g)
	return s
}

// If renders the keyword followed by a semicolon separated list.
func If(conditions Code) *Statement {
	return newStatement().If(conditions)
}

// If renders the keyword followed by a semicolon separated list.
func (g *Group) If(conditions Code) *Statement {
	s := If(conditions)
	g.items = append(g.items, s)
	return s
}

// If renders the keyword followed by a semicolon separated list.
func (s *Statement) If(conditions Code) *Statement {
	g := &Group{
		close:     "",
		indent:    false,
		items:     []Code{conditions},
		multi:     false,
		name:      "if",
		open:      "if ",
		separator: ";",
	}
	*s = append(*s, g)
	return s
}

// Return renders the keyword followed by a comma separated list.
func Return(results ...Code) *Statement {
	return newStatement().Return(results...)
}

// Return renders the keyword followed by a comma separated list.
func (g *Group) Return(results ...Code) *Statement {
	s := Return(results...)
	g.items = append(g.items, s)
	return s
}

// Return renders the keyword followed by a comma separated list.
func (s *Statement) Return(results ...Code) *Statement {
	g := &Group{
		close:     "",
		indent:    false,
		items:     results,
		multi:     false,
		name:      "return",
		open:      "return ",
		separator: ",",
	}
	*s = append(*s, g)
	return s
}

// ReturnFunc renders the keyword followed by a comma separated list.
func ReturnFunc(f func(*Group)) *Statement {
	return newStatement().ReturnFunc(f)
}

// ReturnFunc renders the keyword followed by a comma separated list.
func (g *Group) ReturnFunc(f func(*Group)) *Statement {
	s := ReturnFunc(f)
	g.items = append(g.items, s)
	return s
}

// ReturnFunc renders the keyword followed by a comma separated list.
func (s *Statement) ReturnFunc(f func(*Group)) *Statement {
	g := &Group{
		close:     "",
		indent:    false,
		multi:     false,
		name:      "return",
		open:      "return ",
		separator: ",",
	}
	f(g)
	*s = append(*s, g)
	return s
}

// Case renders the keyword followed by a semicolon separated list.
func Case(conditions Code) *Statement {
	return newStatement().Case(conditions)
}

// Case renders the keyword followed by a semicolon separated list.
func (g *Group) Case(conditions Code) *Statement {
	s := Case(conditions)
	g.items = append(g.items, s)
	return s
}

// Case renders the keyword followed by a semicolon separated list.
func (s *Statement) Case(conditions Code) *Statement {
	g := &Group{
		close:     "end",
		indent:    false,
		items:     []Code{conditions},
		multi:     false,
		name:      "case",
		open:      "case ",
		separator: "",
	}
	*s = append(*s, g)
	return s
}

// Wjen renders the keyword followed by a comma separated list.
func Wjen(cases ...Code) *Statement {
	return newStatement().Wjen(cases...)
}

// Wjen renders the keyword followed by a comma separated list.
func (g *Group) Wjen(cases ...Code) *Statement {
	s := Wjen(cases...)
	g.items = append(g.items, s)
	return s
}

// Wjen renders the keyword followed by a comma separated list.
func (s *Statement) Wjen(cases ...Code) *Statement {
	g := &Group{
		close:     "",
		indent:    false,
		items:     cases,
		multi:     false,
		name:      "wjen",
		open:      "when ",
		separator: ",",
	}
	*s = append(*s, g)
	return s
}

// WjenFunc renders the keyword followed by a comma separated list.
func WjenFunc(f func(*Group)) *Statement {
	return newStatement().WjenFunc(f)
}

// WjenFunc renders the keyword followed by a comma separated list.
func (g *Group) WjenFunc(f func(*Group)) *Statement {
	s := WjenFunc(f)
	g.items = append(g.items, s)
	return s
}

// WjenFunc renders the keyword followed by a comma separated list.
func (s *Statement) WjenFunc(f func(*Group)) *Statement {
	g := &Group{
		close:     "",
		indent:    false,
		multi:     false,
		name:      "wjen",
		open:      "when ",
		separator: ",",
	}
	f(g)
	*s = append(*s, g)
	return s
}

// Ended renders the body followed by the end keyword. Use for code blocks.
func Ended(body ...Code) *Statement {
	return newStatement().Ended(body...)
}

// Ended renders the body followed by the end keyword. Use for code blocks.
func (g *Group) Ended(body ...Code) *Statement {
	s := Ended(body...)
	g.items = append(g.items, s)
	return s
}

// Ended renders the body followed by the end keyword. Use for code blocks.
func (s *Statement) Ended(body ...Code) *Statement {
	g := &Group{
		close:     "end",
		indent:    true,
		items:     body,
		multi:     true,
		name:      "ended",
		open:      "",
		separator: "",
	}
	*s = append(*s, g)
	return s
}

// EndedFunc renders the body followed by the end keyword. Use for code blocks.
func EndedFunc(f func(*Group)) *Statement {
	return newStatement().EndedFunc(f)
}

// EndedFunc renders the body followed by the end keyword. Use for code blocks.
func (g *Group) EndedFunc(f func(*Group)) *Statement {
	s := EndedFunc(f)
	g.items = append(g.items, s)
	return s
}

// EndedFunc renders the body followed by the end keyword. Use for code blocks.
func (s *Statement) EndedFunc(f func(*Group)) *Statement {
	g := &Group{
		close:     "end",
		indent:    true,
		multi:     true,
		name:      "ended",
		open:      "",
		separator: "",
	}
	f(g)
	*s = append(*s, g)
	return s
}

// Break renders the break keyword.
func Break() *Statement {
	return newStatement().Break()
}

// Break renders the break keyword.
func (g *Group) Break() *Statement {
	s := Break()
	g.items = append(g.items, s)
	return s
}

// Break renders the break keyword.
func (s *Statement) Break() *Statement {
	t := token{
		content: "break",
		typ:     keywordToken,
	}
	*s = append(*s, t)
	return s
}

// Else renders the else keyword.
func Else() *Statement {
	return newStatement().Else()
}

// Else renders the else keyword.
func (g *Group) Else() *Statement {
	s := Else()
	g.items = append(g.items, s)
	return s
}

// Else renders the else keyword.
func (s *Statement) Else() *Statement {
	// notest
	t := token{
		content: "else",
		typ:     keywordToken,
	}
	*s = append(*s, t)
	return s
}

// Continue renders the continue keyword.
func Continue() *Statement {
	return newStatement().Continue()
}

// Continue renders the continue keyword.
func (g *Group) Continue() *Statement {
	s := Continue()
	g.items = append(g.items, s)
	return s
}

// Continue renders the continue keyword.
func (s *Statement) Continue() *Statement {
	// notest
	t := token{
		content: "continue",
		typ:     keywordToken,
	}
	*s = append(*s, t)
	return s
}

// Class renders the class keyword.
func Class() *Statement {
	return newStatement().Class()
}

// Class renders the class keyword.
func (g *Group) Class() *Statement {
	s := Class()
	g.items = append(g.items, s)
	return s
}

// Class renders the class keyword.
func (s *Statement) Class() *Statement {
	// notest
	t := token{
		content: "class",
		typ:     keywordToken,
	}
	*s = append(*s, t)
	return s
}

// Module renders the module keyword.
func Module() *Statement {
	return newStatement().Module()
}

// Module renders the module keyword.
func (g *Group) Module() *Statement {
	s := Module()
	g.items = append(g.items, s)
	return s
}

// Module renders the module keyword.
func (s *Statement) Module() *Statement {
	// notest
	t := token{
		content: "module",
		typ:     keywordToken,
	}
	*s = append(*s, t)
	return s
}

// Elsif renders the elsif keyword.
func Elsif() *Statement {
	return newStatement().Elsif()
}

// Elsif renders the elsif keyword.
func (g *Group) Elsif() *Statement {
	s := Elsif()
	g.items = append(g.items, s)
	return s
}

// Elsif renders the elsif keyword.
func (s *Statement) Elsif() *Statement {
	// notest
	t := token{
		content: "elsif",
		typ:     keywordToken,
	}
	*s = append(*s, t)
	return s
}

// End renders the end keyword.
func End() *Statement {
	return newStatement().End()
}

// End renders the end keyword.
func (g *Group) End() *Statement {
	s := End()
	g.items = append(g.items, s)
	return s
}

// End renders the end keyword.
func (s *Statement) End() *Statement {
	// notest
	t := token{
		content: "end",
		typ:     keywordToken,
	}
	*s = append(*s, t)
	return s
}

// Def renders the def keyword.
func Def() *Statement {
	return newStatement().Def()
}

// Def renders the def keyword.
func (g *Group) Def() *Statement {
	s := Def()
	g.items = append(g.items, s)
	return s
}

// Def renders the def keyword.
func (s *Statement) Def() *Statement {
	// notest
	t := token{
		content: "def",
		typ:     keywordToken,
	}
	*s = append(*s, t)
	return s
}

// Begin renders the begin keyword.
func Begin() *Statement {
	return newStatement().Begin()
}

// Begin renders the begin keyword.
func (g *Group) Begin() *Statement {
	s := Begin()
	g.items = append(g.items, s)
	return s
}

// Begin renders the begin keyword.
func (s *Statement) Begin() *Statement {
	// notest
	t := token{
		content: "begin",
		typ:     keywordToken,
	}
	*s = append(*s, t)
	return s
}
