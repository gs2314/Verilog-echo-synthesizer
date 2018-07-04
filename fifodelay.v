module fifodelay (source, echoed, clk, tick);

input [9:0] source;
input clk;
input tick;
output reg[9:0] echoed;

wire full;
wire [9:0] q;
reg readtick;

always @ (posedge clk)
begin
	readtick = tick && full;
end

fifo fif(clk, source[9:0], readtick, tick, full, q[9:0]);

always @ (posedge clk)
	if(full == 1)
		echoed <= {q[9],q[9:1]};



endmodule
