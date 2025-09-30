class scoreboard;
    mailbox moni2Score;
    transaction transc;
    virtual inf_adder vir_inf_adder;
    function  new(virtual inf_adder vir_inf_adder ,mailbox moni2Score);
        this.moni2Score = moni2Score;
        this.vir_inf_adder = vir_inf_adder;
    endfunction
    
    task main();
       forever begin
            @(posedge vir_inf_adder.clk);
            moni2Score.get(transc);
           
            if (((transc.a ^ transc.b ^ transc.c) == transc.sum) && ((transc.a & transc.b) | (transc.b & transc.c) | (transc.a & transc.c)) == transc.carry) begin
                $display("###################TestPass#############################");
            end
            else begin
                $display("!!!!!!!!!!!!!!!!!!!!!!TestFail!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            end
            $display("----------------------- Transcation Complete ----------------------\n \n");
       end 
    endtask
endclass