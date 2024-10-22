---------------------------------------------------------------------------------------------------
-- 
-- racine_carree.vhd
--
-- v. 1.0 Pierre Langlois 2022-02-25 laboratoire #4 INF3500 - code de base
-- v. 1.1 2024-07-29
--
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity racine_carree is
  generic (
    -- Nombre de bits de A
    N    : positive := 16
    -- Nombre de bits de X
    M    : positive := 8
    -- Nombre d'itérations à faire
    kmax : positive := 11
    );
  port (
    reset, clk : in  std_logic;
    -- Le nombre dont on cherche la racine carrée
    i_A        : in  unsigned(N - 1 downto 0);
    -- Commande pour débuter les calculs
    i_go       : in  std_logic;
    -- La racine carré de A, telle que X * X = A
    o_X        : out unsigned(M - 1 downto 0);
    -- '1' quand les calculs sont terminés ==> la valeur de X est
    -- stable et correcte
    o_fini     : out std_logic
    );
end racine_carree;

architecture newton of racine_carree is
  constant W_frac : integer := 14;  -- pour le module de division, nombre de bits pour exprimer les réciproques

  type etat_type is (attente, calculs);
  signal etat : etat_type := attente;

  --- votre code ici

begin
  -- diviseur : entity division_par_reciproque(arch)
  --   generic map(N, M, W_frac)
  --   port map(un-signal-ici, un-signal-ici, un-signal-ici, un-signal-ici);

  o_X    <= to_unsigned(255, o_X'length);  -- code bidon
  o_fini <= '1';                           -- code bidon
end newton;
