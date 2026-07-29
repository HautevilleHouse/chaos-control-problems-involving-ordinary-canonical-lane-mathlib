import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure ChaosControlSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ChaosControlAdmittedObject where
  space : ChaosControlSpace
  controlSystem : Prop
  ogyControlled : Prop
  chaosSuppressed : Prop
  controlModel : Type
  controlTopology : TopologicalSpace controlModel
  suppressionAchieved : Prop
  conclusion : suppressionAchieved

def ChaosControlWitnessClosed (O : ChaosControlAdmittedObject) : Prop :=
  O.suppressionAchieved

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse