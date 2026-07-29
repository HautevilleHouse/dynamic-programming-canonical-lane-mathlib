import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

structure BellmanEquationPackage (S : Type) (A : Type) where
  stateSpace : Set S
  actionSpace : S → Set A
  reward : S → A → ℝ
  transition : S → A → S
  discount : ℝ
  valueFunction : (S → ℝ) → Prop
  optimalValue : (S → ℝ) → Prop
  bellmanOperator : ((S → ℝ) → (S → ℝ)) → Prop
  bellmanEquation : (v : S → ℝ) → (bellmanOperator (fun v' => _) v) → v = optimalValue v

structure BellmanEquationEvidence {S : Type} {A : Type} (B : BellmanEquationPackage S A) where
  stateSpaceClosed : B.stateSpace ≠ ∅
  actionSpaceClosed : ∀ s, B.actionSpace s ≠ ∅
  rewardClosed : ∀ s a, B.reward s a ∈ ℝ
  transitionClosed : ∀ s a, B.transition s a ∈ B.stateSpace
  discountClosed : B.discount ∈ (0,1)
  bellmanEquationClosed : ∀ v, B.bellmanOperator (fun v' => _) v ∧ v = B.optimalValue v

def BellmanEquationClosed {S : Type} {A : Type} (B : BellmanEquationPackage S A) : Prop :=
  B.stateSpace ≠ ∅ ∧
  (∀ s, B.actionSpace s ≠ ∅) ∧
  (∀ s a, B.reward s a ∈ ℝ) ∧
  (∀ s a, B.transition s a ∈ B.stateSpace) ∧
  B.discount ∈ (0,1) ∧
  (∀ v, B.bellmanOperator (fun v' => _) v ∧ v = B.optimalValue v)

theorem bellman_equation_closed_from_evidence
    {S : Type} {A : Type} (B : BellmanEquationPackage S A)
    (E : BellmanEquationEvidence B) : BellmanEquationClosed B := by
  exact And.intro E.stateSpaceClosed
    (And.intro E.actionSpaceClosed
      (And.intro E.rewardClosed
        (And.intro E.transitionClosed
          (And.intro E.discountClosed E.bellmanEquationClosed))))

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse