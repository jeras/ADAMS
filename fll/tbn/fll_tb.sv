module fll_tb #(
  // counter parameters
  parameter int unsigned CCW_I = 8,  // input  clock counter width
  parameter int unsigned CCW_O = 8,  // output clock counter width
  parameter int unsigned ACW   = 8,  // accumulator  counter width
  // DCO parameters
  parameter realtime     T_MAX = 20ns,  // max clock period
  parameter realtime     T_MIN =  2ns   // mim clock period
);

  // clk/rst signals
  bit               clk;
  bit               rst;
  // configuration number
  bit   [CCW_I-1:0] num_i;
  bit   [CCW_O-1:0] num_o;
  // output clock
  logic             clk_o;


  // clk source
  initial          clk = 1'b1;
  always #(20ns/2) clk = ~clk;

  // rst source
  initial begin
    num_i <= 2;
    num_o <= 5;
    rst <= 1'b1;
    repeat (4) @(posedge clk);
    rst <= 1'b0;
    repeat (1000) @(posedge clk);
    $finish();
  end

  // FLL RTL instance
  fll #(
    // counter parameters
    .CCW_I  (CCW_I),
    .CCW_O  (CCW_O),
    .ACW    (ACW  ),
    // DCO parameters
    .T_MAX  (T_MAX),
    .T_MIN  (T_MIN)
  )  dut (
    // input clock/reset
    .clk_i  (clk),
    .rst_i  (rst),
    // configuration number
    .num_i  (num_i),
    .num_o  (num_o),
    // output clock
    .clk_o  (clk_o)
  );

endmodule: fll_tb