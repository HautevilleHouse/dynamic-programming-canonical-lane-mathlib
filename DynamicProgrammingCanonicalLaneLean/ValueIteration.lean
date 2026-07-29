import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

structure ValueIterationPackage (S : Type) (A : Type) where
  stateSpace : Set S
  actionSpace : S → Set A
  reward : S → A → ℝ
  transition : S → A → S
  discount : ℝ
  tolerance : ℝ
  maxIterations : ℕ
  initialValue : S → ℝ
  iterationFunction : (S → ℝ) → (S → ℝ)
  convergenceCondition : (v : S → ℝ) → ‖iterationFunction v - v‖ < tolerance → convergence
  where
    convergence : Prop

structure ValueIterationEvidence {S : Type} {A : Type} (V : ValueIterationPackage S A) where
  stateSpaceClosed : V.stateSpace ≠ ∅
  actionSpaceClosed : ∀ s, V.actionSpace s ≠ ∅
  rewardClosed : ∀ s a, V.reward s a ∈ ℝ
  transitionClosed : ∀ s a, V.transition s a ∈ V.stateSpace
  discountClosed : V.discount ∈ (0,1)
  toleranceClosed : V.tolerance > 0
  initialValueClosed : ∀ s, V.initialValue s ∈ ℝ
  iterationFunctionClosed : ∀ v, V.iterationFunction v ∈ (S → ℝ)
  convergenceConditionClosed : ∀ v, ‖V.iterationFunction v - v‖ < V.tolerance → V.convergence

def ValueIterationClosed {S : Type} {A : Type} (V : ValueIterationPackage S A) : Prop :=
  V.stateSpace ≠ ∅ ∧
  (∀ s, V.actionSpace s ≠ ∅) ∧
  (∀ s a, V.reward s a ∈ ℝ) ∧
  (∀ s a, V.transition s a ∈ V.stateSpace) ∧
  V.discount ∈ (0,1) ∧
  V.tolerance > 0 ∧
  (∀ s, V.initialValue s ∈ ℝ) ∧
  (∀ v, V.iterationFunction v ∈ (S → ℝ)) ∧
  (∀ v, ‖V.iterationFunction v - v‖ < V.tolerance → V.convergence)

theorem value_iteration_closed_from_evidence
    {S : Type} {A : Type} (V : ValueIterationPackage S A)
    (E : ValueIterationEvidence V) : ValueIterationClosed V := by
  exact And.intro E.stateSpaceClosed
    (And.intro E.actionSpaceClosed
      (And.intro E.rewardClosed
        (And.intro E.transitionClosed
          (And.intro E.discountClosed
            (And.intro E.toleranceClosed
              (And.intro E.initialValueClosed
                (And.intro E.iterationFunctionClosed E.convergenceConditionClosed)))))))

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse