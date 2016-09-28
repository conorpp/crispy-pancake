-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 15.0.0 Build 145 04/22/2015 SJ Web Edition"

-- DATE "09/28/2016 02:06:57"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	clock_glitcher IS
    PORT (
	clk : IN std_logic;
	glitch : BUFFER std_logic;
	LEDR : BUFFER std_logic_vector(9 DOWNTO 0)
	);
END clock_glitcher;

-- Design Ports Information
-- glitch	=>  Location: PIN_AC18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[0]	=>  Location: PIN_V16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[1]	=>  Location: PIN_W16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[2]	=>  Location: PIN_V17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[3]	=>  Location: PIN_V18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[4]	=>  Location: PIN_W17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[5]	=>  Location: PIN_W19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[6]	=>  Location: PIN_Y19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[7]	=>  Location: PIN_W20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[8]	=>  Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[9]	=>  Location: PIN_Y21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- clk	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF clock_glitcher IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_glitch : std_logic;
SIGNAL ww_LEDR : std_logic_vector(9 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|counter[0].output_counter_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_MHI_bus_1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_DIN_bus\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_ADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_BYTEEN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_CNTSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|blockselect\ : std_logic;
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|clk0bad\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|refclk_select_extswitchbuf_wire\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|up_dn~combout\ : std_logic;
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|refclk_select_clkout_wire\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_mdio_dis~combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|phase_en~combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_read~combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|~QUARTUS_CREATED_VCC~I_combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_dprio_read|combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_ser_shift_load~combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_write~combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[0]~0_combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[4]~4_combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[2]~2_combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|gnd~combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[3]~3_combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[1]~1_combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_0|combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_1|combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_2|combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_3|combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_4|combout\ : std_logic;
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|pll_reconfig_up_wire\ : std_logic;
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|pll_reconfig_shiftenm_wire\ : std_logic;
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|shift\ : std_logic;
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|cntnen\ : std_logic;
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|tclk\ : std_logic;
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \count_new[0]~0_combout\ : std_logic;
SIGNAL \Add1~97_sumout\ : std_logic;
SIGNAL \Add1~98\ : std_logic;
SIGNAL \Add1~93_sumout\ : std_logic;
SIGNAL \Add1~94\ : std_logic;
SIGNAL \Add1~89_sumout\ : std_logic;
SIGNAL \Add1~90\ : std_logic;
SIGNAL \Add1~85_sumout\ : std_logic;
SIGNAL \Add1~86\ : std_logic;
SIGNAL \Add1~81_sumout\ : std_logic;
SIGNAL \Add1~82\ : std_logic;
SIGNAL \Add1~77_sumout\ : std_logic;
SIGNAL \Add1~78\ : std_logic;
SIGNAL \Add1~73_sumout\ : std_logic;
SIGNAL \Add1~74\ : std_logic;
SIGNAL \Add1~69_sumout\ : std_logic;
SIGNAL \Add1~70\ : std_logic;
SIGNAL \Add1~65_sumout\ : std_logic;
SIGNAL \Add1~66\ : std_logic;
SIGNAL \Add1~61_sumout\ : std_logic;
SIGNAL \Add1~62\ : std_logic;
SIGNAL \Add1~57_sumout\ : std_logic;
SIGNAL \Add1~58\ : std_logic;
SIGNAL \Add1~53_sumout\ : std_logic;
SIGNAL \Add1~54\ : std_logic;
SIGNAL \Add1~49_sumout\ : std_logic;
SIGNAL \Add1~50\ : std_logic;
SIGNAL \Add1~45_sumout\ : std_logic;
SIGNAL \Add1~46\ : std_logic;
SIGNAL \Add1~41_sumout\ : std_logic;
SIGNAL \Add1~42\ : std_logic;
SIGNAL \Add1~37_sumout\ : std_logic;
SIGNAL \Add1~38\ : std_logic;
SIGNAL \Add1~33_sumout\ : std_logic;
SIGNAL \Add1~34\ : std_logic;
SIGNAL \Add1~29_sumout\ : std_logic;
SIGNAL \Add1~30\ : std_logic;
SIGNAL \Add1~25_sumout\ : std_logic;
SIGNAL \Add1~26\ : std_logic;
SIGNAL \Add1~21_sumout\ : std_logic;
SIGNAL \Add1~22\ : std_logic;
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \Add1~18\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \Add1~14\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \Add1~10\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \count_reg[0]~0_combout\ : std_logic;
SIGNAL \Add0~97_sumout\ : std_logic;
SIGNAL \Add0~98\ : std_logic;
SIGNAL \Add0~93_sumout\ : std_logic;
SIGNAL \Add0~94\ : std_logic;
SIGNAL \Add0~89_sumout\ : std_logic;
SIGNAL \Add0~90\ : std_logic;
SIGNAL \Add0~85_sumout\ : std_logic;
SIGNAL \Add0~86\ : std_logic;
SIGNAL \Add0~81_sumout\ : std_logic;
SIGNAL \Add0~82\ : std_logic;
SIGNAL \Add0~77_sumout\ : std_logic;
SIGNAL \Add0~78\ : std_logic;
SIGNAL \Add0~73_sumout\ : std_logic;
SIGNAL \Add0~74\ : std_logic;
SIGNAL \Add0~69_sumout\ : std_logic;
SIGNAL \Add0~70\ : std_logic;
SIGNAL \Add0~65_sumout\ : std_logic;
SIGNAL \Add0~66\ : std_logic;
SIGNAL \Add0~61_sumout\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~57_sumout\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~53_sumout\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~49_sumout\ : std_logic;
SIGNAL \Add0~50\ : std_logic;
SIGNAL \Add0~45_sumout\ : std_logic;
SIGNAL \Add0~46\ : std_logic;
SIGNAL \Add0~41_sumout\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|cascade_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fboutclk_wire\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\ : std_logic_vector(7 DOWNTO 0);
SIGNAL count_reg : std_logic_vector(31 DOWNTO 0);
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_byteen\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|shiften\ : std_logic_vector(8 DOWNTO 0);
SIGNAL count_new : std_logic_vector(31 DOWNTO 0);
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_~QUARTUS_CREATED_VCC~I_combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|ALT_INV_gnd~combout\ : std_logic;
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_dprio_read~combout\ : std_logic;
SIGNAL ALT_INV_count_reg : std_logic_vector(25 DOWNTO 0);
SIGNAL ALT_INV_count_new : std_logic_vector(25 DOWNTO 0);
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_combout\ : std_logic;

BEGIN

ww_clk <= clk;
glitch <= ww_glitch;
LEDR <= ww_LEDR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\comb_4|pll_0|altera_pll_i|cyclonev_pll|counter[0].output_counter_VCO0PH_bus\ <= (\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(7) & \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(6) & 
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(5) & \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(4) & \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(3) & \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(2) & 
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(1) & \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(0));

\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(0) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_VCOPH_bus\(0);
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(1) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_VCOPH_bus\(1);
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(2) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_VCOPH_bus\(2);
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(3) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_VCOPH_bus\(3);
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(4) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_VCOPH_bus\(4);
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(5) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_VCOPH_bus\(5);
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(6) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_VCOPH_bus\(6);
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|vcoph\(7) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_VCOPH_bus\(7);

\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(0) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_MHI_bus_1\(0);
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(1) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_MHI_bus_1\(1);
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(2) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_MHI_bus_1\(2);
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(3) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_MHI_bus_1\(3);
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(4) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_MHI_bus_1\(4);
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(5) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_MHI_bus_1\(5);
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(6) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_MHI_bus_1\(6);
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(7) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_MHI_bus_1\(7);

\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_DIN_bus\ <= (\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(15) & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(14) & \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(13) & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(12) & \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(11) & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(10) & \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(9) & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(8) & \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(7) & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(6) & \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(5) & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(4) & \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(3) & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(2) & \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(1) & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(0));

\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_ADDR_bus\ <= (\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(5) & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(4) & \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(3) & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(2) & \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(1) & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(0));

\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_BYTEEN_bus\ <= (\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_byteen\(1) & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_byteen\(0));

\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_CNTSEL_bus\ <= (\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_4|combout\ & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_3|combout\ & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_2|combout\ & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_1|combout\ & 
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_0|combout\);

\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_MHI_bus\ <= (\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(7) & \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(6) & 
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(5) & \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(4) & \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(3) & 
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(2) & \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(1) & \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_mhi_bus\(0));

\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|shiften\(6) <= \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_SHIFTEN_bus\(6);

\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|REFCLK_SELECT_CLKIN_bus\ <= (gnd & gnd & gnd & \clk~input_o\);
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_~QUARTUS_CREATED_VCC~I_combout\ <= NOT \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|~QUARTUS_CREATED_VCC~I_combout\;
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|ALT_INV_gnd~combout\ <= NOT \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|gnd~combout\;
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_dprio_read~combout\ <= NOT \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_read~combout\;
ALT_INV_count_reg(0) <= NOT count_reg(0);
ALT_INV_count_reg(1) <= NOT count_reg(1);
ALT_INV_count_new(0) <= NOT count_new(0);
ALT_INV_count_new(1) <= NOT count_new(1);
ALT_INV_count_reg(2) <= NOT count_reg(2);
ALT_INV_count_new(2) <= NOT count_new(2);
ALT_INV_count_reg(3) <= NOT count_reg(3);
ALT_INV_count_new(3) <= NOT count_new(3);
ALT_INV_count_reg(4) <= NOT count_reg(4);
ALT_INV_count_new(4) <= NOT count_new(4);
ALT_INV_count_reg(5) <= NOT count_reg(5);
ALT_INV_count_new(5) <= NOT count_new(5);
ALT_INV_count_reg(6) <= NOT count_reg(6);
ALT_INV_count_new(6) <= NOT count_new(6);
ALT_INV_count_reg(7) <= NOT count_reg(7);
ALT_INV_count_new(7) <= NOT count_new(7);
ALT_INV_count_reg(8) <= NOT count_reg(8);
ALT_INV_count_new(8) <= NOT count_new(8);
ALT_INV_count_reg(9) <= NOT count_reg(9);
ALT_INV_count_new(9) <= NOT count_new(9);
ALT_INV_count_reg(10) <= NOT count_reg(10);
ALT_INV_count_new(10) <= NOT count_new(10);
ALT_INV_count_reg(11) <= NOT count_reg(11);
ALT_INV_count_new(11) <= NOT count_new(11);
ALT_INV_count_reg(12) <= NOT count_reg(12);
ALT_INV_count_new(12) <= NOT count_new(12);
ALT_INV_count_reg(13) <= NOT count_reg(13);
ALT_INV_count_new(13) <= NOT count_new(13);
ALT_INV_count_reg(14) <= NOT count_reg(14);
ALT_INV_count_new(14) <= NOT count_new(14);
ALT_INV_count_reg(15) <= NOT count_reg(15);
ALT_INV_count_new(15) <= NOT count_new(15);
ALT_INV_count_reg(16) <= NOT count_reg(16);
ALT_INV_count_new(16) <= NOT count_new(16);
ALT_INV_count_reg(17) <= NOT count_reg(17);
ALT_INV_count_new(17) <= NOT count_new(17);
ALT_INV_count_reg(18) <= NOT count_reg(18);
ALT_INV_count_new(18) <= NOT count_new(18);
ALT_INV_count_reg(19) <= NOT count_reg(19);
ALT_INV_count_new(19) <= NOT count_new(19);
ALT_INV_count_reg(20) <= NOT count_reg(20);
ALT_INV_count_new(20) <= NOT count_new(20);
ALT_INV_count_reg(21) <= NOT count_reg(21);
ALT_INV_count_new(21) <= NOT count_new(21);
ALT_INV_count_reg(22) <= NOT count_reg(22);
ALT_INV_count_new(22) <= NOT count_new(22);
ALT_INV_count_reg(23) <= NOT count_reg(23);
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(4) <= NOT \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(4);
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(3) <= NOT \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(3);
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(2) <= NOT \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(2);
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(1) <= NOT \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(1);
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(0) <= NOT \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(0);
ALT_INV_count_new(23) <= NOT count_new(23);
ALT_INV_count_reg(24) <= NOT count_reg(24);
ALT_INV_count_new(24) <= NOT count_new(24);
ALT_INV_count_reg(25) <= NOT count_reg(25);
ALT_INV_count_new(25) <= NOT count_new(25);
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_combout\ <= NOT \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|combout\;

-- Location: IOOBUF_X64_Y0_N2
\glitch~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_glitch);

-- Location: IOOBUF_X52_Y0_N2
\LEDR[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => count_new(25),
	devoe => ww_devoe,
	o => ww_LEDR(0));

-- Location: IOOBUF_X52_Y0_N19
\LEDR[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(1));

-- Location: IOOBUF_X60_Y0_N2
\LEDR[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(2));

-- Location: IOOBUF_X80_Y0_N2
\LEDR[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(3));

-- Location: IOOBUF_X60_Y0_N19
\LEDR[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(4));

-- Location: IOOBUF_X80_Y0_N19
\LEDR[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(5));

-- Location: IOOBUF_X84_Y0_N2
\LEDR[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(6));

-- Location: IOOBUF_X89_Y6_N5
\LEDR[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(7));

-- Location: IOOBUF_X89_Y8_N5
\LEDR[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(8));

-- Location: IOOBUF_X89_Y6_N22
\LEDR[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => count_reg(25),
	devoe => ww_devoe,
	o => ww_LEDR(9));

-- Location: IOIBUF_X32_Y0_N1
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: PLLREFCLKSELECT_X0_Y21_N0
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|REFCLK_SELECT\ : cyclonev_pll_refclk_select
-- pragma translate_off
GENERIC MAP (
	pll_auto_clk_sw_en => "false",
	pll_clk_loss_edge => "both_edges",
	pll_clk_loss_sw_en => "false",
	pll_clk_sw_dly => 0,
	pll_clkin_0_src => "clk_0",
	pll_clkin_1_src => "clk_0",
	pll_manu_clk_sw_en => "false",
	pll_sw_refclk_src => "clk_0")
-- pragma translate_on
PORT MAP (
	clkin => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|REFCLK_SELECT_CLKIN_bus\,
	clk0bad => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|clk0bad\,
	clkout => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|refclk_select_clkout_wire\,
	extswitchbuf => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|refclk_select_extswitchbuf_wire\);

-- Location: LABCELL_X10_Y21_N3
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|up_dn\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|up_dn~combout\ = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|up_dn~combout\);

-- Location: CLKCTRL_G4
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: LABCELL_X10_Y26_N12
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_mdio_dis\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_mdio_dis~combout\ = LCELL(VCC)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_mdio_dis~combout\);

-- Location: LABCELL_X10_Y26_N15
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|phase_en\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|phase_en~combout\ = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|phase_en~combout\);

-- Location: LABCELL_X10_Y26_N54
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_read\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_read~combout\ = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_read~combout\);

-- Location: LABCELL_X10_Y26_N57
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|~QUARTUS_CREATED_VCC~I\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|~QUARTUS_CREATED_VCC~I_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|~QUARTUS_CREATED_VCC~I_combout\);

-- Location: LABCELL_X10_Y26_N6
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|lcell_inst\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|combout\ = GND

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_~QUARTUS_CREATED_VCC~I_combout\,
	datab => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_~QUARTUS_CREATED_VCC~I_combout\,
	datac => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_~QUARTUS_CREATED_VCC~I_combout\,
	datad => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_~QUARTUS_CREATED_VCC~I_combout\,
	datae => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_~QUARTUS_CREATED_VCC~I_combout\,
	dataf => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_~QUARTUS_CREATED_VCC~I_combout\,
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|combout\);

-- Location: LABCELL_X10_Y26_N0
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_dprio_read|lcell_inst\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_dprio_read|combout\ = \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_read~combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_dprio_read~combout\,
	datab => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_~QUARTUS_CREATED_VCC~I_combout\,
	datac => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_~QUARTUS_CREATED_VCC~I_combout\,
	datad => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_~QUARTUS_CREATED_VCC~I_combout\,
	datae => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_~QUARTUS_CREATED_VCC~I_combout\,
	dataf => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_fpll_0_1|ALT_INV_combout\,
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_dprio_read|combout\);

-- Location: LABCELL_X10_Y26_N48
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_ser_shift_load\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_ser_shift_load~combout\ = LCELL(VCC)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_ser_shift_load~combout\);

-- Location: LABCELL_X10_Y26_N51
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_write\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_write~combout\ = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_write~combout\);

-- Location: LABCELL_X10_Y28_N33
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(0) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(0));

-- Location: LABCELL_X10_Y27_N3
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(1) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(1));

-- Location: LABCELL_X10_Y28_N24
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(2) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(2));

-- Location: LABCELL_X10_Y28_N21
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(3) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(3));

-- Location: LABCELL_X10_Y28_N36
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address[4]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(4) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(4));

-- Location: LABCELL_X10_Y28_N57
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address[5]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(5) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_address\(5));

-- Location: LABCELL_X10_Y26_N24
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_byteen[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_byteen\(0) = LCELL(VCC)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_byteen\(0));

-- Location: LABCELL_X10_Y28_N54
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_byteen[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_byteen\(1) = LCELL(VCC)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_byteen\(1));

-- Location: LABCELL_X10_Y28_N12
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[0]~0_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[0]~0_combout\);

-- Location: FF_X10_Y28_N26
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[0]~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(0));

-- Location: LABCELL_X10_Y28_N39
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[4]~4_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[4]~4_combout\);

-- Location: FF_X10_Y28_N41
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(4));

-- Location: LABCELL_X10_Y28_N30
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[2]~2_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[2]~2_combout\);

-- Location: FF_X10_Y28_N32
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(2));

-- Location: LABCELL_X10_Y28_N18
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|gnd\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|gnd~combout\ = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|gnd~combout\);

-- Location: LABCELL_X10_Y28_N27
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[3]~3_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[3]~3_combout\);

-- Location: FF_X10_Y28_N29
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(3));

-- Location: LABCELL_X11_Y28_N33
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[1]~1_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[1]~1_combout\);

-- Location: FF_X11_Y28_N35
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(1));

-- Location: LABCELL_X10_Y28_N3
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_0|lcell_inst\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_0|combout\ = \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(0),
	datab => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(4),
	datac => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(2),
	datad => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|ALT_INV_gnd~combout\,
	datae => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(3),
	dataf => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(1),
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_0|combout\);

-- Location: LABCELL_X10_Y28_N9
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_1|lcell_inst\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_1|combout\ = ( \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(2) & ( 
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(1) & ( (((\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(3)) # 
-- (\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|gnd~combout\)) # (\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(4))) # 
-- (\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(0)) ) ) ) # ( !\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(2) & ( 
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(1) ) ) # ( !\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(2) & ( 
-- !\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(1) & ( (!\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(0) & 
-- (!\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(4) & (!\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|gnd~combout\ & 
-- !\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000011111111111111110111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(0),
	datab => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(4),
	datac => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|ALT_INV_gnd~combout\,
	datad => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(3),
	datae => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(2),
	dataf => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(1),
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_1|combout\);

-- Location: LABCELL_X10_Y28_N6
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_2|lcell_inst\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_2|combout\ = ( \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(1) & ( 
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(2) & ( (((\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|gnd~combout\) # 
-- (\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(3))) # (\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(4))) # 
-- (\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(0)) ) ) ) # ( !\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(1) & ( 
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(2) ) ) # ( !\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(1) & ( 
-- !\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(2) & ( (!\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(0) & 
-- (!\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(4) & (!\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(3) & 
-- !\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|gnd~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000011111111111111110111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(0),
	datab => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(4),
	datac => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(3),
	datad => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|ALT_INV_gnd~combout\,
	datae => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(1),
	dataf => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(2),
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_2|combout\);

-- Location: LABCELL_X10_Y28_N42
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_3|lcell_inst\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_3|combout\ = ( \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(3) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|ALT_INV_gnd~combout\,
	datab => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(2),
	datac => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(0),
	datad => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(4),
	datae => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(3),
	dataf => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(1),
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_3|combout\);

-- Location: LABCELL_X10_Y28_N48
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_4|lcell_inst\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_4|combout\ = \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|usr_cnt_sel\(4)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|ALT_INV_gnd~combout\,
	datab => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(2),
	datac => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(0),
	datad => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(4),
	datae => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(3),
	dataf => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|ALT_INV_usr_cnt_sel\(1),
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dyn_phase_shift_inst|lcell_cnt_sel_4|combout\);

-- Location: LABCELL_X10_Y25_N0
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(0) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(0));

-- Location: LABCELL_X10_Y25_N6
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(1) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(1));

-- Location: LABCELL_X10_Y25_N15
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(2) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(2));

-- Location: LABCELL_X10_Y25_N18
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(3) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(3));

-- Location: LABCELL_X10_Y25_N21
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[4]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(4) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(4));

-- Location: LABCELL_X10_Y25_N24
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[5]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(5) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(5));

-- Location: LABCELL_X10_Y25_N27
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[6]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(6) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(6));

-- Location: LABCELL_X10_Y25_N33
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[7]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(7) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(7));

-- Location: LABCELL_X10_Y26_N27
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[8]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(8) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(8));

-- Location: LABCELL_X10_Y26_N30
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[9]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(9) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(9));

-- Location: LABCELL_X10_Y26_N33
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[10]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(10) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(10));

-- Location: LABCELL_X10_Y26_N36
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[11]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(11) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(11));

-- Location: LABCELL_X10_Y26_N39
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[12]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(12) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(12));

-- Location: LABCELL_X10_Y26_N42
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[13]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(13) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(13));

-- Location: LABCELL_X10_Y26_N45
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[14]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(14) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(14));

-- Location: LABCELL_X10_Y26_N18
\comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata[15]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(15) = LCELL(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_writedata\(15));

-- Location: FRACTIONALPLL_X0_Y15_N0
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll\ : cyclonev_fractional_pll
-- pragma translate_off
GENERIC MAP (
	dsm_accumulator_reset_value => 0,
	forcelock => "false",
	mimic_fbclk_type => "none",
	nreset_invert => "false",
	output_clock_frequency => "400.0 mhz",
	pll_atb => 0,
	pll_bwctrl => 4000,
	pll_cmp_buf_dly => "0 ps",
	pll_cp_comp => "true",
	pll_cp_current => 20,
	pll_ctrl_override_setting => "false",
	pll_dsm_dither => "disable",
	pll_dsm_out_sel => "1st_order",
	pll_dsm_reset => "false",
	pll_ecn_bypass => "false",
	pll_ecn_test_en => "false",
	pll_enable => "true",
	pll_fbclk_mux_1 => "glb",
	pll_fbclk_mux_2 => "m_cnt",
	pll_fractional_carry_out => 32,
	pll_fractional_division => 1,
	pll_fractional_division_string => "1",
	pll_fractional_value_ready => "true",
	pll_lf_testen => "false",
	pll_lock_fltr_cfg => 25,
	pll_lock_fltr_test => "false",
	pll_m_cnt_bypass_en => "false",
	pll_m_cnt_coarse_dly => "0 ps",
	pll_m_cnt_fine_dly => "0 ps",
	pll_m_cnt_hi_div => 4,
	pll_m_cnt_in_src => "ph_mux_clk",
	pll_m_cnt_lo_div => 4,
	pll_m_cnt_odd_div_duty_en => "false",
	pll_m_cnt_ph_mux_prst => 0,
	pll_m_cnt_prst => 1,
	pll_n_cnt_bypass_en => "true",
	pll_n_cnt_coarse_dly => "0 ps",
	pll_n_cnt_fine_dly => "0 ps",
	pll_n_cnt_hi_div => 256,
	pll_n_cnt_lo_div => 256,
	pll_n_cnt_odd_div_duty_en => "false",
	pll_ref_buf_dly => "0 ps",
	pll_reg_boost => 0,
	pll_regulator_bypass => "false",
	pll_ripplecap_ctrl => 0,
	pll_slf_rst => "false",
	pll_tclk_mux_en => "false",
	pll_tclk_sel => "n_src",
	pll_test_enable => "false",
	pll_testdn_enable => "false",
	pll_testup_enable => "false",
	pll_unlock_fltr_cfg => 2,
	pll_vco_div => 2,
	pll_vco_ph0_en => "true",
	pll_vco_ph1_en => "true",
	pll_vco_ph2_en => "true",
	pll_vco_ph3_en => "true",
	pll_vco_ph4_en => "true",
	pll_vco_ph5_en => "true",
	pll_vco_ph6_en => "true",
	pll_vco_ph7_en => "true",
	pll_vctrl_test_voltage => 750,
	reference_clock_frequency => "50.0 mhz",
	vccd0g_atb => "disable",
	vccd0g_output => 0,
	vccd1g_atb => "disable",
	vccd1g_output => 0,
	vccm1g_tap => 2,
	vccr_pd => "false",
	vcodiv_override => "false",
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	coreclkfb => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fboutclk_wire\(0),
	ecnc1test => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|refclk_select_extswitchbuf_wire\,
	ecnc2test => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|up_dn~combout\,
	fbclkfpll => GND,
	lvdsfbin => GND,
	pfden => VCC,
	refclkin => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|refclk_select_clkout_wire\,
	shift => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|shift\,
	shiftdonein => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|shift\,
	shiften => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|pll_reconfig_shiftenm_wire\,
	up => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|pll_reconfig_up_wire\,
	zdb => GND,
	cntnen => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|cntnen\,
	fbclk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fboutclk_wire\(0),
	tclk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|tclk\,
	vcoph => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_VCOPH_bus\,
	mhi => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|fpll_MHI_bus_1\);

-- Location: PLLRECONFIG_X0_Y19_N0
\comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG\ : cyclonev_pll_reconfig
-- pragma translate_off
GENERIC MAP (
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	cntnen => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|cntnen\,
	iocsrclkin => GND,
	iocsrdatain => GND,
	mdiodis => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_mdio_dis~combout\,
	phaseen => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|phase_en~combout\,
	read => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|lcell_dprio_read|combout\,
	sershiftload => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_ser_shift_load~combout\,
	shiftdonei => GND,
	updn => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|up_dn~combout\,
	write => \comb_4|pll_reconfig_0|NM28_reconfig.reconfig_core.altera_pll_reconfig_core_inst0|dprio_write~combout\,
	din => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_DIN_bus\,
	addr => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_ADDR_bus\,
	byteen => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_BYTEEN_bus\,
	cntsel => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_CNTSEL_bus\,
	mhi => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_MHI_bus\,
	blockselect => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|blockselect\,
	shift => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|shift\,
	shiftenm => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|pll_reconfig_shiftenm_wire\,
	up => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|pll_reconfig_up_wire\,
	shiften => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|PLL_RECONFIG_SHIFTEN_bus\);

-- Location: PLLOUTPUTCOUNTER_X0_Y20_N1
\comb_4|pll_0|altera_pll_i|cyclonev_pll|counter[0].output_counter\ : cyclonev_pll_output_counter
-- pragma translate_off
GENERIC MAP (
	c_cnt_coarse_dly => "0 ps",
	c_cnt_fine_dly => "0 ps",
	c_cnt_in_src => "ph_mux_clk",
	c_cnt_ph_mux_prst => 0,
	c_cnt_prst => 3,
	cnt_fpll_src => "fpll_0",
	dprio0_cnt_bypass_en => "false",
	dprio0_cnt_hi_div => 4,
	dprio0_cnt_lo_div => 4,
	dprio0_cnt_odd_div_even_duty_en => "false",
	duty_cycle => 50,
	output_clock_frequency => "50.0 mhz",
	phase_shift => "5000 ps",
  fractional_pll_index => 0,
  output_counter_index => 6)
-- pragma translate_on
PORT MAP (
	cascadein => GND,
	nen0 => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|cntnen\,
	shift0 => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|shift\,
	shiften => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|shiften\(6),
	tclk0 => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|tclk\,
	up0 => \comb_4|pll_0|altera_pll_i|cyclonev_pll|fpll_0|pll_reconfig_up_wire\,
	vco0ph => \comb_4|pll_0|altera_pll_i|cyclonev_pll|counter[0].output_counter_VCO0PH_bus\,
	cascadeout => \comb_4|pll_0|altera_pll_i|cyclonev_pll|cascade_wire\(0),
	divclk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk\(0));

-- Location: CLKCTRL_G0
\comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk\(0),
	outclk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\);

-- Location: MLABCELL_X52_Y2_N33
\count_new[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \count_new[0]~0_combout\ = ( !count_new(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => ALT_INV_count_new(0),
	combout => \count_new[0]~0_combout\);

-- Location: FF_X52_Y2_N35
\count_new[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \count_new[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(0));

-- Location: MLABCELL_X52_Y2_N0
\Add1~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~97_sumout\ = SUM(( count_new(1) ) + ( count_new(0) ) + ( !VCC ))
-- \Add1~98\ = CARRY(( count_new(1) ) + ( count_new(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count_new(0),
	datad => ALT_INV_count_new(1),
	cin => GND,
	sumout => \Add1~97_sumout\,
	cout => \Add1~98\);

-- Location: FF_X52_Y2_N2
\count_new[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~97_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(1));

-- Location: MLABCELL_X52_Y2_N3
\Add1~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~93_sumout\ = SUM(( count_new(2) ) + ( GND ) + ( \Add1~98\ ))
-- \Add1~94\ = CARRY(( count_new(2) ) + ( GND ) + ( \Add1~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(2),
	cin => \Add1~98\,
	sumout => \Add1~93_sumout\,
	cout => \Add1~94\);

-- Location: FF_X52_Y2_N5
\count_new[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~93_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(2));

-- Location: MLABCELL_X52_Y2_N6
\Add1~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~89_sumout\ = SUM(( count_new(3) ) + ( GND ) + ( \Add1~94\ ))
-- \Add1~90\ = CARRY(( count_new(3) ) + ( GND ) + ( \Add1~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(3),
	cin => \Add1~94\,
	sumout => \Add1~89_sumout\,
	cout => \Add1~90\);

-- Location: FF_X52_Y2_N8
\count_new[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~89_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(3));

-- Location: MLABCELL_X52_Y2_N9
\Add1~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~85_sumout\ = SUM(( count_new(4) ) + ( GND ) + ( \Add1~90\ ))
-- \Add1~86\ = CARRY(( count_new(4) ) + ( GND ) + ( \Add1~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(4),
	cin => \Add1~90\,
	sumout => \Add1~85_sumout\,
	cout => \Add1~86\);

-- Location: FF_X52_Y2_N11
\count_new[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~85_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(4));

-- Location: MLABCELL_X52_Y2_N12
\Add1~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~81_sumout\ = SUM(( count_new(5) ) + ( GND ) + ( \Add1~86\ ))
-- \Add1~82\ = CARRY(( count_new(5) ) + ( GND ) + ( \Add1~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(5),
	cin => \Add1~86\,
	sumout => \Add1~81_sumout\,
	cout => \Add1~82\);

-- Location: FF_X52_Y2_N14
\count_new[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~81_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(5));

-- Location: MLABCELL_X52_Y2_N15
\Add1~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~77_sumout\ = SUM(( count_new(6) ) + ( GND ) + ( \Add1~82\ ))
-- \Add1~78\ = CARRY(( count_new(6) ) + ( GND ) + ( \Add1~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(6),
	cin => \Add1~82\,
	sumout => \Add1~77_sumout\,
	cout => \Add1~78\);

-- Location: FF_X52_Y2_N17
\count_new[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~77_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(6));

-- Location: MLABCELL_X52_Y2_N18
\Add1~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~73_sumout\ = SUM(( count_new(7) ) + ( GND ) + ( \Add1~78\ ))
-- \Add1~74\ = CARRY(( count_new(7) ) + ( GND ) + ( \Add1~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(7),
	cin => \Add1~78\,
	sumout => \Add1~73_sumout\,
	cout => \Add1~74\);

-- Location: FF_X52_Y2_N20
\count_new[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~73_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(7));

-- Location: MLABCELL_X52_Y2_N21
\Add1~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~69_sumout\ = SUM(( count_new(8) ) + ( GND ) + ( \Add1~74\ ))
-- \Add1~70\ = CARRY(( count_new(8) ) + ( GND ) + ( \Add1~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(8),
	cin => \Add1~74\,
	sumout => \Add1~69_sumout\,
	cout => \Add1~70\);

-- Location: FF_X52_Y2_N23
\count_new[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~69_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(8));

-- Location: MLABCELL_X52_Y2_N24
\Add1~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~65_sumout\ = SUM(( count_new(9) ) + ( GND ) + ( \Add1~70\ ))
-- \Add1~66\ = CARRY(( count_new(9) ) + ( GND ) + ( \Add1~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(9),
	cin => \Add1~70\,
	sumout => \Add1~65_sumout\,
	cout => \Add1~66\);

-- Location: FF_X52_Y2_N26
\count_new[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~65_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(9));

-- Location: MLABCELL_X52_Y2_N27
\Add1~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~61_sumout\ = SUM(( count_new(10) ) + ( GND ) + ( \Add1~66\ ))
-- \Add1~62\ = CARRY(( count_new(10) ) + ( GND ) + ( \Add1~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(10),
	cin => \Add1~66\,
	sumout => \Add1~61_sumout\,
	cout => \Add1~62\);

-- Location: FF_X52_Y2_N29
\count_new[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~61_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(10));

-- Location: MLABCELL_X52_Y1_N0
\Add1~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~57_sumout\ = SUM(( count_new(11) ) + ( GND ) + ( \Add1~62\ ))
-- \Add1~58\ = CARRY(( count_new(11) ) + ( GND ) + ( \Add1~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(11),
	cin => \Add1~62\,
	sumout => \Add1~57_sumout\,
	cout => \Add1~58\);

-- Location: FF_X52_Y1_N2
\count_new[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~57_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(11));

-- Location: MLABCELL_X52_Y1_N3
\Add1~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~53_sumout\ = SUM(( count_new(12) ) + ( GND ) + ( \Add1~58\ ))
-- \Add1~54\ = CARRY(( count_new(12) ) + ( GND ) + ( \Add1~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(12),
	cin => \Add1~58\,
	sumout => \Add1~53_sumout\,
	cout => \Add1~54\);

-- Location: FF_X52_Y1_N5
\count_new[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~53_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(12));

-- Location: MLABCELL_X52_Y1_N6
\Add1~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~49_sumout\ = SUM(( count_new(13) ) + ( GND ) + ( \Add1~54\ ))
-- \Add1~50\ = CARRY(( count_new(13) ) + ( GND ) + ( \Add1~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(13),
	cin => \Add1~54\,
	sumout => \Add1~49_sumout\,
	cout => \Add1~50\);

-- Location: FF_X52_Y1_N8
\count_new[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~49_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(13));

-- Location: MLABCELL_X52_Y1_N9
\Add1~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~45_sumout\ = SUM(( count_new(14) ) + ( GND ) + ( \Add1~50\ ))
-- \Add1~46\ = CARRY(( count_new(14) ) + ( GND ) + ( \Add1~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(14),
	cin => \Add1~50\,
	sumout => \Add1~45_sumout\,
	cout => \Add1~46\);

-- Location: FF_X52_Y1_N11
\count_new[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~45_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(14));

-- Location: MLABCELL_X52_Y1_N12
\Add1~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~41_sumout\ = SUM(( count_new(15) ) + ( GND ) + ( \Add1~46\ ))
-- \Add1~42\ = CARRY(( count_new(15) ) + ( GND ) + ( \Add1~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(15),
	cin => \Add1~46\,
	sumout => \Add1~41_sumout\,
	cout => \Add1~42\);

-- Location: FF_X52_Y1_N14
\count_new[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~41_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(15));

-- Location: MLABCELL_X52_Y1_N15
\Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~37_sumout\ = SUM(( count_new(16) ) + ( GND ) + ( \Add1~42\ ))
-- \Add1~38\ = CARRY(( count_new(16) ) + ( GND ) + ( \Add1~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(16),
	cin => \Add1~42\,
	sumout => \Add1~37_sumout\,
	cout => \Add1~38\);

-- Location: FF_X52_Y1_N17
\count_new[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~37_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(16));

-- Location: MLABCELL_X52_Y1_N18
\Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~33_sumout\ = SUM(( count_new(17) ) + ( GND ) + ( \Add1~38\ ))
-- \Add1~34\ = CARRY(( count_new(17) ) + ( GND ) + ( \Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(17),
	cin => \Add1~38\,
	sumout => \Add1~33_sumout\,
	cout => \Add1~34\);

-- Location: FF_X52_Y1_N20
\count_new[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~33_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(17));

-- Location: MLABCELL_X52_Y1_N21
\Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~29_sumout\ = SUM(( count_new(18) ) + ( GND ) + ( \Add1~34\ ))
-- \Add1~30\ = CARRY(( count_new(18) ) + ( GND ) + ( \Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(18),
	cin => \Add1~34\,
	sumout => \Add1~29_sumout\,
	cout => \Add1~30\);

-- Location: FF_X52_Y1_N23
\count_new[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~29_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(18));

-- Location: MLABCELL_X52_Y1_N24
\Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~25_sumout\ = SUM(( count_new(19) ) + ( GND ) + ( \Add1~30\ ))
-- \Add1~26\ = CARRY(( count_new(19) ) + ( GND ) + ( \Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(19),
	cin => \Add1~30\,
	sumout => \Add1~25_sumout\,
	cout => \Add1~26\);

-- Location: FF_X52_Y1_N26
\count_new[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~25_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(19));

-- Location: MLABCELL_X52_Y1_N27
\Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~21_sumout\ = SUM(( count_new(20) ) + ( GND ) + ( \Add1~26\ ))
-- \Add1~22\ = CARRY(( count_new(20) ) + ( GND ) + ( \Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(20),
	cin => \Add1~26\,
	sumout => \Add1~21_sumout\,
	cout => \Add1~22\);

-- Location: FF_X52_Y1_N29
\count_new[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~21_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(20));

-- Location: MLABCELL_X52_Y1_N30
\Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( count_new(21) ) + ( GND ) + ( \Add1~22\ ))
-- \Add1~18\ = CARRY(( count_new(21) ) + ( GND ) + ( \Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(21),
	cin => \Add1~22\,
	sumout => \Add1~17_sumout\,
	cout => \Add1~18\);

-- Location: FF_X52_Y1_N32
\count_new[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(21));

-- Location: MLABCELL_X52_Y1_N33
\Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( count_new(22) ) + ( GND ) + ( \Add1~18\ ))
-- \Add1~14\ = CARRY(( count_new(22) ) + ( GND ) + ( \Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(22),
	cin => \Add1~18\,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\);

-- Location: FF_X52_Y1_N35
\count_new[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(22));

-- Location: MLABCELL_X52_Y1_N36
\Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( count_new(23) ) + ( GND ) + ( \Add1~14\ ))
-- \Add1~10\ = CARRY(( count_new(23) ) + ( GND ) + ( \Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(23),
	cin => \Add1~14\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\);

-- Location: FF_X52_Y1_N38
\count_new[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(23));

-- Location: MLABCELL_X52_Y1_N39
\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( count_new(24) ) + ( GND ) + ( \Add1~10\ ))
-- \Add1~6\ = CARRY(( count_new(24) ) + ( GND ) + ( \Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(24),
	cin => \Add1~10\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\);

-- Location: FF_X52_Y1_N41
\count_new[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(24));

-- Location: MLABCELL_X52_Y1_N42
\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( count_new(25) ) + ( GND ) + ( \Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_new(25),
	cin => \Add1~6\,
	sumout => \Add1~1_sumout\);

-- Location: FF_X52_Y1_N43
\count_new[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comb_4|pll_0|altera_pll_i|cyclonev_pll|divclk[0]~CLKENA0_outclk\,
	d => \Add1~1_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_new(25));

-- Location: LABCELL_X88_Y7_N0
\count_reg[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \count_reg[0]~0_combout\ = ( !count_reg(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => ALT_INV_count_reg(0),
	combout => \count_reg[0]~0_combout\);

-- Location: FF_X88_Y7_N2
\count_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \count_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(0));

-- Location: LABCELL_X88_Y7_N30
\Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~97_sumout\ = SUM(( count_reg(1) ) + ( count_reg(0) ) + ( !VCC ))
-- \Add0~98\ = CARRY(( count_reg(1) ) + ( count_reg(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count_reg(0),
	datad => ALT_INV_count_reg(1),
	cin => GND,
	sumout => \Add0~97_sumout\,
	cout => \Add0~98\);

-- Location: FF_X88_Y7_N32
\count_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~97_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(1));

-- Location: LABCELL_X88_Y7_N33
\Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~93_sumout\ = SUM(( count_reg(2) ) + ( GND ) + ( \Add0~98\ ))
-- \Add0~94\ = CARRY(( count_reg(2) ) + ( GND ) + ( \Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(2),
	cin => \Add0~98\,
	sumout => \Add0~93_sumout\,
	cout => \Add0~94\);

-- Location: FF_X88_Y7_N35
\count_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~93_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(2));

-- Location: LABCELL_X88_Y7_N36
\Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~89_sumout\ = SUM(( count_reg(3) ) + ( GND ) + ( \Add0~94\ ))
-- \Add0~90\ = CARRY(( count_reg(3) ) + ( GND ) + ( \Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(3),
	cin => \Add0~94\,
	sumout => \Add0~89_sumout\,
	cout => \Add0~90\);

-- Location: FF_X88_Y7_N38
\count_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~89_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(3));

-- Location: LABCELL_X88_Y7_N39
\Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~85_sumout\ = SUM(( count_reg(4) ) + ( GND ) + ( \Add0~90\ ))
-- \Add0~86\ = CARRY(( count_reg(4) ) + ( GND ) + ( \Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(4),
	cin => \Add0~90\,
	sumout => \Add0~85_sumout\,
	cout => \Add0~86\);

-- Location: FF_X88_Y7_N41
\count_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~85_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(4));

-- Location: LABCELL_X88_Y7_N42
\Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~81_sumout\ = SUM(( count_reg(5) ) + ( GND ) + ( \Add0~86\ ))
-- \Add0~82\ = CARRY(( count_reg(5) ) + ( GND ) + ( \Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(5),
	cin => \Add0~86\,
	sumout => \Add0~81_sumout\,
	cout => \Add0~82\);

-- Location: FF_X88_Y7_N44
\count_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~81_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(5));

-- Location: LABCELL_X88_Y7_N45
\Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~77_sumout\ = SUM(( count_reg(6) ) + ( GND ) + ( \Add0~82\ ))
-- \Add0~78\ = CARRY(( count_reg(6) ) + ( GND ) + ( \Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(6),
	cin => \Add0~82\,
	sumout => \Add0~77_sumout\,
	cout => \Add0~78\);

-- Location: FF_X88_Y7_N47
\count_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~77_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(6));

-- Location: LABCELL_X88_Y7_N48
\Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~73_sumout\ = SUM(( count_reg(7) ) + ( GND ) + ( \Add0~78\ ))
-- \Add0~74\ = CARRY(( count_reg(7) ) + ( GND ) + ( \Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(7),
	cin => \Add0~78\,
	sumout => \Add0~73_sumout\,
	cout => \Add0~74\);

-- Location: FF_X88_Y7_N50
\count_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~73_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(7));

-- Location: LABCELL_X88_Y7_N51
\Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~69_sumout\ = SUM(( count_reg(8) ) + ( GND ) + ( \Add0~74\ ))
-- \Add0~70\ = CARRY(( count_reg(8) ) + ( GND ) + ( \Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(8),
	cin => \Add0~74\,
	sumout => \Add0~69_sumout\,
	cout => \Add0~70\);

-- Location: FF_X88_Y7_N53
\count_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~69_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(8));

-- Location: LABCELL_X88_Y7_N54
\Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~65_sumout\ = SUM(( count_reg(9) ) + ( GND ) + ( \Add0~70\ ))
-- \Add0~66\ = CARRY(( count_reg(9) ) + ( GND ) + ( \Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(9),
	cin => \Add0~70\,
	sumout => \Add0~65_sumout\,
	cout => \Add0~66\);

-- Location: FF_X88_Y7_N56
\count_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~65_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(9));

-- Location: LABCELL_X88_Y7_N57
\Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~61_sumout\ = SUM(( count_reg(10) ) + ( GND ) + ( \Add0~66\ ))
-- \Add0~62\ = CARRY(( count_reg(10) ) + ( GND ) + ( \Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(10),
	cin => \Add0~66\,
	sumout => \Add0~61_sumout\,
	cout => \Add0~62\);

-- Location: FF_X88_Y7_N59
\count_reg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~61_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(10));

-- Location: LABCELL_X88_Y6_N0
\Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~57_sumout\ = SUM(( count_reg(11) ) + ( GND ) + ( \Add0~62\ ))
-- \Add0~58\ = CARRY(( count_reg(11) ) + ( GND ) + ( \Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(11),
	cin => \Add0~62\,
	sumout => \Add0~57_sumout\,
	cout => \Add0~58\);

-- Location: FF_X88_Y6_N2
\count_reg[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~57_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(11));

-- Location: LABCELL_X88_Y6_N3
\Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~53_sumout\ = SUM(( count_reg(12) ) + ( GND ) + ( \Add0~58\ ))
-- \Add0~54\ = CARRY(( count_reg(12) ) + ( GND ) + ( \Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(12),
	cin => \Add0~58\,
	sumout => \Add0~53_sumout\,
	cout => \Add0~54\);

-- Location: FF_X88_Y6_N5
\count_reg[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~53_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(12));

-- Location: LABCELL_X88_Y6_N6
\Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~49_sumout\ = SUM(( count_reg(13) ) + ( GND ) + ( \Add0~54\ ))
-- \Add0~50\ = CARRY(( count_reg(13) ) + ( GND ) + ( \Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(13),
	cin => \Add0~54\,
	sumout => \Add0~49_sumout\,
	cout => \Add0~50\);

-- Location: FF_X88_Y6_N8
\count_reg[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~49_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(13));

-- Location: LABCELL_X88_Y6_N9
\Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~45_sumout\ = SUM(( count_reg(14) ) + ( GND ) + ( \Add0~50\ ))
-- \Add0~46\ = CARRY(( count_reg(14) ) + ( GND ) + ( \Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(14),
	cin => \Add0~50\,
	sumout => \Add0~45_sumout\,
	cout => \Add0~46\);

-- Location: FF_X88_Y6_N11
\count_reg[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~45_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(14));

-- Location: LABCELL_X88_Y6_N12
\Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~41_sumout\ = SUM(( count_reg(15) ) + ( GND ) + ( \Add0~46\ ))
-- \Add0~42\ = CARRY(( count_reg(15) ) + ( GND ) + ( \Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(15),
	cin => \Add0~46\,
	sumout => \Add0~41_sumout\,
	cout => \Add0~42\);

-- Location: FF_X88_Y6_N14
\count_reg[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~41_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(15));

-- Location: LABCELL_X88_Y6_N15
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( count_reg(16) ) + ( GND ) + ( \Add0~42\ ))
-- \Add0~38\ = CARRY(( count_reg(16) ) + ( GND ) + ( \Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(16),
	cin => \Add0~42\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\);

-- Location: FF_X88_Y6_N17
\count_reg[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~37_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(16));

-- Location: LABCELL_X88_Y6_N18
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( count_reg(17) ) + ( GND ) + ( \Add0~38\ ))
-- \Add0~34\ = CARRY(( count_reg(17) ) + ( GND ) + ( \Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(17),
	cin => \Add0~38\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

-- Location: FF_X88_Y6_N20
\count_reg[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~33_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(17));

-- Location: LABCELL_X88_Y6_N21
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( count_reg(18) ) + ( GND ) + ( \Add0~34\ ))
-- \Add0~30\ = CARRY(( count_reg(18) ) + ( GND ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(18),
	cin => \Add0~34\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: FF_X88_Y6_N23
\count_reg[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~29_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(18));

-- Location: LABCELL_X88_Y6_N24
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( count_reg(19) ) + ( GND ) + ( \Add0~30\ ))
-- \Add0~26\ = CARRY(( count_reg(19) ) + ( GND ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(19),
	cin => \Add0~30\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X88_Y6_N26
\count_reg[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~25_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(19));

-- Location: LABCELL_X88_Y6_N27
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( count_reg(20) ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~22\ = CARRY(( count_reg(20) ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(20),
	cin => \Add0~26\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X88_Y6_N29
\count_reg[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~21_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(20));

-- Location: LABCELL_X88_Y6_N30
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( count_reg(21) ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~18\ = CARRY(( count_reg(21) ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(21),
	cin => \Add0~22\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X88_Y6_N32
\count_reg[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(21));

-- Location: LABCELL_X88_Y6_N33
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( count_reg(22) ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~14\ = CARRY(( count_reg(22) ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(22),
	cin => \Add0~18\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X88_Y6_N35
\count_reg[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(22));

-- Location: LABCELL_X88_Y6_N36
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( count_reg(23) ) + ( GND ) + ( \Add0~14\ ))
-- \Add0~10\ = CARRY(( count_reg(23) ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(23),
	cin => \Add0~14\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: FF_X88_Y6_N38
\count_reg[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(23));

-- Location: LABCELL_X88_Y6_N39
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( count_reg(24) ) + ( GND ) + ( \Add0~10\ ))
-- \Add0~6\ = CARRY(( count_reg(24) ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(24),
	cin => \Add0~10\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: FF_X88_Y6_N41
\count_reg[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(24));

-- Location: LABCELL_X88_Y6_N42
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( count_reg(25) ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_reg(25),
	cin => \Add0~6\,
	sumout => \Add0~1_sumout\);

-- Location: FF_X88_Y6_N43
\count_reg[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~1_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_reg(25));


pll_reconfig_inst_tasks : altera_pll_reconfig_tasks
-- pragma translate_off
GENERIC MAP (
      number_of_fplls => 1);
-- pragma translate_on
END structure;


