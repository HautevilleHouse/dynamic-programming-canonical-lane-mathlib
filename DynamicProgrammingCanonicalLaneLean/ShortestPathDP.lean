import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

structure ShortestPathDPackage where
  graph : Type u
  vertices : Set graph
  edges : graph → graph → Prop
  edgeWeight : graph → graph → ℝ
  startVertex : graph
  targetVertex : graph
  pathExists : Prop
  shortestPathValue : ℝ

structure ShortestPathDPEvidence (S : ShortestPathDPackage) where
  pathExistsClosed : S.pathExists
  bellmanEquationForShortestPathProved : Prop
  bellmanEquationForShortestPathProvedClosed : S.bellmanEquationForShortestPathProved

def ShortestPathDPClosed (S : ShortestPathDPackage) : Prop :=
  S.pathExists ∧ S.bellmanEquationForShortestPathProved

theorem shortest_path_dp_closed_from_evidence (S : ShortestPathDPackage)
    (E : ShortestPathDPEvidence S) : ShortestPathDPClosed S := by
  exact And.intro E.pathExistsClosed E.bellmanEquationForShortestPathProvedClosed

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse