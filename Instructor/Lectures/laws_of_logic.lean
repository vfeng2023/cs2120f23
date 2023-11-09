
--taken from : https://lean-lang.org/theorem_proving_in_lean/propositions_and_proofs.html#examples-of-propositional-validities
variables p q r : Prop

-- commutativity of ∧ and ∨
example : p ∧ q ↔ q ∧ p := Iff.intro (λ ⟨ a, b⟩ => ⟨ b, a⟩  ) (λ ⟨ b, a⟩ => ⟨ a, b⟩)


example : p ∨ q ↔ q ∨ p := Iff.intro (
  λ s: p ∨ q => match s with
  | Or.inl a => Or.inr a
  | Or.inr b => Or.inl b
)
(
  λ s: q ∨ p => match s with
  | Or.inl a => Or.inr a
  | Or.inr b => Or.inl b
)

-- associativity of ∧ and ∨
example : (p ∧ q) ∧ r ↔   p ∧ (q ∧ r) :=
Iff.intro (
  λ ⟨ ⟨ a, b⟩ , c⟩ => ⟨ a,b,c⟩
)
(

  λ ⟨ a,b,c⟩ => ⟨ ⟨ a,b⟩ ,c⟩
)

example : (p ∨ q) ∨ r ↔ p ∨ (q ∨ r) :=
Iff.intro (
  λ s : (p ∨ q) ∨ r => match s with
  | Or.inl (Or.inl a) => Or.inl a
  | Or.inl (Or.inr b) => Or.inr (Or.inl b)
  | Or.inr c => Or.inr (Or.inr c)
)
(
  λ s: (p ∨ (q ∨ r)) => match s with
  | Or.inl a => Or.inl (Or.inl a)
  | Or.inr (Or.inl b) => Or.inl (Or.inr b)
  | Or.inr (Or.inr c) => Or.inr c
)
-- distributivity
example : p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) :=
Iff.intro (
  λ s: (p ∧ (q ∨ r)) => match s with
  | ⟨ a, borc⟩ => match borc with
    | Or.inl b => Or.inl ⟨ a,b⟩
    | Or.inr c => Or.inr ⟨ a, c⟩

)
(
  λ s: (p ∧ q) ∨ (p ∧ r) => match s with
  | Or.inl ⟨ a,b⟩ => ⟨ a, Or.inl b⟩
  | Or.inr (And.intro b c) => And.intro b (Or.inr c)
)
example : p ∨ (q ∧ r) ↔ (p ∨ q) ∧ (p ∨ r) :=
Iff.intro (λ s:p ∨ (q ∧ r) =>
match s with
| Or.inl a => ⟨ Or.inl a, Or.inl a⟩
| Or.inr (And.intro b c) => ⟨ Or.inr b, Or.inr c⟩
)
--other way
(
  fun s: (p ∨ q) ∧ (p ∨ r) =>
  match s with
  | ⟨ Or.inr b, Or.inr c⟩ => Or.inr (And.intro b c)
  | And.intro (Or.inl a) _ => Or.inl a
  | And.intro _ (Or.inl a) => Or.inl a
)
-- other properties
example : (p → (q → r)) ↔ (p ∧ q → r) :=
Iff.intro (
  λ a => λ qtor => λ
)
example : ((p ∨ q) → r) ↔ (p → r) ∧ (q → r) := sorry
example : ¬(p ∨ q) ↔ ¬p ∧ ¬q := sorry
example : ¬p ∨ ¬q → ¬(p ∧ q) := sorry
example : ¬(p ∧ ¬p) := sorry
example : p ∧ ¬q → ¬(p → q) := sorry
example : ¬p → (p → q) := sorry
example : (¬p ∨ q) → (p → q) := sorry
example : p ∨ false ↔ p := sorry
example : p ∧ false ↔ false := sorry
example : (p → q) → (¬q → ¬p) := sorry
