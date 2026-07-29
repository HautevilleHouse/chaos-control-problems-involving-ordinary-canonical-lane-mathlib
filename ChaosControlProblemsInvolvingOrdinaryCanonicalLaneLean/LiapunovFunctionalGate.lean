import ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean.ChaosControlDynamics

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure LiapunovFunctional (C : ChaosControlSystem) where
  V : C.stateSpace → ℝ
  positiveDefinite : ∀ (x : C.stateSpace), x ≠ default → V x > 0
  decreasingAlongFlow : ∀ (x : C.stateSpace) (u : C.controlSpace), V (C.dynamics x u) ≤ V x

def liapunovFunctionalClosed (L : LiapunovFunctional C) : Prop :=
  L.positiveDefinite ∧ L.decreasingAlongFlow

theorem liapunov_from_system (C : ChaosControlSystem) (V : LiapunovFunctional C) :
  liapunovFunctionalClosed V := by
  exact And.intro V.positiveDefinite V.decreasingAlongFlow

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse