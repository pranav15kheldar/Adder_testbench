class monitor;
    transaction transc;
    mailbox moni2Score;
    virtual inf_adder vir_inf_adder;

    function  new(virtual inf_adder vir_inf_adder , mailbox moni2Score);
        this.moni2Score = moni2Score;
        this.vir_inf_adder = vir_inf_adder;
    endfunction

    task main();
        repeat(7) begin
            transc = new();
            transc.a = vir_inf_adder.a;
            transc.b = vir_inf_adder.b;
            transc.c = vir_inf_adder.c;
            transc.sum = vir_inf_adder.sum;
            transc.carry = vir_inf_adder.carry;
            moni2Score.put(transc);
            $display("*****************Output in Monitor ********************\n A = %0d , B = %0d , C = %0d sum = %0d , Carry = %0d" , transc.a , transc.b , transc.c , transc.sum , transc.carry);
        end
    endtask
endclass