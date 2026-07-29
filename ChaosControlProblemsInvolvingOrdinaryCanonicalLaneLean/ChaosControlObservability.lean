import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure ChaosControlObservabilityPackage {G : ChaosControlStateDynamicsPackage} where
  outputFunction : G.stateSpace → ℝ
  observabilityMap : ℕ → G.stateSpace → ℝ
  observabilityRankCondition : Prop
  detectabilityProp : Prop

structure ChaosControlObservabilityEvidence {G : ChaosControlStateDynamicsPackage}
    (O : ChaosControlObservabilityPackage G) where
  observabilityRankConditionClosed : O.observabilityRankCondition
  detectabilityPropClosed : O.detectabilityProp

def ChaosControlObservabilityClosed {G : ChaosControlStateDynamicsPackage}
    (O : ChaosControlObservabilityPackage G) : Prop :=
  O.observabilityRankCondition ∧ O.detectabilityProp

theorem chaos_control_observability_closed_from_evidence
    {G : ChaosControlStateDynamicsPackage} (O : ChaosControlObservabilityPackage G)
    (E : ChaosControlObservabilityEvidence O) : ChaosControlObservabilityClosed O := by
  exact And.intro E.observabilityRankConditionClosed E.detectabilityPropClosed

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse