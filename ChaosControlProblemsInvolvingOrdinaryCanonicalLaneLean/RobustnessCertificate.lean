import ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean.LiapunovFunctionalGate

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure RobustnessCertificate (C : ChaosControlSystem) where
  nominalController : C.controlSpace → C.controlSpace
  disturbanceBound : ℝ
  stabilityMargin : ℝ
  marginPositive : stabilityMargin > 0

def robustnessClosed (R : RobustnessCertificate C) : Prop :=
  R.stabilityMargin > 0 ∧ R.disturbanceBound < R.stabilityMargin

theorem robustness_closed (C : ChaosControlSystem) (R : RobustnessCertificate C) :
  robustnessClosed R := by
  exact And.intro R.marginPositive (by
    nlinarith)

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse