import DynamicProgrammingCanonicalLaneLean.BellmanEquation

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

structure DynamicProgrammingPrinciplePackage {P : OptimalSubstructurePackage}
    {B : BellmanEquationPackage P} where
  monotonicityProperty : Prop
  contractionProperty : Prop
  uniquenessProperty : Prop

structure DynamicProgrammingPrincipleEvidence {P : OptimalSubstructurePackage}
    {B : BellmanEquationPackage P} (D : DynamicProgrammingPrinciplePackage P B) where
  monotonicityPropertyClosed : D.monotonicityProperty
  contractionPropertyClosed : D.contractionProperty
  uniquenessPropertyClosed : D.uniquenessProperty

def DynamicProgrammingPrincipleClosed {P : OptimalSubstructurePackage}
    {B : BellmanEquationPackage P} (D : DynamicProgrammingPrinciplePackage P B) : Prop :=
  D.monotonicityProperty ∧ D.contractionProperty ∧ D.uniquenessProperty

theorem dynamic_programming_principle_closed_from_evidence
    {P : OptimalSubstructurePackage} {B : BellmanEquationPackage P}
    (D : DynamicProgrammingPrinciplePackage P B)
    (E : DynamicProgrammingPrincipleEvidence D) : DynamicProgrammingPrincipleClosed D := by
  exact And.intro E.monotonicityPropertyClosed
    (And.intro E.contractionPropertyClosed E.uniquenessPropertyClosed)

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse
