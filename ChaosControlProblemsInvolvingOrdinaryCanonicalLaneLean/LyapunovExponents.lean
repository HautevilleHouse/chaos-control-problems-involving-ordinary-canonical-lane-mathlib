import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure LyapunovExponentSystem (n : ℕ) where
  stateSpace : Type u
  dynamics : stateSpace → stateSpace
  tangentMap : stateSpace → (stateSpace → stateSpace)
  lyapunovExponent : ℝ
  lyapunovExponentComputed : Prop

structure LyapunovExponentEvidence (n : ℕ) (L : LyapunovExponentSystem n) where
  lyapunovExponentComputedClosed : L.lyapunovExponentComputed
  lyapunovExponentFinite : L.lyapunovExponent < ∞
  lyapunovExponentFiniteClosed : lyapunovExponentFinite

def LyapunovExponentClosed {n : ℕ} (L : LyapunovExponentSystem n) : Prop :=
  L.lyapunovExponentComputed ∧ L.lyapunovExponent < ∞

theorem lyapunov_exponent_closed_from_evidence {n : ℕ} (L : LyapunovExponentSystem n)
    (E : LyapunovExponentEvidence n L) : LyapunovExponentClosed L := by
  exact And.intro E.lyapunovExponentComputedClosed E.lyapunovExponentFiniteClosed

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse