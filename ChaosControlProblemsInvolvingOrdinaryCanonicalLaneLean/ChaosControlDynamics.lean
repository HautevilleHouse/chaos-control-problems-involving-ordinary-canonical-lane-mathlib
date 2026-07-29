import ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure ChaosControlSystem where
  stateSpace : Type u
  controlSpace : Type v
  dynamics : stateSpace → controlSpace → stateSpace
  observable : stateSpace → ℝ

def systemControlled (C : ChaosControlSystem) : Prop :=
  ∀ (s : C.stateSpace), ∃ (u : C.controlSpace), C.observable (C.dynamics s u) < 0

structure ControlledObject where
  system : ChaosControlSystem
  ballStabilityRadius : ℝ
  trackingError : ℝ

def ChaosControlWitnessClosed (O : ControlledObject) : Prop :=
  O.ballStabilityRadius > 0 ∧ O.trackingError < O.ballStabilityRadius

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse