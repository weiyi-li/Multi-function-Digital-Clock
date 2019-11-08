module segment7(disp, out1, out2, out3, out4, out5, out6, out7);
input [3:0] disp;
output out1;
output out2;
output out3;
output out4;
output out5;
output out6;
output out7;
reg out1;
reg out2;
reg out3;
reg out4;
reg out5;
reg out6;
reg out7;
reg [6:0] seg;

always@(disp)
begin
   case(disp)
   4'b0000:seg=7'b1111110;
   4'b0001:seg=7'b0110000;
   4'b0010:seg=7'b1101101;
   4'b0011:seg=7'b1111001;
   4'b0100:seg=7'b0110011;
   4'b0101:seg=7'b1011011;
   4'b0110:seg=7'b1011111;
   4'b0111:seg=7'b1110000;
   4'b1000:seg=7'b1111111;
   4'b1001:seg=7'b1111011;
endcase
out1<=seg[6];
out2<=seg[5];
out3<=seg[4];
out4<=seg[3];
out5<=seg[2];
out6<=seg[1];
out7<=seg[0];
end 
endmodule
