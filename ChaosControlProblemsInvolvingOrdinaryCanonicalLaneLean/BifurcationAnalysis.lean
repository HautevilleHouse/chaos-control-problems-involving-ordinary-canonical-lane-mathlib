import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure BifurcationAnalysis where
  bifurcationParameter : ℝ
  criticalValue : ℝ
  bifurcationType : String
  stabilityChange : Prop
  stabilityChangeTerm : stabilityChange

structure BifurcationEvidence (B : BifurcationAnalysis) where
  criticalValueReached : B.bifurcationParameter = B.criticalValue
  stabilityChangeClosed : B.stabilityChange

def BifurcationClosed (B : BifurcationAnalysis) : Prop :=
  B.bifurcationParameter = B.criticalValue ∧ B.stabilityChange

theorem bifurcation_closed_from_evidence (B : BifurcationAnalysis)
    (E : BifurcationEvidence B) : BifurcationClosed B := by
  exact And.intro E.criticalValueReached E.stabilityChangeClosed

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse