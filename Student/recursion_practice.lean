/-
Write a recursive function that concatentates a string n times
-/
def concatn: Nat → String → String
| 0, s => ""
| n'+1, s => s ++ (concatn n' s)

#eval concatn 3 "Hello" --HelloHelloHello

/-
Find the cube  of the integers from 1 to n
-/
def sum_cubed: Nat → Nat
| 0 => 0
| n'+1 => (n'+1)^3 + sum_cubed n'
#eval sum_cubed 5 --idk

/-
find the sum of the values in a list
-/

def mylist:List Nat := [1,2,3,4,5]

def find_sum: List Nat → Nat
| [] => 0
| h::t => h + find_sum t
#eval find_sum mylist --15

/-
Write a function that reverses the digits in a positive integer
-/
def floor_div: Nat → Nat := (λ n => n/10) 

#eval floor_div 32
def get_last_digit:= (λ n => n%10)
def reverse: (num: Nat)  → Nat
| 0 => 0
| n'+1 =>have: ((floor_div (n'+1)) < n'+1):= sorry
  10 * get_last_digit (n'+1)+( reverse (floor_div (n'+1)))

#eval reverse 23
#eval reverse 123 --expect 321
#eval reverse 670 --expect 67

--Prove α ×  α → Empty is uninhabited
def pr1: (α × (α → Empty)) → Empty
| (a, noa) => noa a
--Proof Show (α × α → Empty) → Empty
/-
Identity:
1. X + 0 = X 
2. X * 1 = X
Null Elements:
3. X + 1 = 1 
4. X * 0 = 0
Idempotent Law:
5. X + X = X 
6. X * X = X
Complement:
7. X + X' = 1 
8. X * X' = 0
Involution Law:
9. X'' = X
Commutative:
10. X + Y = Y + X 
11. X * Y = Y * X
Associative:
12. X + (Y + Z) = (X + Y) + Z 
13. X * (Y * Z) = (X * Y) * Z
Distributive:
14. X * (Y + Z) = X * Y + X * Z 
15. X + Y * Z = (X + Y) * (X + Z)
DeMorgan's Law:
16. (X + Y)' = X' * Y' 
17. (X * Y)' = X' + Y'
Covering Theorem:
18. X + X * Y = X 
19. X * (X + Y) = X
Combining Theorem:
20. X * Y + X * Y' = X 
21. (X + Y) * (X + Y') = X
Consensus Theorem:
22. X * Y + X' * Z + Y * Z = X * Y + X' * Z
23. (X + Y) * (X' + Z) * (Y + Z) = (X + Y) * (X' + Z)
-/
--proof of #1
def noa: α × (α → Empty) → Empty
| (a, noafunc) => noafunc a

--proof of 23: (α ×  β ) ⊕ ((α → Empty)×  γ ) ⊕ (β × γ ) → (α × β ) ⊕ (α\ ∧ γ )

/-
def pf23: (α ×  β ) ⊕ ((α → Empty)×  γ ) ⊕ (β × γ ) → (α × β ) ⊕ ((α → Empty) ×  γ )
| Sum.inl (a,b) => Sum.inl (a,b)
| Sum.inr (Sum.inl (noa, g)) => Sum.inr (noa,g)
| Sum.inr (Sum.inr (b,g)) => _
-/


def sumsum : Nat ⊕ Nat ⊕ Nat := Sum.inl 6

#check sumsum

/-

x ⊕ y = ¬ (x ⇔ y) = (x ∨ y)∧¬ (x ∧ y) = (x∨ y) ∧ (¬ x ∨ ¬ y) = (x∧¬ y) ∨ (¬ x ∧ y)

-/

-- def xorproof {x y:Type}: (x ⊕ y) × ((x → Empty) ⊕ (y → Empty)) → (x × (y→ Empty)) ⊕ ((x → Empty) × y)
-- | (Sum.inl x, Sum.inl nox) => Sum.inl (x, nox)

