import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

structure OptimalSubstructurePackage where
  problem : Type u
  stateSpace : Type v
  decisionSpace : Type w
  valueFunction : stateSpace → Prop
  optimalityPrinciple : Prop
  decompositionProperty : Prop

structure OptimalSubstructureEvidence (P : OptimalSubstructurePackage) where
  optimalityPrincipleClosed : P.optimalityPrinciple
  decompositionPropertyClosed : P.decompositionProperty

def OptimalSubstructureClosed (P : OptimalSubstructurePackage) : Prop :=
  P.optimalityPrinciple ∧ P.decompositionProperty

theorem optimal_substructure_closed_from_evidence
    (P : OptimalSubstructurePackage) (E : OptimalSubstructureEvidence P) :
    OptimalSubstructureClosed P := by
  exact And.intro E.optimalityPrincipleClosed E.decompositionPropertyClosed

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse
