import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

structure ResourceAllocationPackage where
  resource : ℝ
  projects : ℕ
  allocation : ℕ → ℝ → ℝ
  returnFunction : ℝ → ℝ
  optimalAllocation : ℕ → ℝ
  optimalTotalReturn : ℝ

structure ResourceAllocationEvidence (R : ResourceAllocationPackage) where
  recursionProved : Prop
  optimalSubstructureProved : Prop
  recursionProvedClosed : R.recursionProved
  optimalSubstructureProvedClosed : R.optimalSubstructureProved

def ResourceAllocationClosed (R : ResourceAllocationPackage) : Prop :=
  R.recursionProved ∧ R.optimalSubstructureProved

theorem resource_allocation_closed_from_evidence (R : ResourceAllocationPackage)
    (E : ResourceAllocationEvidence R) : ResourceAllocationClosed R := by
  exact And.intro E.recursionProvedClosed E.optimalSubstructureProvedClosed

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse