/* In Generator class we randomize input signal and send it to driver using mailbox */
class generator;
    transaction transc; //Handle of transaction class
    mailbox gen2driver; // Mailbox to transfer data from generator to driver
    function new (mailbox gen2driver);
    /* we Pass mailbox as argument to new so that it can communicate with driver if not done such mailbox will not visible to driver 
    --> WE pass it as argument of new function because as soon as object is create it must know which mailbox to use for communication  */
        this.gen2driver = gen2driver; 
    endfunction
    task main();
        repeat(10) begin
            // @(posedge vir_inf_adder.clk);
            transc = new();
            transc.randomize();
            $display("Value of inputs in Generator \n time = %0t ,A =%0d , B = %0d , C = %0d " ,$time , transc.a , transc.b , transc.c);
            gen2driver.put(transc);
        end
        $display("====================================");
    endtask
endclass