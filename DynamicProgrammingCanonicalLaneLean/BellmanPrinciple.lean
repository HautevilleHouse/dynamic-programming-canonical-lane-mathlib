import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

structure BellmanEquation (S : Type u) (A : S → Type v) where
  state : S
  action : A state
  immediateReward : ℝ
  continuationValue : S → ℝ
  optimality : immediateReward + continuationValue state = continuationValue state

structure BellmanOptimality (P : AdmissibleDPProblem) where
  bellmanEquation : ∀ s : P.problemSpace, BellmanEquation P.problemSpace P.decisionSet
  policyImprovement : ∀ s : P.problemSpace, P.optimalPolicy s = (bellmanEquation s).action
  optimalValueMatches : ∀ s : P.problemSpace, P.valueFunction s = (bellmanEquation s).continuationValue s

def BellmanClosed (P : AdmissibleDPProblem) : Prop :=
  ∀ s : P.problemSpace, BellmanEquation P.problemSpace P.decisionSet

theorem bellman_closed_from_optimality (P : AdmissibleDPProblem) (B : BellmanOptimality P) : BellmanClosed P :=
  λ s => B.bellmanEquation s

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse