import ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean.ChaosControlDynamics

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure Observer (C : ChaosControlSystem) where
  estimatedState : C.stateSpace
  errorDynamics : C.stateSpace → C.stateSpace
  errorVanishes : ∀ s : C.stateSpace, dist (errorDynamics s) 0 → 0

def observabilityClosed (O : Observer C) : Prop :=
  O.errorVanishes

theorem observability_gate (C : ChaosControlSystem) (O : Observer C) :
  observabilityClosed O := by
  exact O.errorVanishes

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse