import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

structure PolicyIterationPackage (B : BellmanOptimalityPackage) where
  initialPolicy : B.stateSpace → B.actionSpace
  policyEvaluation : (B.stateSpace → B.actionSpace) → (B.stateSpace → ℝ)
  policyImprovement : (B.stateSpace → ℝ) → (B.stateSpace → B.actionSpace)
  optimalPolicy : B.stateSpace → B.actionSpace

structure PolicyIterationEvidence {B : BellmanOptimalityPackage}
    (P : PolicyIterationPackage B) where
  policyImprovementTheoremProved : Prop
  finiteTerminationProved : Prop
  policyImprovementTheoremProvedClosed : P.policyImprovementTheoremProved
  finiteTerminationProvedClosed : P.finiteTerminationProved

def PolicyIterationClosed {B : BellmanOptimalityPackage}
    (P : PolicyIterationPackage B) : Prop :=
  P.policyImprovementTheoremProved ∧ P.finiteTerminationProved

theorem policy_iteration_closed_from_evidence {B : BellmanOptimalityPackage}
    (P : PolicyIterationPackage B) (E : PolicyIterationEvidence P) :
    PolicyIterationClosed P := by
  exact And.intro E.policyImprovementTheoremProvedClosed E.finiteTerminationProvedClosed

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse