module buffer (A, Y);
   input A;
   output Y;
endmodule

module inv (A, Y);
   input A;
   output Y;
endmodule

module nor2 (A, B, Y );
   input A, B;
   output Y;
endmodule

module or2 (A, B, Y );
   input A, B;
   output Y;
endmodule

module nand2 (A, B, Y );
   input A, B;
   output Y;
endmodule

module and2 (A, B, Y );
   input A, B;
   output Y;
endmodule


module xor2 (A, B, Y );
   input A, B;
   output Y;
endmodule

module or3 (A, B, C, Y );
   input A, B, C;
   output Y;
endmodule

module nor3 (A, B, C, Y );
   input A, B, C;
   output Y;
endmodule

module and3 (A, B, C, Y );
   input A, B, C;
   output Y;
endmodule

module nand3 (A, B, C, Y );
   input A, B, C;
   output Y;
endmodule

module or4 (A, B, C, D, Y );
   input A, B, C, D;
   output Y;
endmodule

module nor4 (A, B, C, D, Y );
   input A, B, C, D;
   output Y;
endmodule

module and4 (A, B, C, D, Y );
   input A, B, C, D;
   output Y;
endmodule

module nand4 (A, B, C, D, Y );
   input A, B, C, D;
   output Y;
endmodule

module or5 (A, B, C, D, E, Y );
   input A, B, C, D, E;
   output Y;
endmodule

module nor5 (A, B, C, D, E, Y );
   input A, B, C, D, E;
   output Y;
endmodule

module and5 (A, B, C, D, E, Y );
   input A, B, C, D, E;
   output Y;
endmodule

module nand5 (A, B, C, D, E, Y );
   input A, B, C, D, E;
   output Y;
endmodule

module or6 (A, B, C, D, E, F, Y );
   input A, B, C, D, E, F;
   output Y;
endmodule

module nor6 (A, B, C, D, E, F, Y );
   input A, B, C, D, E, F;
   output Y;
endmodule

module and6 (A, B, C, D, E, F, Y );
   input A, B, C, D, E, F;
   output Y;
endmodule

module nand6 (A, B, C, D, E, F, Y );
   input A, B, C, D, E, F;
   output Y;
endmodule

module or7 (A, B, C, D, E, F, G, Y );
   input A, B, C, D, E, F, G;
   output Y;
endmodule

module nor7 (A, B, C, D, E, F, G, Y );
   input A, B, C, D, E, F, G;
   output Y;
endmodule

module and7 (A, B, C, D, E, F, G, Y );
   input A, B, C, D, E, F, G;
   output Y;
endmodule

module nand7 (A, B, C, D, E, F, G, Y );
   input A, B, C, D, E, F, G;
   output Y;
endmodule

module or8 (A, B, C, D, E, F, G, H, Y );
   input A, B, C, D, E, F, G, H;
   output Y;
endmodule

module nor8 (A, B, C, D, E, F, G, H, Y );
   input A, B, C, D, E, F, G, H;
   output Y;
endmodule

module and8 (A, B, C, D, E, F, G, H, Y );
   input A, B, C, D, E, F, G, H;
   output Y;
endmodule

module nand8 (A, B, C, D, E, F, G, H, Y );
   input A, B, C, D, E, F, G, H;
   output Y;
endmodule

module or9 (A, B, C, D, E, F, G, H, I, Y );
   input A, B, C, D, E, F, G, H, I;
   output Y;
endmodule

module nor9 (A, B, C, D, E, F, G, H, I, Y );
   input A, B, C, D, E, F, G, H, I;
   output Y;
endmodule

module and9 (A, B, C, D, E, F, G, H, I, Y );
   input A, B, C, D, E, F, G, H, I;
   output Y;
endmodule

module nand9 (A, B, C, D, E, F, G, H, I, Y );
   input A, B, C, D, E, F, G, H, I;
   output Y;
endmodule

module not (Y, A );
   input A;
   output Y;
endmodule

module nor (Y, A, B );
   input A, B;
   output Y;
endmodule

module or (Y, A, B );
   input A, B;
   output Y;
endmodule

module nand (Y, A, B );
   input A, B;
   output Y;
endmodule

module and (Y, A, B );
   input A, B;
   output Y;
endmodule

module dff (D, CLK, Q);
    input D;
    input CLK;
    output Q; 

    // Internal wires for intermediate signals
    wire nD, nCLK, s1, s2, r1, r2, q1, nq1, qor1, qor2;

    // Inverters
    inv U1 (D, nD);
    inv U2 (CLK, nCLK);
    inv U10 (q1, nq1);
    

    // master
    and2 U3 (D, nCLK, r1);     // Set path
    and2 U4 (nD, nCLK, s1);    // Reset path
    nor2 U5 (q1, s1, qor1);
    nor2 U6 (qor1, r1, q1);
    
    //slave
    and2 U7 (nq1, CLK, s2);
    and2 U8 (q1, CLK, r2);
    nor2 U9 (s2, Q, qor2);
    nor2 U11 (r2, qor2, Q);
    

endmodule

