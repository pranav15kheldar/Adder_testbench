module full_adder (sum, carry, a, b, c);
  
  input a, b, c;
  output sum, carry;
  
  wire c1, c2, c3;
  
  xor x1 (sum, a, b, c);
  
  and a1 (c1, a, b);
  and a2 (c2, b, c);
  and a3 (c3, c, a);
  
  or o1 (carry, c1, c2, c3);
  
  
  //assign sum = (a ^ b ^ c);
  //assign carry = ((a & b) | (b & c) | (c & a));
  
endmodule
/*
module ripple_carry_adder ();
  end
*/