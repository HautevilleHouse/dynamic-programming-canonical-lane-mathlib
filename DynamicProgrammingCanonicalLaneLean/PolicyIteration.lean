import DynamicProgrammingCanonicalLaneLean.DynamicProgrammingPrinciple

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

structure PolicyIterationPackage {P : OptimalSubstructurePackage}
    {B : BellmanEquationPackage P} {D : DynamicProgrammingPrinciplePackage P B} where
  initialPolicy : P.stateSpace → P.decisionSpace
  policyEvaluationStep : Prop
  policyImprovementStep : Prop
  convergenceProperty : Prop

structure PolicyIterationEvidence {P : OptimalSubstructurePackage}
    {B : BellmanEquationPackage P} {D : DynamicProgrammingPrinciplePackage P B}
    (I : PolicyIterationPackage P B D) where
  policyEvaluationStepClosed : I.policyEvaluationStep
  policyImprovementStepClosed : I.policyImprovementStep
  convergencePropertyClosed : I.convergenceProperty

def PolicyIterationClosed {P : OptimalSubstructurePackage}
    {B : BellmanEquationPackage P} {D : DynamicProgrammingPrinciplePackage P B}
    (I : PolicyIterationPackage P B D) : Prop :=
  I.policyEvaluationStep ∧ I.policyImprovementStep ∧ I.convergenceProperty

theorem policy_iteration_closed_from_evidence
    {P : OptimalSubstructurePackage} {B : BellmanEquationPackage P}
    {D : DynamicProgrammingPrinciplePackage P B}
    (I : PolicyIterationPackage P B D)
    (E : PolicyIterationEvidence I) : PolicyIterationClosed I := by
  exact And.intro E.policyEvaluationStepClosed
    (And.intro E.policyImprovementStepClosed E.convergencePropertyClosed)

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse
