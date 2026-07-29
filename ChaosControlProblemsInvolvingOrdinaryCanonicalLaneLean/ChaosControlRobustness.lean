import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure ChaosControlRobustnessPackage {G : ChaosControlStateDynamicsPackage}
    {S : ChaosControlStabilizationPackage G} where
  uncertaintySet : Set (G.stateSpace → G.stateSpace)
  robustStabilityMargin : ℝ
  robustnessProp : Prop
  disturbanceAttenuation : Prop

structure ChaosControlRobustnessEvidence {G : ChaosControlStateDynamicsPackage}
    {S : ChaosControlStabilizationPackage G}
    (R : ChaosControlRobustnessPackage G S) where
  robustnessPropClosed : R.robustnessProp
  disturbanceAttenuationClosed : R.disturbanceAttenuation

def ChaosControlRobustnessClosed {G : ChaosControlStateDynamicsPackage}
    {S : ChaosControlStabilizationPackage G}
    (R : ChaosControlRobustnessPackage G S) : Prop :=
  R.robustnessProp ∧ R.disturbanceAttenuation

theorem chaos_control_robustness_closed_from_evidence
    {G : ChaosControlStateDynamicsPackage} {S : ChaosControlStabilizationPackage G}
    (R : ChaosControlRobustnessPackage G S) (E : ChaosControlRobustnessEvidence R) :
    ChaosControlRobustnessClosed R := by
  exact And.intro E.robustnessPropClosed E.disturbanceAttenuationClosed

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse