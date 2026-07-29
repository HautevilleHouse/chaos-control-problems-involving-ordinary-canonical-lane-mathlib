import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure OptimalControlSynthesis where
  costFunctional : ℝ → ℝ
  controlEffort : ℝ
  stateDeviation : ℝ
  optimizationSolution : Prop
  optimizationSolutionTerm : optimizationSolution

structure OptimalControlEvidence (O : OptimalControlSynthesis) where
  costMinimized : O.costFunctional 0 = 0
  controlEffortFinite : O.controlEffort < ∞
  stateDeviationBounded : O.stateDeviation < ∞

def OptimalControlClosed (O : OptimalControlSynthesis) : Prop :=
  O.costFunctional 0 = 0 ∧ O.controlEffort < ∞ ∧ O.stateDeviation < ∞

theorem optimal_control_closed_from_evidence (O : OptimalControlSynthesis)
    (E : OptimalControlEvidence O) : OptimalControlClosed O := by
  exact And.intro E.costMinimized (And.intro E.controlEffortFinite E.stateDeviationBounded)

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse