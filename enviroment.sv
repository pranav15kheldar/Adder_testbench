/* Created A enviroment class include all lower files and module such as transaction , driver , generator 
In enviroment class there is handle of interface (virtual) , and handle of all (driver , gene, monitor , scoreboard) , all mailbox */
// `include "transaction.sv"
// `include "generator.sv"
// `include "driver.sv"

class enviroment;
    mailbox gen2driver;
    mailbox moni2Score;
    scoreboard score;
    monitor moni;
    driver driv;
    generator gen;
    transaction transc;
    virtual inf_adder vir_inf_adder;

    function new (virtual inf_adder vir_inf_adder);
        this.vir_inf_adder = vir_inf_adder;
        gen2driver = new();
        moni2Score = new();
        score = new(vir_inf_adder , moni2Score);
        moni = new(vir_inf_adder , moni2Score);
        driv = new(gen2driver , vir_inf_adder);
        gen = new(gen2driver);
        transc = new();
    endfunction

    task run();
        fork 
            gen.main();
            driv.main();
            moni.main();
            score.main();
        join
    endtask
endclass