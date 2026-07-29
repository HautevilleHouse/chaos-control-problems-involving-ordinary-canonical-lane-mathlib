import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure LyapunovExponentEstimator where
  lyapunovExponent : ℝ
  exponentialStabilityMargin : ℝ
  divergenceRate : ℝ
  estimateConfidence : Prop
  estimateConfidenceTerm : estimateConfidence

structure LyapunovExponentEvidence (L : LyapunovExponentEstimator) where
  exponentNegative : L.lyapunovExponent < 0
  stabilityMarginPositive : L.exponentialStabilityMargin > 0

def LyapunovExponentClosed (L : LyapunovExponentEstimator) : Prop :=
  L.lyapunovExponent < 0 ∧ L.exponentialStabilityMargin > 0

theorem lyapunov_exponent_closed_from_evidence (L : LyapunovExponentEstimator)
    (E : LyapunovExponentEvidence L) : LyapunovExponentClosed L := by
  exact And.intro E.exponentNegative E.stabilityMarginPositive

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse