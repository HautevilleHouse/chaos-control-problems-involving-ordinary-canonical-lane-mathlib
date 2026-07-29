import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure ODESolverDiscretization where
  timeStep : ℝ
  discretizationMethod : String
  localTruncationError : ℝ
  globalErrorBound : ℝ
  stabilityCondition : Prop
  stabilityConditionTerm : stabilityCondition

structure ODE{SolverDiscretizationEvidence (O : ODESolverDiscretization) where
  stepSizeSufficient : O.timeStep > 0
  globalErrorBounded : O.globalErrorBound < ∞
  stabilityConditionClosed : O.stabilityCondition

def ODESolverDiscretizationClosed (O : ODESolverDiscretization) : Prop :=
  O.timeStep > 0 ∧ O.globalErrorBound < ∞ ∧ O.stabilityCondition

theorem ode_solver_discretization_closed_from_evidence (O : ODESolverDiscretization)
    (E : ODESolverDiscretizationEvidence O) : ODESolverDiscretizationClosed O := by
  exact And.intro E.stepSizeSufficient (And.intro E.globalErrorBounded E.stabilityConditionClosed)

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse