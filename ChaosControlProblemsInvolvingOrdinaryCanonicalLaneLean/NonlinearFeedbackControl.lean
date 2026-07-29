import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure NonlinearFeedbackControlPackage where
  stateManifold : Type
  controlLaw : stateManifold → stateManifold
  closedLoopDynamics : stateManifold → Prop
  asymptoticStability : Prop
  backsteppingConstructed : Prop
  slidingSurfaceReached : Prop

structure NonlinearFeedbackControlEvidence (P : NonlinearFeedbackControlPackage) where
  closedLoopStable : P.asymptoticStability
  backsteppingConstructedClosed : P.backsteppingConstructed
  slidingSurfaceReachedClosed : P.slidingSurfaceReached

def NonlinearFeedbackControlClosed (P : NonlinearFeedbackControlPackage) : Prop :=
  P.asymptoticStability ∧ P.backsteppingConstructed ∧ P.slidingSurfaceReached

theorem nonlinear_feedback_control_closed_from_evidence
    (P : NonlinearFeedbackControlPackage) (E : NonlinearFeedbackControlEvidence P) :
    NonlinearFeedbackControlClosed P := by
  exact And.intro E.closedLoopStable (
    And.intro E.backsteppingConstructedClosed E.slidingSurfaceReachedClosed)

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse