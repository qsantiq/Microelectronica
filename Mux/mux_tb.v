`timescale 1ns/100ps
`include "mux_c.v"
`include "mux_e.v"
`include "mux_t.v"
`include "cmos_cells.v"
//`include "gscl45nm.v"

module mux_tb;

wire out_c;
wire out_e;
wire    sel;
wire  [1:0] data_in;
wire  reset;
wire  clk;

mux_c mux_c
(/*AUTOINST*/
 // Outputs
 .out_c					(out_c),
 // Inputs
 .sel					(sel),
 .data_in				(data_in[1:0]),
 .reset					(reset),
 .clk					(clk));
mux_t mux_t
(/*AUTOINST*/
 // Outputs
 .sel					(sel),
 .data_in				(data_in[1:0]),
 .reset					(reset),
 .clk					(clk),
 // Inputs
 .out_c					(out_c),
 .out_e					(out_e));

mux_e mux_e
(/*AUTOINST*/
 // Outputs
 .out_e					(out_e),
 // Inputs
 .clk					(clk),
 .data_in				(data_in[1:0]),
 .reset					(reset),
 .sel					(sel));
endmodule
