library IEEE;

use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

-----------------------------------------------------

entity pwm_top is
  port(
    clr : in std_logic;
    clk : in std_logic;
    duty : in std_logic_vector (7 downto 0);
	 dutyiki : in std_logic_vector (7 downto 0);
    pwm : out std_logic;
	 pwmiki : out std_logic
  );

end pwm_top;

-----------------------------------------------------

architecture pwm_top of pwm_top is

signal new_clock : std_logic;

begin

clk_div: entity work.clk64kHz
    port map(
      clk => clk, reset => '0', clk_out => new_clock);

Pulse: entity work.pwm
    port map(
      clr => clr, clk => new_clock, duty => duty, period => "11001000", pwm => pwm);      
      
Pulseiki: entity work.pwmiki
    port map(
      clr => clr, clk => new_clock, dutyiki => dutyiki, periodiki => "11001000", pwmiki => pwmiki);  
end pwm_top;