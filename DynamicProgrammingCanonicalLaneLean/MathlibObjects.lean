import canonicalLaneMathlib.MathlibObjects

namespace HautevilleHouse
namespace DynamicProgrammingCanonicalLaneLean

structure DynamicProgrammingSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DynamicProgrammingAdmittedObject where
  space : DynamicProgrammingSpace
  optimalControlProblem : Prop
  valueFunctionExists : Prop
  policyFunctionSpace : Type
  policyTopology : TopologicalSpace policyFunctionSpace
  optimalPolicyExists : Prop
  conclusion : optimalPolicyExists

structure DynamicProgrammingEndgameState where
  object : DynamicProgrammingAdmittedObject

def DynamicProgrammingWitnessClosed (O : DynamicProgrammingAdmittedObject) : Prop :=
  O.optimalPolicyExists

end DynamicProgrammingCanonicalLaneLean
end HautevilleHouse
