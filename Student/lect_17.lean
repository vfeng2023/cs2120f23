/-!
## Curry-Howard Correspondence
-/
/-!
## Empty ==> False
-/
#check Empty
--inductive Empty: Type

def from_empty (e: Empty) : Nat := 7

def from_empty' (e: Empty) : Empty := e

inductive Chaos: Type
def from_empty'' (e:Empty) :Chaos := nomatch e

--no introduction rule
#check False
--inductive False: Prop

def from_false {P: Prop}(p: False):P := False.elim p

def from_false_true_is_false (p:False) :True = False := False.elim p

/-!
## Unit ==> Prop
-/

#check Unit
--inductive PUnit: Sor u where
  -- | unit: PUnit

#check True
-- inductive True: Prop where
-- | intro: True

#check True.intro
--no elimination rule

def proof_of_true : True := True.intro

def false_implies_true : False → True:= λ (f: False) => False.elim f--True.intro

/-!
Prod ==> ANd
-/

#check Prod
/-!
structure Prod (α : Type u) (β : Type v) where
  fst : α
  snd : β
-/

#check And
/-!
  structure And (a b : Prop) : Prop where

  intro ::

  left : a

  right : b
-/

inductive birds_chirping : Prop
| yep
| boo

inductive sky_blue: Prop
| yep

#check (And birds_chirping sky_blue)

theorem both_and : (And birds_chirping sky_blue) := And.intro birds_chirping.boo sky_blue.yep

/-!
Proof Irrelevance
-/

namespace cs2120f23
inductive Bool: Type
| true
| false

theorem proof_equal: birds_chirping.boo = birds_chirping.yep := by trivial
-- in Prop all proofs are equivalent
-- choice of values in prop can't influence computations
end cs2120f23

/-!
Sum ==> Or
-/

#check Sum
/-
inductive Sum (α : Type u) (β : Type v) where
  | inl (val : α) : Sum α β
  | inr (val : β) : Sum α β
-/

#check Or
/-
inductive Or (a b : Prop) : Prop where
  | inl (h : a) : Or a b
  | inr (h : b) : Or a b
-/

theorem one_or_other: Or birds_chirping sky_blue:= Or.inl birds_chirping.boo
theorem one_or_other': Or birds_chirping sky_blue:= Or.inr sky_blue.yep

example : Or birds_chirping (0=1) := Or.inl birds_chirping.boo

example: (0=1) ∨ (1=2) := _

theorem or_comm {P Q :Prop}: P∨ Q → Q∨ P :=
(λ d: P ∨ Q =>
match d with
| Or.inl p => Or.inr p
| Or.inr q => Or.inl q
)

/-!
Not (no)
-/

def no (α :Type) := α → Empty

#check Not
-- Not P is definied to be P → False

example : no Chaos := (λ c: Chaos => nomatch c)

inductive Raining : Prop

example: ¬ Raining := λ (r:Raining) => nomatch r
