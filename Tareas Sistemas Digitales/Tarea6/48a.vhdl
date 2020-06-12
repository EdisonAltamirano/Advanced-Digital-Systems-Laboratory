process(A)
    variable Max:integer;
    begin
        Max := A(1);
        for i in 2 to 20 loop
            if A(i) > Max then
                Max := A(i);
            end if;
        end loop;
    end process;


process(A)
    variable Max, i: integer;
    begin
        Max := A(1);
        i := 2;
        while i <= 20 loop
            if A(i) > Max then
                Max := A(i);
            end if;
            i := i + 1;
        end loop;
    end process;