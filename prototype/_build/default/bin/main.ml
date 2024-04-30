let iteration = "first iteration" 
let strat = "using Antimirov's partial derivatives and the simple algorithm for checking language equivalence" 

(* TODO: Instead of asking user for expr1 and expr2, have them passed thru sys 
   args. *)
let display_intro () = 
  Format.printf "This is the %s of the KATSolver. 
It determines equality %s.
" iteration strat

let display_kat_syntax () = 
  Format.printf "
KAT SYNTAX:
- Primitive actions : (m-z)
- Primitive tests : (a-l)
- Multiplication / Conjunction: Implicit
- Addition / Disjunction: (+)
- Kleene star: (*)
- Negation: (!)
- Zero: (0)
- One: (1)
Precedence is:
Parenthesis > Negation > Kleene Star > Multiplication > Addition
Example expression: 
x(x+y)*!ab

"
(* TODO: Is it * > ! or ! > *? *)

let request_and_parse_exprs () = 
  print_endline "Please input the first expression, or enter `#` to print KAT syntax";
  let user_inp = read_line () in 
  let expr1 = 
    if (user_inp = "#") then 
      (display_kat_syntax (); 
      print_endline "Please input the first expression";
      read_line ()) 
    else 
      user_inp 
  in 
  let expr2 = 
    print_endline "Please input the second expression";
    read_line () 
  in 
  Format.printf "exp1: %s
exp2: %s
" expr1 expr2



let _ = 
  display_intro (); 
  request_and_parse_exprs ()

