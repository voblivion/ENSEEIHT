
with Ada.Numerics.Discrete_Random;

package body Alea is
   -- Fonction qui fournit un nombre aleatoire entre 1 et 100
   -- Parametres : aucun.
   -- pre :-
   -- post : le resultat est entre 1 et 100
   -- exceptions : -
   function Alea_1_100 return Integer is
      type Intervalle is range 1 .. 100;
      package Gene is new Ada.Numerics.Discrete_Random (Intervalle);
      use Gene;
      n : Intervalle;
      G : Generator;
   begin
      Reset (G);          -- Initialise le générateur (à faire une seule fois)
      n := Random (G);    -- Tire un nombre au hasard entre Min et Max
      return Integer'Value(Intervalle'Image(N)) ;
   end Alea_1_100;
end Alea ;
