/* Created A enviroment class include all lower files and module such as transaction , driver , generator 
In enviroment class there is handle of interface (virtual) , and handle of all (driver , gene, monitor , scoreboard) , all mailbox */
`include "transaction.sv"
`include "driver.sv"
`include "generator.sv"

class env;
    mailbox gen2driver;
    driver driv;
    generator gen;
    transaction transc;
    virtual inf_adder vir_inf_adder;

    function new (virtual inf_adder vir_inf_adder);
        this.vir_inf_adder = vir_inf_adder;
        gen2driver = new();
        driv = new(gen2driver , vir_inf_adder);
        gen = new(gen2driver);
        transc = new();
    endfunction

    task run();
        fork
            gen.main();
            driv.main();
        join
    endtask
endclass