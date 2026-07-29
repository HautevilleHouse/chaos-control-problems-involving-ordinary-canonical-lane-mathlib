import ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean.ChaosControlDynamics

namespace HautevilleHouse
namespace ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean

structure BifurcationParam (C : ChaosControlSystem) where
  param : ℝ
  criticalSet : Set C.stateSpace
  stabilityChange : ∀ x : C.stateSpace, x ∈ criticalSet ∨ x ∉ criticalSet

def bifurcationDetected (B : BifurcationParam C) : Prop :=
  ∃ x ∈ B.criticalSet, ∀ ε > 0, ∃ y ∉ B.criticalSet, dist x y < ε

theorem bifurcation_bridge (B : BifurcationParam C) (h : bifurcationDetected B) :
  B.criticalSet ≠ Set.univ := by
  intro huniv
  have : ∀ x : C.stateSpace, x ∈ B.criticalSet := λ x => Set.mem_of_eq_of_mem rfl (congrArg (· x) huniv)
  rcases h with ⟨x, hx, hneigh⟩
  apply hneigh 1 (by norm_num) x
  exact this x

end ChaosControlProblemsInvolvingOrdinaryCanonicalLaneLean
end HautevilleHouse