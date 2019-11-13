// synopsys translate_off
`timescale 1 ns / 1 ps
// synopsys translate_on

module alu(
         input [63:0] A,B,
         input [3:0] ALU_Sel,
         input clock,
         output [63:0] valE,
         output CF,ZF
       );
reg [63:0] ALU_RESULT;

assign CF = (ALU_RESULT < A & ALU_Sel == 4'b0001) | (ALU_RESULT > A & ALU_Sel == 4'b0010);
assign ZF = ALU_RESULT == 0;

initial
  begin
    ALU_RESULT = 64'h00000000;
  end

always@(posedge clock)
  begin
    case (ALU_Sel)
      4'b0001:
        ALU_RESULT = A + B;
      4'b0010:
        ALU_RESULT = A - B;
      4'b0011:
        ALU_RESULT = A * B;
      4'b0100:
        ALU_RESULT = A / B;
      4'b0101:
        ALU_RESULT = A & B;
      4'b0110:
        ALU_RESULT = A | B;
      4'b0111:
        ALU_RESULT = A ^ B;
      default:
        ALU_RESULT = A;
    endcase
  end
assign valE =ALU_RESULT;
endmodule