import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure OGYControlSystem (n : ℕ) where
  stateSpace : Type u
  poincareMap : stateSpace → stateSpace
  fixedPoint : stateSpace
  stableManifold : Prop
  unstableManifold : Prop
  controlPerturbation : stateSpace → stateSpace
  controlApplied : Prop

structure OGYControlEvidence (n : ℕ) (O : OGYControlSystem n) where
  stableManifoldClosed : O.stableManifold
  unstableManifoldClosed : O.unstableManifold
  controlAppliedClosed : O.controlApplied

def OGYControlClosed {n : ℕ} (O : OGYControlSystem n) : Prop :=
  O.stableManifold ∧ O.unstableManifold ∧ O.controlApplied

theorem ogy_control_closed_from_evidence {n : ℕ} (O : OGYControlSystem n)
    (E : OGYControlEvidence n O) : OGYControlClosed O := by
  exact And.intro E.stableManifoldClosed (And.intro E.unstableManifoldClosed E.controlAppliedClosed)

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse