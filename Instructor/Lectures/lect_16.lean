/-!

-/
theorem and_comm {P Q: Prop} : (P ∧ Q → Q ∧ P) ∧ (Q ∧ P → P ∧ Q) :=
  And.intro
  (λ ⟨ p, q⟩  => And.intro q p)
  (λ ⟨ q, p⟩ => ⟨ p, q⟩ )

--function values = proof of type
