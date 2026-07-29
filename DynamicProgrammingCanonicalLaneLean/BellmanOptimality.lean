import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

structure BellmanOptimalityPackage where
  stateSpace : Type u
  actionSpace : Type v
  transition : stateSpace → actionSpace → stateSpace
  reward : stateSpace → actionSpace → ℝ
  discount : ℝ
  valueFunction : stateSpace → ℝ
  bellmanEquationProved : Prop
  optimalPolicyExists : Prop

structure BellmanOptimalityEvidence (B : BellmanOptimalityPackage) where
  bellmanEquationProvedClosed : B.bellmanEquationProved
  optimalPolicyExistsClosed : B.optimalPolicyExists

def BellmanOptimalityClosed (B : BellmanOptimalityPackage) : Prop :=
  B.bellmanEquationProved ∧ B.optimalPolicyExists

theorem bellman_optimality_closed_from_evidence (B : BellmanOptimalityPackage)
    (E : BellmanOptimalityEvidence B) : BellmanOptimalityClosed B := by
  exact And.intro E.bellmanEquationProvedClosed E.optimalPolicyExistsClosed

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse