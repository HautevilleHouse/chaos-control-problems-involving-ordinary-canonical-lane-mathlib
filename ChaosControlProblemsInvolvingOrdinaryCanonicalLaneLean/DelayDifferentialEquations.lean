import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure DelayDifferentialEquation (n : ℕ) where
  stateSpace : Type u
  delay : ℝ
  functionalF : (stateSpace → ℝ) → stateSpace
  initialHistory : ℝ → stateSpace
  delayPositive : delay > 0

structure DelayDifferentialEvidence (n : ℕ) (D : DelayDifferentialEquation n) where
  delayPositiveClosed : D.delayPositive
  functionalFContinuous : Prop
  initialHistoryContinuous : Prop
  functionalFContinuousClosed : functionalFContinuous
  initialHistoryContinuousClosed : initialHistoryContinuous

def DelayDifferentialClosed {n : ℕ} (D : DelayDifferentialEquation n) : Prop :=
  D.delayPositive

theorem delay_differential_closed_from_evidence {n : ℕ} (D : DelayDifferentialEquation n)
    (E : DelayDifferentialEvidence n D) : DelayDifferentialClosed D := by
  exact E.delayPositiveClosed

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse