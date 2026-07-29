import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure ChaosControlStateDynamicsPackage where
  stateSpace : Type u
  controlSpace : Type v
  dynamics : stateSpace → controlSpace → stateSpace
  orbitClosure : Set (stateSpace × stateSpace)
  boundednessProp : Prop
  controllabilityProp : Prop

structure ChaosControlStateDynamicsEvidence (C : ChaosControlStateDynamicsPackage) where
  boundednessPropClosed : C.boundednessProp
  controllabilityPropClosed : C.controllabilityProp

def ChaosControlStateDynamicsClosed (C : ChaosControlStateDynamicsPackage) : Prop :=
  C.boundednessProp ∧ C.controllabilityProp

theorem chaos_control_state_dynamics_closed_from_evidence
    (C : ChaosControlStateDynamicsPackage) (E : ChaosControlStateDynamicsEvidence C) :
    ChaosControlStateDynamicsClosed C := by
  exact And.intro E.boundednessPropClosed E.controllabilityPropClosed

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse