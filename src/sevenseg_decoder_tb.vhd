----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2025 06:29:04 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

architecture test of sevenseg_decoder_tb is
    signal i_Hex : std_logic_vector(3 downto 0);
    signal o_seg_n : std_logic_vector(6 downto 0);
begin
    uut: entity work.sevenseg_decoder 
        port map (
            i_Hex, 
            o_seg_n
        );
    
    process
    begin
        for i in 0 to 15 loop
            i_Hex <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
            case i is
                when 0  => assert o_seg_n = "1000000" report "Error: x0 mismatch" severity error;
                when 1  => assert o_seg_n = "1111001" report "Error: x1 mismatch" severity error;
                when 2  => assert o_seg_n = "0100100" report "Error: x2 mismatch" severity error;
                when 3  => assert o_seg_n = "0110000" report "Error: x3 mismatch" severity error;
                when 4  => assert o_seg_n = "0011001" report "Error: x4 mismatch" severity error;
                when 5  => assert o_seg_n = "0010010" report "Error: x5 mismatch" severity error;
                when 6  => assert o_seg_n = "0000010" report "Error: x6 mismatch" severity error;
                when 7  => assert o_seg_n = "1111000" report "Error: x7 mismatch" severity error;
                when 8  => assert o_seg_n = "0000000" report "Error: x8 mismatch" severity error;
                when 9  => assert o_seg_n = "0011000" report "Error: x9 mismatch" severity error;
                when 10 => assert o_seg_n = "0001000" report "Error: xA mismatch" severity error;
                when 11 => assert o_seg_n = "0000011" report "Error: xB mismatch" severity error;
                when 12 => assert o_seg_n = "0100111" report "Error: xC mismatch" severity error;
                when 13 => assert o_seg_n = "0100001" report "Error: xD mismatch" severity error;
                when 14 => assert o_seg_n = "0000110" report "Error: xE mismatch" severity error;
                when 15 => assert o_seg_n = "0001110" report "Error: xF mismatch" severity error;
                when others => null;
            end case;
        end loop;
        wait;
    end process;
end test;
