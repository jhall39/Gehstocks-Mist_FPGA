library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity rom_char_u is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of rom_char_u is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"38",X"7C",X"86",X"82",X"C2",X"7C",X"38",X"00",X"00",X"02",X"42",X"FE",X"FE",X"02",X"02",
		X"00",X"46",X"CE",X"9E",X"9A",X"BA",X"F2",X"62",X"00",X"04",X"86",X"92",X"B2",X"F2",X"DE",X"8C",
		X"00",X"18",X"38",X"68",X"C8",X"FE",X"FE",X"08",X"00",X"E4",X"E6",X"A2",X"A2",X"A2",X"BE",X"1C",
		X"00",X"3C",X"7E",X"D2",X"92",X"92",X"9E",X"0C",X"00",X"C0",X"C0",X"8E",X"9E",X"B0",X"E0",X"C0",
		X"00",X"6C",X"F2",X"B2",X"9A",X"9A",X"6E",X"0C",X"00",X"60",X"F2",X"92",X"92",X"96",X"FC",X"78",
		X"00",X"3E",X"7E",X"C8",X"88",X"C8",X"7E",X"3E",X"00",X"FE",X"FE",X"92",X"92",X"92",X"FE",X"6C",
		X"00",X"38",X"7C",X"C6",X"82",X"82",X"C6",X"44",X"00",X"FE",X"FE",X"82",X"82",X"C6",X"7C",X"38",
		X"00",X"00",X"FE",X"FE",X"92",X"92",X"92",X"82",X"00",X"FE",X"FE",X"90",X"90",X"90",X"90",X"80",
		X"00",X"38",X"7C",X"C6",X"82",X"92",X"9E",X"9E",X"00",X"FE",X"FE",X"10",X"10",X"10",X"FE",X"FE",
		X"00",X"00",X"82",X"82",X"FE",X"FE",X"82",X"82",X"00",X"04",X"06",X"02",X"02",X"02",X"FE",X"FC",
		X"00",X"FE",X"FE",X"18",X"3C",X"6E",X"C6",X"82",X"00",X"00",X"FE",X"FE",X"02",X"02",X"02",X"02",
		X"00",X"FE",X"FE",X"70",X"38",X"70",X"FE",X"FE",X"00",X"FE",X"FE",X"70",X"38",X"1C",X"FE",X"FE",
		X"00",X"7C",X"FE",X"82",X"82",X"82",X"FE",X"7C",X"00",X"FE",X"FE",X"88",X"88",X"88",X"F8",X"70",
		X"00",X"7C",X"FE",X"82",X"8A",X"8E",X"FC",X"7A",X"00",X"FE",X"FE",X"88",X"8C",X"9E",X"F6",X"72",
		X"00",X"64",X"F6",X"92",X"92",X"D2",X"5E",X"0C",X"00",X"00",X"80",X"80",X"FE",X"FE",X"80",X"80",
		X"00",X"FC",X"FE",X"02",X"02",X"02",X"FE",X"FC",X"00",X"F0",X"F8",X"1C",X"0E",X"1C",X"F8",X"F0",
		X"00",X"F8",X"FE",X"1C",X"38",X"1C",X"FE",X"F8",X"00",X"C6",X"EE",X"7C",X"38",X"7C",X"EE",X"C6",
		X"00",X"00",X"C0",X"F0",X"1E",X"1E",X"F0",X"C0",X"00",X"86",X"8E",X"9E",X"BA",X"F2",X"E2",X"C2",
		X"00",X"00",X"6C",X"92",X"92",X"6A",X"04",X"0A",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"4E",X"CA",X"8E",X"82",X"C6",X"FE",X"7C",X"00",X"60",X"E0",X"80",X"9A",X"BA",X"E0",X"60",
		X"00",X"00",X"02",X"78",X"F0",X"E0",X"00",X"00",X"00",X"60",X"F0",X"F8",X"7C",X"F8",X"F0",X"60",
		X"00",X"00",X"0C",X"0C",X"0C",X"0C",X"0C",X"00",X"00",X"7E",X"48",X"48",X"36",X"00",X"7C",X"02",
		X"02",X"02",X"7C",X"00",X"7E",X"52",X"52",X"2C",X"00",X"00",X"00",X"00",X"06",X"06",X"00",X"00",
		X"00",X"00",X"00",X"00",X"0C",X"0E",X"00",X"00",X"3C",X"42",X"99",X"A5",X"A5",X"95",X"42",X"3C",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"00",
		X"C0",X"C0",X"00",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"00",
		X"00",X"00",X"00",X"C0",X"C0",X"C0",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"1F",X"1F",X"00",X"C0",X"C0",X"C0",X"C0",X"C0",X"1F",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",
		X"1F",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",X"FE",X"FE",X"00",X"00",X"00",X"00",X"00",X"00",
		X"DF",X"DF",X"00",X"00",X"00",X"00",X"00",X"00",X"FE",X"FE",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"E0",X"70",X"38",X"1C",X"0E",X"07",X"03",
		X"C0",X"C0",X"30",X"38",X"1C",X"0E",X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"07",X"0E",X"1C",X"38",X"70",
		X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"0E",X"1C",X"38",X"30",
		X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"08",X"38",X"20",X"27",
		X"00",X"00",X"00",X"FF",X"00",X"00",X"00",X"FF",X"00",X"00",X"00",X"E0",X"20",X"38",X"08",X"C8",
		X"27",X"27",X"20",X"38",X"08",X"0F",X"00",X"00",X"FF",X"FF",X"00",X"00",X"00",X"FF",X"00",X"00",
		X"00",X"FF",X"00",X"00",X"00",X"FF",X"00",X"00",X"48",X"C8",X"08",X"38",X"20",X"E0",X"00",X"00",
		X"48",X"48",X"48",X"48",X"48",X"48",X"48",X"48",X"27",X"24",X"24",X"24",X"24",X"24",X"24",X"24",
		X"24",X"24",X"24",X"24",X"24",X"24",X"24",X"24",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"22",X"14",X"08",X"14",X"22",X"00",X"00",X"7E",X"52",X"52",X"52",X"00",X"7E",X"30",
		X"18",X"0C",X"7E",X"00",X"7E",X"42",X"66",X"3C",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"60",X"00",X"00",X"80",X"84",X"50",X"00",X"00",
		X"70",X"60",X"00",X"00",X"00",X"00",X"80",X"00",X"18",X"F8",X"F8",X"70",X"00",X"00",X"00",X"00",
		X"02",X"90",X"F4",X"E8",X"70",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"76",X"F6",X"C0",X"80",X"00",X"00",X"00",X"00",X"FD",X"F0",X"FE",X"FF",X"FE",X"1C",X"3C",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"20",X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"1C",X"1C",X"1F",X"0F",X"07",X"00",X"00",X"00",X"1C",X"1C",X"1F",X"0F",X"07",X"00",X"00",X"00",
		X"01",X"1F",X"47",X"00",X"01",X"00",X"06",X"00",X"01",X"1F",X"47",X"00",X"01",X"00",X"06",X"00",
		X"00",X"00",X"00",X"00",X"07",X"0B",X"17",X"04",X"00",X"00",X"00",X"00",X"07",X"0B",X"17",X"04",
		X"00",X"00",X"00",X"00",X"07",X"0B",X"17",X"04",X"00",X"00",X"00",X"00",X"07",X"0B",X"17",X"04",
		X"0C",X"10",X"00",X"10",X"00",X"08",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"0F",
		X"00",X"00",X"00",X"08",X"00",X"04",X"80",X"84",X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"0F",
		X"07",X"0E",X"0E",X"0B",X"04",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",
		X"00",X"00",X"80",X"20",X"10",X"68",X"38",X"38",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",
		X"03",X"07",X"07",X"07",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"05",X"10",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"E0",X"F0",X"70",X"70",X"00",X"00",X"00",X"05",X"10",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"1E",X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"1E",
		X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"1E",X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"1E",
		X"00",X"00",X"00",X"00",X"04",X"00",X"03",X"18",X"00",X"00",X"00",X"00",X"04",X"00",X"03",X"18",
		X"00",X"00",X"00",X"00",X"04",X"00",X"03",X"18",X"00",X"00",X"00",X"00",X"04",X"00",X"03",X"18",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"78",X"3E",X"FE",X"FF",X"00",X"00",X"00",X"00",X"78",X"3E",X"FE",X"FF",
		X"FF",X"00",X"0E",X"4C",X"C0",X"81",X"03",X"02",X"02",X"02",X"03",X"81",X"C0",X"4C",X"0E",X"00",
		X"FF",X"05",X"05",X"05",X"15",X"35",X"35",X"05",X"05",X"05",X"35",X"35",X"15",X"05",X"05",X"05",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"01",X"03",X"03",X"03",X"03",X"03",X"03",X"01",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"C0",X"C0",X"80",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"78",X"48",X"48",X"78",X"00",X"00",X"00",X"00",X"78",X"48",X"48",X"78",X"00",X"00",
		X"00",X"00",X"00",X"00",X"40",X"40",X"C0",X"C0",X"C0",X"C0",X"40",X"40",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"22",X"7E",X"02",X"00",X"3C",X"42",X"3C",X"00",X"22",X"7E",X"02",X"00",X"72",X"52",X"4C",
		X"00",X"26",X"4A",X"32",X"00",X"3C",X"42",X"3C",X"00",X"26",X"4A",X"32",X"00",X"72",X"52",X"4C",
		X"00",X"44",X"52",X"6C",X"00",X"3C",X"42",X"3C",X"00",X"44",X"52",X"6C",X"00",X"72",X"52",X"4C",
		X"00",X"1C",X"24",X"7E",X"00",X"3C",X"42",X"3C",X"00",X"1C",X"24",X"7E",X"00",X"72",X"52",X"4C",
		X"00",X"72",X"52",X"4C",X"00",X"3C",X"42",X"3C",X"00",X"72",X"52",X"4C",X"00",X"72",X"52",X"4C",
		X"00",X"3C",X"52",X"5C",X"00",X"3C",X"42",X"3C",X"00",X"3C",X"52",X"5C",X"00",X"72",X"52",X"4C",
		X"00",X"60",X"4E",X"70",X"00",X"3C",X"42",X"3C",X"00",X"60",X"4E",X"70",X"00",X"72",X"52",X"4C",
		X"00",X"2C",X"52",X"2C",X"00",X"3C",X"42",X"3C",X"00",X"2C",X"52",X"2C",X"00",X"72",X"52",X"4C",
		X"00",X"32",X"4A",X"3C",X"00",X"3C",X"42",X"3C",X"00",X"32",X"4A",X"3C",X"00",X"72",X"52",X"4C",
		X"00",X"3C",X"42",X"3C",X"00",X"3C",X"42",X"3C",X"00",X"3C",X"42",X"3C",X"00",X"3C",X"42",X"3C",
		X"00",X"0A",X"04",X"0A",X"00",X"26",X"4A",X"32",X"00",X"0A",X"04",X"0A",X"00",X"44",X"52",X"6C",
		X"00",X"0A",X"04",X"0A",X"00",X"1C",X"24",X"7E",X"00",X"0A",X"04",X"0A",X"00",X"72",X"52",X"4C",
		X"00",X"0A",X"04",X"0A",X"00",X"3C",X"52",X"5C",X"00",X"0A",X"04",X"0A",X"00",X"60",X"4E",X"70",
		X"00",X"0A",X"04",X"0A",X"00",X"2C",X"52",X"2C",X"00",X"78",X"FC",X"3E",X"3E",X"3E",X"FC",X"FC",
		X"FC",X"FC",X"3E",X"3E",X"3E",X"FC",X"78",X"00",X"00",X"00",X"01",X"02",X"06",X"06",X"0F",X"0F",
		X"0F",X"0F",X"06",X"06",X"02",X"01",X"00",X"00",X"05",X"05",X"05",X"05",X"05",X"05",X"05",X"05",
		X"FF",X"05",X"05",X"05",X"05",X"05",X"05",X"05",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"1E",
		X"00",X"00",X"00",X"00",X"04",X"00",X"03",X"18",X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"1E",
		X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"1E",X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"1E",
		X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"1E",X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"1E",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"07",X"07",X"07",X"03",
		X"7F",X"FF",X"FF",X"FF",X"FF",X"FC",X"F0",X"C0",X"FC",X"FC",X"F0",X"C0",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"07",X"1F",
		X"0F",X"03",X"07",X"1F",X"7E",X"FC",X"FC",X"FC",X"FE",X"FF",X"FF",X"FF",X"3E",X"3C",X"30",X"40",
		X"07",X"07",X"07",X"03",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"1F",X"03",X"00",
		X"FF",X"FE",X"FC",X"FF",X"FF",X"FF",X"FF",X"7F",X"80",X"00",X"00",X"00",X"C0",X"F0",X"FC",X"FE",
		X"FC",X"FE",X"FF",X"7F",X"7F",X"3F",X"1F",X"0F",X"00",X"00",X"01",X"C7",X"FF",X"FF",X"FF",X"FF",
		X"1F",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"FC",X"FC",X"F8",X"F8",X"F0",X"E0",
		X"01",X"01",X"01",X"01",X"01",X"01",X"01",X"01",X"FC",X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",X"FC",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"07",X"FE",X"7E",X"7E",X"7E",X"7E",X"7E",X"FF",X"FF",
		X"1F",X"1F",X"0F",X"07",X"01",X"00",X"00",X"01",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FB",X"E1",X"00",
		X"E0",X"F0",X"F8",X"F8",X"FC",X"FC",X"FC",X"FE",X"FC",X"FC",X"FC",X"FE",X"7E",X"7F",X"3F",X"3F",
		X"00",X"00",X"00",X"00",X"00",X"01",X"87",X"CF",X"00",X"00",X"00",X"0F",X"7F",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"C1",X"F9",X"FF",X"FF",X"FF",X"FF",X"FE",X"FE",X"FC",X"FC",X"F8",X"F8",X"F0",
		X"3F",X"7F",X"FF",X"FF",X"FF",X"FF",X"FE",X"FC",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"3F",X"07",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FC",X"E0",X"FE",X"FC",X"F8",X"F0",X"C0",X"00",X"00",X"00",
		X"3F",X"3F",X"3F",X"3F",X"7F",X"7F",X"7F",X"7F",X"30",X"30",X"38",X"38",X"1C",X"1E",X"1F",X"0F",
		X"00",X"00",X"00",X"00",X"01",X"1F",X"FF",X"FF",X"00",X"00",X"00",X"0F",X"FF",X"FF",X"FF",X"FF",
		X"03",X"07",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FC",X"FE",X"FE",X"FF",X"FF",X"FF",X"FF",X"3F",
		X"C0",X"E0",X"E0",X"60",X"60",X"60",X"70",X"70",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",
		X"70",X"70",X"F0",X"F0",X"E0",X"E0",X"E0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"70",X"70",X"70",X"70",X"70",X"70",X"70",X"70",X"30",X"70",X"70",X"60",X"60",X"60",X"E0",X"E0",
		X"07",X"03",X"03",X"01",X"01",X"00",X"00",X"00",X"E0",X"E0",X"E0",X"E0",X"F0",X"F0",X"F0",X"F0",
		X"1F",X"1F",X"1F",X"1F",X"1F",X"3F",X"38",X"38",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"78",X"00",
		X"FF",X"FF",X"F3",X"E0",X"C0",X"00",X"00",X"00",X"FE",X"FE",X"FF",X"FF",X"7F",X"1F",X"0F",X"0F",
		X"3E",X"1C",X"00",X"80",X"80",X"C0",X"C0",X"C0",X"FC",X"FE",X"FE",X"7F",X"7F",X"7F",X"3F",X"3F",
		X"00",X"00",X"1F",X"7F",X"FF",X"FF",X"FF",X"FF",X"3F",X"3F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"9F",X"E7",X"F9",X"FC",X"F0",X"F8",X"FE",X"FE",X"FF",X"FF",X"FF",X"7F",
		X"7F",X"7F",X"7F",X"FF",X"FE",X"FC",X"FC",X"FC",X"FF",X"FF",X"FB",X"C0",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"3F",X"1F",X"1F",X"1F",X"FF",X"FF",X"FF",X"FC",X"F0",X"80",X"F8",X"FF",
		X"E0",X"C0",X"00",X"00",X"00",X"00",X"00",X"80",X"01",X"01",X"00",X"00",X"00",X"01",X"0F",X"7F",
		X"F8",X"F8",X"FC",X"FD",X"FF",X"FF",X"FF",X"FF",X"00",X"01",X"1F",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"3F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"FC",X"F8",X"F0",X"F0",X"E0",
		X"00",X"00",X"01",X"01",X"01",X"01",X"01",X"01",X"FC",X"FC",X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",
		X"3F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"E3",X"01",X"01",X"00",X"00",X"00",X"00",X"07",
		X"F8",X"FC",X"FC",X"FC",X"FC",X"FC",X"FE",X"FF",X"3F",X"3F",X"1F",X"3F",X"3F",X"7F",X"7F",X"FE",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"F8",X"F0",X"F0",X"E0",X"E0",X"F0",X"F0",X"F8",X"3F",X"7F",X"7E",X"7E",X"7E",X"7E",X"7F",X"3F",
		X"00",X"00",X"00",X"00",X"00",X"00",X"3F",X"FF",X"FF",X"0F",X"01",X"00",X"00",X"01",X"81",X"F3",
		X"FF",X"FF",X"FE",X"FE",X"FE",X"FC",X"FC",X"F8",X"03",X"07",X"0F",X"0F",X"1F",X"1F",X"3F",X"3F",
		X"F0",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"8F",X"00",X"00",X"F0",X"FC",X"FC",X"FE",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"30",X"3E",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"FC",X"FE",X"FE",X"7E",X"7F",X"7F",X"3F",X"3F",
		X"00",X"00",X"00",X"00",X"01",X"3F",X"FF",X"FF",X"00",X"00",X"00",X"0F",X"FF",X"FF",X"FF",X"FF",
		X"0F",X"0F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FC",X"FE",X"FE",X"FF",X"FF",X"FF",X"FF",X"BF",
		X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"0F",X"0F",X"07",X"07",X"07",X"07",X"07",X"07",
		X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"1F",X"3F",X"3F",X"3F",X"7F",X"7F",X"7E",X"FE",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"78",X"00",X"FF",X"FF",X"FF",X"E3",X"C0",X"00",X"00",X"00",
		X"FC",X"FE",X"FF",X"FF",X"FF",X"7F",X"3F",X"1F",X"1E",X"0C",X"00",X"80",X"80",X"C0",X"C0",X"E0",
		X"FC",X"FE",X"FE",X"7F",X"7F",X"7F",X"3F",X"3F",X"00",X"00",X"00",X"1F",X"FF",X"FF",X"FF",X"FF",
		X"3F",X"3F",X"3F",X"FF",X"FE",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"1F",X"87",X"E1",X"F8",
		X"F0",X"FC",X"FE",X"FE",X"FF",X"FF",X"FF",X"3F",X"7F",X"FF",X"FE",X"FE",X"7C",X"38",X"00",X"00",
		X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"0F",X"0F",X"1F",X"3F",X"3F",
		X"FC",X"F8",X"F8",X"F0",X"E0",X"E0",X"C0",X"80",X"7F",X"3F",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"3F",X"00",X"00",X"00",X"00",X"01",X"FE",X"FF",X"FF",X"7F",X"7F",X"FF",X"FE",X"FE",
		X"0F",X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"FB",X"FF",X"FF",X"FF",X"7F",X"7F",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"F8",X"F0",X"E0",X"C0",X"80",X"F8",X"FC",X"FE",
		X"3E",X"3E",X"3E",X"3F",X"3F",X"1F",X"1F",X"0F",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"E1",
		X"00",X"00",X"03",X"07",X"1F",X"3F",X"7F",X"FF",X"7F",X"FF",X"FF",X"FE",X"FE",X"FE",X"FC",X"FC",
		X"3F",X"1F",X"1F",X"0F",X"03",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"3F",X"3E",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FC",X"F0",X"00",X"FD",X"F8",X"F0",X"C0",X"00",X"00",X"00",X"00",
		X"FE",X"FE",X"7F",X"7F",X"3F",X"3F",X"3F",X"3F",X"07",X"0F",X"1F",X"1F",X"3F",X"3F",X"3F",X"3F",
		X"FE",X"FC",X"F8",X"E1",X"C3",X"87",X"8F",X"CF",X"1F",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"F7",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"F8",X"F8",X"F0",X"E0",X"F0",X"F8",X"FC",X"FC",
		X"07",X"07",X"03",X"01",X"00",X"00",X"01",X"03",X"E1",X"FF",X"FF",X"FF",X"FF",X"7F",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FC",X"80",X"FC",X"F8",X"F0",X"E0",X"C0",X"01",X"01",X"03",
		X"3F",X"7F",X"7E",X"FE",X"FE",X"FE",X"FC",X"FC",X"20",X"30",X"38",X"18",X"1C",X"1E",X"0F",X"0F",
		X"00",X"00",X"01",X"03",X"07",X"1F",X"3F",X"7F",X"3F",X"7F",X"FF",X"FF",X"FF",X"FF",X"FE",X"FE",
		X"FE",X"FF",X"FF",X"FF",X"7F",X"7F",X"3F",X"3F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"20",
		X"00",X"00",X"00",X"00",X"00",X"03",X"07",X"1F",X"00",X"20",X"20",X"60",X"E0",X"F8",X"FC",X"FE",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"7E",X"3C",X"00",X"00",X"00",X"00",X"00",X"00",
		X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"07",X"07",X"03",X"01",X"01",X"00",X"00",X"00",X"F0",X"F8",X"F8",X"FC",X"FC",X"FE",X"FE",X"7E",
		X"70",X"30",X"10",X"10",X"00",X"00",X"00",X"00",X"1F",X"0F",X"0F",X"0F",X"1F",X"18",X"30",X"20",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"7E",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"BF",X"1F",X"1F",X"0F",
		X"FC",X"FE",X"FF",X"FF",X"8F",X"C3",X"E1",X"E0",X"00",X"00",X"00",X"80",X"C0",X"C0",X"E0",X"E0",
		X"3F",X"3F",X"3F",X"3F",X"3F",X"3F",X"1F",X"1F",X"80",X"80",X"80",X"C0",X"DF",X"FF",X"FF",X"FF",
		X"FF",X"3F",X"1F",X"3F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"C1",X"80",X"80",X"C0",X"F0",
		X"F8",X"FE",X"FF",X"FF",X"FF",X"3E",X"1C",X"00",X"07",X"0F",X"1F",X"1F",X"1F",X"3F",X"3F",X"3F",
		X"FF",X"FF",X"FF",X"EF",X"C7",X"87",X"83",X"01",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"80",X"E0",X"F1",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"FE",X"FC",X"FC",X"F8",X"F0",X"F0",
		X"00",X"00",X"00",X"00",X"01",X"01",X"03",X"07",X"3F",X"7F",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"80",X"80",X"80",X"C0",X"E0",X"F8",X"FC",X"FF",X"FF",X"3F",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FE",X"FE",X"7F",X"7F",X"7F",X"7F",X"7F",X"7F",X"00",X"01",X"03",X"07",X"07",X"0F",X"0F",X"0F",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"E7",X"C3",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FE",X"FE",X"FC",X"FC",X"FE",X"FC",X"FC",X"FC",X"FC",X"FE",X"7F",X"7F",X"7F",
		X"07",X"03",X"03",X"01",X"00",X"F0",X"FC",X"FF",X"F0",X"F8",X"F8",X"FC",X"FE",X"FE",X"7F",X"7F",
		X"1F",X"3F",X"3F",X"7F",X"7F",X"7E",X"FE",X"FC",X"FE",X"FE",X"FF",X"3F",X"3F",X"1F",X"0F",X"0F",
		X"00",X"00",X"00",X"80",X"80",X"C0",X"E0",X"E0",X"00",X"00",X"00",X"01",X"03",X"07",X"0F",X"1F",
		X"00",X"00",X"E0",X"E0",X"F0",X"F8",X"F8",X"FC",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0E",X"38",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"70",X"30",X"38",X"38",X"1C",X"0E",X"07",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"00",X"40",X"40",X"60",X"E0",X"E0",X"C0",X"80",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"20",X"20",X"60",X"60",X"60",X"70",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"01",X"07",
		X"C6",X"F8",X"30",X"30",X"60",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"04",X"04",X"06",X"02",X"03",X"06",X"0E",X"0C",X"0C",X"18",X"10",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0E",X"06",X"07",X"07",X"07",X"07",X"07",X"07",X"60",X"60",X"40",X"40",X"40",X"40",X"00",X"00",
		X"00",X"00",X"00",X"00",X"08",X"08",X"0C",X"0E",X"00",X"03",X"0F",X"1E",X"38",X"70",X"70",X"60",
		X"00",X"00",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"60",X"60",X"70",X"30",X"30",X"10",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"70",X"60",X"60",X"60",X"60",X"60",X"60",X"60",
		X"00",X"00",X"00",X"0E",X"1C",X"18",X"38",X"30",X"01",X"01",X"01",X"01",X"00",X"00",X"00",X"00",
		X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"00",X"20",X"20",X"00",X"00",X"00",X"00",X"00",X"00",
		X"18",X"1C",X"0C",X"08",X"08",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"08",X"18",X"10",X"70",X"60",X"C0",X"C0",X"80",
		X"C0",X"E0",X"60",X"70",X"70",X"30",X"30",X"30",X"00",X"00",X"01",X"07",X"00",X"00",X"00",X"00",
		X"00",X"00",X"80",X"E0",X"F0",X"70",X"38",X"38",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;