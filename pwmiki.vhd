library IEEE;

use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

-----------------------------------------------------

entity pwmiki is
  port(
    clr : in std_logic;
    clk : in std_logic;
    dutyiki : in std_logic_vector (7 downto 0);
    periodiki : in std_logic_vector (7 downto 0);
    pwmiki : out std_logic
	 
  );

end pwmiki;

-----------------------------------------------------

architecture pwmiki of pwmiki is

signal count : std_logic_vector(7 downto 0);

begin

  cnt: process(clk, clr) -- 4 bit counter
  begin
    if clr = '1' then
      count <= "00000000";
    elsif clk'event and clk = '1' then
      if count = periodiki -1 then
        count <= "00000000";
      else
        count <= count +1;
      end if;
    end if;
  end process cnt;

  pwmikiout: process(count, dutyiki)
  begin
    if count < dutyiki then
      pwmiki <= '1';
    else
      pwmiki <= '0';
    end if;
  end process pwmikiout;

end pwmiki;