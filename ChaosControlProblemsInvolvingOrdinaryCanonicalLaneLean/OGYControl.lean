import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

/-!
# OGY Control Package

The Ott–Grebogi–Yorke (OGY) method stabilizes unstable periodic orbits in chaotic
systems by applying small, time-dependent perturbations. This package formalizes
the OGY control structure as an admissible-class bridge.
-/

structure OGYControlPackage where
  systemType : Type
  unstablePeriodicOrbit : Prop
  poincareSection : Type
  perturbationMagnitudeBounded : Prop
  controlLawApplied : Prop
  orbitStabilized : Prop

structure OGYControlEvidence (O : OGYControlPackage) where
  unstablePeriodicOrbitClosed : O.unstablePeriodicOrbit
  perturbationMagnitudeBoundedClosed : O.perturbationMagnitudeBounded
  controlLawAppliedClosed : O.controlLawApplied
  orbitStabilizedClosed : O.orbitStabilized

def OGYControlClosed (O : OGYControlPackage) : Prop :=
  O.unstablePeriodicOrbit ∧ O.perturbationMagnitudeBounded ∧
  O.controlLawApplied ∧ O.orbitStabilized

theorem ogy_control_closed_from_evidence
    (O : OGYControlPackage) (E : OGYControlEvidence O) :
    OGYControlClosed O := by
  exact And.intro E.unstablePeriodicOrbitClosed
    (And.intro E.perturbationMagnitudeBoundedClosed
      (And.intro E.controlLawAppliedClosed E.orbitStabilizedClosed))

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse
