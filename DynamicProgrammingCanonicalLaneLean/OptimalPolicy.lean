import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

structure OptimalPolicyPackage (S : Type) (A : Type) where
  stateSpace : Set S
  actionSpace : S → Set A
  valueFunction : S → ℝ
  policy : S → A
  policyValue : S → ℝ
  optimalityCondition : (s : S) → (a : A) → policyValue s ≥ valueFunction s
  policyClosed : ∀ s, policy s ∈ actionSpace s
  optimalPolicy : ∀ s, ∀ a ∈ actionSpace s, valueFunction (transition s a) + reward s a ≤ valueFunction s
  where
    transition : S → A → S
    reward : S → A → ℝ

structure OptimalPolicyEvidence {S : Type} {A : Type} (P : OptimalPolicyPackage S A) where
  policyClosed : ∀ s, P.policy s ∈ P.actionSpace s
  optimalityConditionClosed : ∀ s, ∀ a ∈ P.actionSpace s, P.policyValue s ≥ P.valueFunction s
  optimalPolicyClosed : ∀ s, ∀ a ∈ P.actionSpace s, P.valueFunction (P.transition s a) + P.reward s a ≤ P.valueFunction s

def OptimalPolicyClosed {S : Type} {A : Type} (P : OptimalPolicyPackage S A) : Prop :=
  (∀ s, P.policy s ∈ P.actionSpace s) ∧
  (∀ s, ∀ a ∈ P.actionSpace s, P.policyValue s ≥ P.valueFunction s) ∧
  (∀ s, ∀ a ∈ P.actionSpace s, P.valueFunction (P.transition s a) + P.reward s a ≤ P.valueFunction s)

theorem optimal_policy_closed_from_evidence
    {S : Type} {A : Type} (P : OptimalPolicyPackage S A)
    (E : OptimalPolicyEvidence P) : OptimalPolicyClosed P := by
  exact And.intro E.policyClosed
    (And.intro E.optimalityConditionClosed E.optimalPolicyClosed)

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse