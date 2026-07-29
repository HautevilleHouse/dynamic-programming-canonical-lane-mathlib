import canonicalLaneMathlib.BridgeLemmas

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DynamicProgrammingWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse