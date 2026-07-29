import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure FeedbackControlLaw where
  stateSpace : Type u
  controlInput : Type v
  controlGain : ℝ
  closedLoopStability : Prop
  stabilityMargin : ℝ
  closedLoopStabilityTerm : closedLoopStability

structure FeedbackControlEvidence (F : FeedbackControlLaw) where
  closedLoopStabilityClosed : F.closedLoopStability
  gainLiesInRange : F.controlGain > 0

def FeedbackControlClosed (F : FeedbackControlLaw) : Prop :=
  F.closedLoopStability ∧ F.controlGain > 0

theorem feedback_control_closed_from_evidence (F : FeedbackControlLaw)
    (E : FeedbackControlEvidence F) : FeedbackControlClosed F := by
  exact And.intro E.closedLoopStabilityClosed E.gainLiesInRange

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse