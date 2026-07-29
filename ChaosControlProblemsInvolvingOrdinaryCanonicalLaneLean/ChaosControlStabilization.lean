import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure ChaosControlStabilizationPackage {G : ChaosControlStateDynamicsPackage} where
  feedbackLaw : G.stateSpace → G.controlSpace
  lyapunovFunction : G.stateSpace → ℝ
  lyapunovStabilityProp : Prop
  exponentialRate : Prop

structure ChaosControlStabilizationEvidence {G : ChaosControlStateDynamicsPackage}
    (S : ChaosControlStabilizationPackage G) where
  lyapunovStabilityPropClosed : S.lyapunovStabilityProp
  exponentialRateClosed : S.exponentialRate

def ChaosControlStabilizationClosed {G : ChaosControlStateDynamicsPackage}
    (S : ChaosControlStabilizationPackage G) : Prop :=
  S.lyapunovStabilityProp ∧ S.exponentialRate

theorem chaos_control_stabilization_closed_from_evidence
    {G : ChaosControlStateDynamicsPackage} (S : ChaosControlStabilizationPackage G)
    (E : ChaosControlStabilizationEvidence S) : ChaosControlStabilizationClosed S := by
  exact And.intro E.lyapunovStabilityPropClosed E.exponentialRateClosed

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse