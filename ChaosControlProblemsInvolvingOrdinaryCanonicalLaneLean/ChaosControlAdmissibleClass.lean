import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure ChaosControlAdmittedObject where
  system : Type u
  chaosDetected : Prop
  controlApplied : Prop
  stabilityAchieved : Prop
  conclusion : stabilityAchieved

structure AdmissibleClass where
  object : ChaosControlAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse