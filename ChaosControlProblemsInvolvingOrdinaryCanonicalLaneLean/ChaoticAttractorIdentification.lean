import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure ChaoticAttractorIdentification where
  attractorDimension : ℝ
  lyapunovSpectrum : List ℝ
  fractalDimension : ℝ
  identificationConfidence : Prop
  identificationConfidenceTerm : identificationConfidence

structure AttractorEvidence (A : ChaoticAttractorIdentification) where
  positiveLyapunovExists : ∃ λ ∈ A.lyapunovSpectrum, λ > 0
  dimensionPositive : A.attractorDimension > 0

def AttractorClosed (A : ChaoticAttractorIdentification) : Prop :=
  (∃ λ ∈ A.lyapunovSpectrum, λ > 0) ∧ A.attractorDimension > 0

theorem attractor_closed_from_evidence (A : ChaoticAttractorIdentification)
    (E : AttractorEvidence A) : AttractorClosed A := by
  exact And.intro E.positiveLyapunovExists E.dimensionPositive

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse