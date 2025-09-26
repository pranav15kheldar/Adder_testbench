// `include "enviroment.sv"
class test;
    virtual inf_adder test_inf;
    enviroment env;
    function  new(virtual inf_adder test_inf);
        this.test_inf = test_inf;
        env = new(test_inf);
    endfunction

    task test_run();
        fork
            env.run();
        join
    endtask
endclass