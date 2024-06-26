type ptest = char (* a - l *)
type paction = char (* m - z *)

type test = 
| PTest of ptest 
| Zero 
| One 
| Conj of test * test (* ^ *)
| Disj of test * test (* v *)
| Neg of test 

(* Since boolean exprs count as action terms, let's just call this expr for 
   KAT expr. *)
type expr = 
| PAction of paction 
| Sum of expr * expr  
| Prod of expr * expr 
| Star of expr 
| Test of test 