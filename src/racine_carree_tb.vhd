---------------------------------------------------------------------------------------------------
-- 
-- racine_carree_tb.vhd
--
-- v. 1.0 Pierre Langlois 2022-02-25 laboratoire #4 INF3500, fichier de démarrage
-- v. 1.1 2024-07-29
--
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.all;

entity racine_carree_tb is
  generic (
    N : positive := 16;
    M : positive := 8
    );
end racine_carree_tb;

architecture arch of racine_carree_tb is
  signal reset     : std_logic;
  signal clk       : std_logic := '0';
  constant periode : time      := 10 ns;

  signal A    : unsigned(N - 1 downto 0);  -- le nombre dont on cherche la racine carrée
  signal go   : std_logic;  --               commande pour débuter les calculs
  signal X    : unsigned(M - 1 downto 0);  -- la racine carrée de A, telle que X * X = A
  signal fini : std_logic;  --             '1' quand les calculs sont terminés ==> la valeur de X est stable et correcte
begin
  UUT : entity racine_carree(newton)
    generic map(16, 8, 10)
    port map(reset, clk, i_A => A, i_go => go, o_x => X, o_fini => fini);

  clk   <= not clk after periode / 2;
  reset <= '1'     after 0 ns, '0' after 5 * periode / 4;

  A  <= to_unsigned(30000, A'length);   -- une stimulation de base
  go <= '0' after 0 ns, '1' after 27 ns, '0' after 37 ns;  -- une stimulation de base
end arch;
