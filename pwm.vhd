library IEEE;

use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

-----------------------------------------------------

entity pwm is
  port(
    clr : in std_logic;
    clk : in std_logic;
    duty : in std_logic_vector (7 downto 0);
    period : in std_logic_vector (7 downto 0);
    pwm : out std_logic
	 
	 
  );

end pwm;

-----------------------------------------------------

architecture pwm of pwm is

signal count : std_logic_vector(7 downto 0);

begin

  cnt: process(clk, clr) -- 4 bit counter
  begin
    if clr = '1' then
      count <= "00000000";
    elsif clk'event and clk = '1' then
      if count = period -1 then
        count <= "00000000";
      else
        count <= count +1;
      end if;
    end if;
  end process cnt;

  pwmout: process(count, duty)
  begin
    if count < duty then
      pwm <= '1';
    else
      pwm <= '0';
    end if;
  end process pwmout;

end pwm;