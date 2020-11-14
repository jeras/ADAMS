module fll #(
  // counter parameters
  parameter int unsigned CCW_I = 8,  // input  clock counter width
  parameter int unsigned CCW_O = 8,  // output clock counter width
  parameter int unsigned ACW   = 8,  // accumulator  counter width
  // DCO parameters
  parameter realtime     T_MAX = 20ns,  // max clock period
  parameter realtime     T_MIN =  2ns   // mim clock period
)(
  // input clock/reset
  input  logic             clk_i,
  input  logic             rst_i,
  // configuration number
  input  logic [CCW_I-1:0] num_i,
  input  logic [CCW_O-1:0] num_o,
  // output clock
  output logic             clk_o
);

  // input/output clock counter
  logic [CCW_I-1:0] cnt_i;
  logic [CCW_O-1:0] cnt_o;
  // output configuration number resynchronization
  logic [CCW_O-1:0] num_r;
  // input/output increment
  logic             inc_i;
  logic             inc_o;
  // input/output increment factors
  logic [ACW  -1:0] fct_i;
  logic [ACW  -1:0] fct_o;
  // output increment resynchronization
  logic             inc_r;
  // accumulator counter
  logic [ACW  -1:0] acc;
  logic [ACW  -0:0] nxt;

  // VCO clock period time
  real              T_DCO;

  // input clock counter
  always @(posedge clk_i, posedge rst_i)
  if (rst_i)  cnt_i <= 0;
  else        cnt_i <= inc_i ? 0 : cnt_i + 1;
  
  // input increment
  assign inc_i = cnt_i == num_i;

  // output configuration number resynchronization
  // TODO: clock domain crossing FIFO
  assign num_r = num_o;
  
  // output clock counter
  always @(posedge clk_o, posedge rst_i)
  if (rst_i)  cnt_o <= 0;
  else        cnt_o <= inc_r ? 0 : cnt_o + 1;
  
  // output increment
  assign inc_r = cnt_o == num_o;

  // output increment resynchronization
  fll_cdc #(
    // size parameters
    .DW  (1),
    .FF  (6),
    // implementation parameters
    .SS  (2),
    .OH  (0),
    // interface parameters
    .RI  (0),
    .RO  (0) 
  ) cdc_inc (
    // input port
    .ffi_clk  (clk_o),
    .ffi_rst  (rst_i),
    .ffi_bus  (),
    .ffi_vld  (inc_r),
    .ffi_rdy  (),
    // output port
    .ffo_clk  (clk_i),
    .ffo_rst  (rst_i),
    .ffo_bus  (),
    .ffo_vld  (inc_o),
    .ffo_rdy  (1'b1) 
  );

  // accumulator
  always @(posedge clk_i, posedge rst_i)
  if (rst_i)  acc = 0;
  else        acc <= nxt[ACW] ? acc : nxt;
  
  // next accumulator value
  assign nxt = acc + (inc_i ? fct_i : 0)
                   - (inc_o ? fct_o : 0);

  // incrementer factors
  always @(posedge clk_i, posedge rst_i)
  if (rst_i) begin
    fct_i = 1 << (ACW-1);
    fct_o = 1 << (ACW-1);
  end else begin
    if (fct_i > 1)  fct_i = fct_i >> inc_o;
    if (fct_o > 1)  fct_o = fct_o >> inc_o;
  end

  // DCO (digitally controlled oscilator)
  // TODO, resynchronization into DCO domain
  initial clk_o = 1'b1;
  always #(T_DCO/2) clk_o = ~clk_o;

  assign T_DCO = T_MIN + (T_MAX - T_MIN) * (1 - real'(acc) / real'(2**ACW));

endmodule: fll