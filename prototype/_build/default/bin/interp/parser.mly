%{
    open Kat
%}

%token ZERO 
%token ONE  
%token <char> PTEST
%token <char> PACTION 
%token LPAREN 
%token RPAREN 
%token PLUS 
%token NEG 
%token STAR
%token EOF

%left PLUS

%start <Kat.expr> kat_expr 

%%

kat_expr: 
| e = kat_sum_or_subterm; EOF {e}

kat_sum_or_subterm:
| e = kat_prod_or_subterm {e}
| e1 = kat_prod_or_subterm; PLUS; e2 = kat_prod_or_subterm {Sum (e1, e2)}

kat_prod_or_subterm: 
| e = kat_subterm {e} 
| e1 = kat_subterm; e2 = kat_subterm {Prod (e1, e2)}

kat_subterm:
| ZERO {Test Zero}
| ONE {Test One}
| LPAREN; e = kat_expr; RPAREN {e}
| e = kat_subterm; STAR {Star (e)}
| x = PACTION {PAction (x)}
| b = PTEST {Test PTest (b)}
| NEG {failwith("todo")}

// test_subterm:
// | ZERO {Test Zero}
// | ONE {Test One}
// | NEG; t = test_subterm {Test Neg (t)}
// | b = PTEST {Test PTest (b)}
// | LPAREN; t = test_sum_or_subterm; RPAREN {t}

// test_sum_or_subterm:
// | t = test_prod_or_subterm {t} 
// | t1 = test_prod_or_subterm; PLUS; t2 = test_prod_or_subterm {Test Disj (t1, t2)}

// test_prod_or_subterm:
// | t = test_subterm {t}
// | t1 = test_subterm; t2 = test_subterm {Test Conj (t1, t2)}
