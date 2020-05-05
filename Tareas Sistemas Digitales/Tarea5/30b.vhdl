entity bit8Shift is
    port(
        x: in bit_vector(7 downto 0);
        s: in bit_vector(1 downto 0);
        rsd,lsd,clrb,clk: in bit;
        y: inout bit_vector(7 downto 0)
    );
end bit8Shift;
architecture test of bit8Shift is
    component shift74194 is
        port(
        d: in bit_vector(3 downto 0);
        s: in bit_vector(1 downto 0);
        sdr,sdl,clrb,clk: in bit;
        q: in out bit_vector(3 downto 0)
        );
    end component;
begin
    shift0: shift74194(x(3 downto 0), s, y(4), lsd, clrb, clk, y(3 downto 0));
    shift0: shift74194(x(7 downto 4), s, rsd, lsd, clrb, clk, y(7 downto 4));
end test;