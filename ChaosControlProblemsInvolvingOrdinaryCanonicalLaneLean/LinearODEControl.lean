import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure LinearODEControlPackage where
  stateDimension : ℕ
  controlDimension : ℕ
  dynamics : stateDimension → controlDimension → stateDimension
  controllability : Prop
  stabilizability : Prop
  lyapunovFunction : Prop
  lyapunovStability : Prop

structure LinearODEControlEvidence (P : LinearODEControlPackage) where
  controllabilityClosed : P.controllability
  stabilizabilityClosed : P.stabilizability
  lyapunovFunctionClosed : P.lyapunovFunction
  lyapunovStabilityClosed : P.lyapunovStability

def LinearODEControlClosed (P : LinearODEControlPackage) : Prop :=
  P.controllability ∧ P.stabilizability ∧ P.lyapunovFunction ∧ P.lyapunovStability

theorem linear_ode_control_closed_from_evidence
    (P : LinearODEControlPackage) (E : LinearODEControlEvidence P) :
    LinearODEControlClosed P := by
  exact And.intro E.controllabilityClosed (
    And.intro E.stabilizabilityClosed (
      And.intro E.lyapunovFunctionClosed E.lyapunovStabilityClosed))

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse