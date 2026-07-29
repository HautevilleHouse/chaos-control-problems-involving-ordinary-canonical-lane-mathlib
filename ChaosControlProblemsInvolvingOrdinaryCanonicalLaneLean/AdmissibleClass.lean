import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure AdmissibleClass where
  object : ChaosControlAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ChaosControlWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse