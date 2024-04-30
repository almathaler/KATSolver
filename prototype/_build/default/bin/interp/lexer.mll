{
    open Parser
}

let white = [' ' '\t']+
let ptest = ['a'-'l']
let paction = ['m'-'z']

rule read = 
    parse 
    | white { read lexbuf }
    | "0" {ZERO}
    | "1" {ONE}
    | ptest {PTEST (Lexing.lexeme lexbuf)}
    | paction {PACTION (Lexing.lexeme lexbuf)}
    | "(" {LPAREN}
    | ")" {RPAREN}
    | "+" {PLUS}
    | "!" {NEG}
    | "*" {STAR}
    | eof {EOF}