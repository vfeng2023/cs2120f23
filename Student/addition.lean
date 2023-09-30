/-
Goal - create variable, addition, subtraction, and exponentiation language with variables
-/
--namespace mynamespace

structure var: Type := (n: Int)

inductive op: Type
| add
| subtract
| multiply
| divide

inductive Expr
| value (v: Int)
| operand (o: op) (e0 e1:Expr)

--create function to evaluate expression
def apply_operand: op → (Int → Int → Int)
| op.add => Int.add
| op.subtract => Int.sub
| op.multiply => Int.mul
| op.divide => Int.div

def eval_expression: Expr → (op → Int → Int → Int) → Int
| Expr.value v, _ => v
| Expr.operand o e0 e1, f => (f o) (eval_expression e0 f) (eval_expression e1 f)


def v1:var := var.mk 4
def v2 := var.mk 5

def e0 := Expr.value 4
def e2 := Expr.value 5


--check basic cases
#eval eval_expression (Expr.operand op.add e0 e2) apply_operand
#eval eval_expression (Expr.operand op.multiply e0 e2) apply_operand
#eval eval_expression (Expr.operand op.subtract e0 e2) apply_operand
#eval eval_expression (Expr.operand op.divide e0 e2) apply_operand

--define concrete syntax
notation "["v"]" => Expr.value v
infixr:65 " * " => Expr.operand op.multiply
infixr: 65 " / " => Expr.operand op.divide
infixl: 50 " + " => Expr.operand op.add
notation lhs: 51 " - " rhs:50=> Expr.operand op.add lhs (Expr.operand op.multiply [-1] rhs)
notation a "+" b "-" c => a+b-c

def prod:Expr := [4] *[5]--e0*e2

def e0':Expr := [4]
def e1':Expr := [6]
def e2':Expr := [5]


#eval eval_expression prod apply_operand

def prodcomplex:Expr := e0'- e1'+ e2'

#reduce prodcomplex
#eval eval_expression prodcomplex apply_operand


--end mynamespace