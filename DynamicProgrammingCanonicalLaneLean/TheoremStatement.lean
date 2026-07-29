import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  dynamicProgrammingConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "dynamic-programming-canonical-lane",
  theoremName := "Dynamic Programming",
  theoremObject := "Bellman optimality principle",
  classicalBoundary := "classical source boundary carried by theorem boundary",
  dynamicProgrammingConstrainedStatement := "constrained DP theorem certificate internalized through admissible class",
  certificateLane := "manifold_constrained",
  carriedRemainder := "classical source boundary carried"
}

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse
