module top_adder ();
    import adder ::*;
    inf_adder inf_test();
    test t;
    full_adder A1(
        .a(inf_test.a),
        .b(inf_test.b),
        .c(inf_test.c),
        .sum(inf_test.sum),
        .carry(inf_test.carry)
    );
    initial begin
       t = new(inf_test);
       t.test_run(); 
    end
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars();
        #100;
        $finish;
    end
endmodule