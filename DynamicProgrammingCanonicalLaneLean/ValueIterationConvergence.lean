import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

structure ValueIterationPackage (B : BellmanOptimalityPackage) where
  initialGuess : B.stateSpace → ℝ
  updateOperator : (B.stateSpace → ℝ) → (B.stateSpace → ℝ)
  iterations : ℕ → (B.stateSpace → ℝ)
  fixedPoint : (B.stateSpace → ℝ)
  convergenceRate : ℕ → ℝ

structure ValueIterationEvidence {B : BellmanOptimalityPackage}
    (V : ValueIterationPackage B) where
  contractionMappingProved : Prop
  convergenceToFixedPointProved : Prop
  contractionMappingProvedClosed : V.contractionMappingProved
  convergenceToFixedPointProvedClosed : V.convergenceToFixedPointProved

def ValueIterationClosed {B : BellmanOptimalityPackage}
    (V : ValueIterationPackage B) : Prop :=
  V.contractionMappingProved ∧ V.convergenceToFixedPointProved

theorem value_iteration_closed_from_evidence {B : BellmanOptimalityPackage}
    (V : ValueIterationPackage B) (E : ValueIterationEvidence V) :
    ValueIterationClosed V := by
  exact And.intro E.contractionMappingProvedClosed E.convergenceToFixedPointProvedClosed

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse