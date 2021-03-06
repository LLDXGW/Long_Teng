`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2022 06:43:54 PM
// Design Name: 
// Module Name: ID_EXE_registers
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 所有需要的寄存器地址和寄存器取出来的值，立即数，译码获得的指令
//////////////////////////////////////////////////////////////////////////////////


module ID_EXE_registers(
    input clk,
    input areset,
    input [1:0] pipeline_control,
    input [5:0] opcode,
    input [5:0] fun,
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input [31:0] Imm,
    input [4:0] sa,
    input [2:0] Sel_alua,
    input [2:0] Sel_alub,
    input SignalException,
    input [3:0] sel_alu_op,
    input [31:0] REGrs,
    input [31:0] REGrt,
    input [31:0] PC_next_4,
    input [5:0] data_rw_ena,
    input [4:0] rf_write_addr,
    input [2:0] mdata_sel,
    output [5:0] EXE_opcode_MEM,
    output [5:0] EXE_fun_MEM,
    output [4:0] EXE_rs_MEM,
    output [4:0] EXE_rt_MEM,
    output [4:0] EXE_rd_MEM,
    output [31:0] EXE_Imm_MEM,
    output [4:0] EXE_sa,
    output [2:0] EXE_Sel_alua,
    output [2:0] EXE_Sel_alub,
    output EXE_SignalException,
    output [3:0] EXE_sel_alu_op,
    output [31:0] EXE_REGrs_MEM,
    output [31:0] EXE_REGrt_MEM,
    output [31:0] EXE_PC_next_4_MEM,
    output [5:0] EXE_data_rw_ena_MEM,
    output [4:0] EXE_rf_write_addr_MEM,
    output [2:0] EXE_mdata_sel_MEM
    );

    reg [4:0] rs_inter;
    reg [4:0] rt_inter;
    reg [4:0] rd_inter;
    reg [4:0] sa_inter;
    reg [31:0] Imm_inter;
    reg [2:0] Sel_alua_inter;
    reg [2:0] Sel_alub_inter;
    reg [2:0] mdata_sel_inter;
    reg SignalException_inter;
    reg [3:0] sel_alu_op_inter;
    reg [31:0] REGrs_inter,REGrt_inter,PC_next_4_inter;
    wire [31:0] empty;
    reg [5:0] opcode_inter,fun_inter;
    reg [5:0] data_rw_ena_inter;
    reg [4:0] rf_write_addr_inter;

    assign empty = 0;

    always@(posedge clk or posedge areset)begin
        if(areset) begin
            opcode_inter <= 0;
            fun_inter <= 0;
            rs_inter <= 0;
            rt_inter <= 0;
            rd_inter <= 0;
            sa_inter <= 0;
            Imm_inter <= 0;
            Sel_alua_inter <= 0;
            Sel_alub_inter <= 0;
            SignalException_inter <= 0;
            sel_alu_op_inter <= 0;
            REGrs_inter <= 0;
            REGrt_inter <= 0;
            data_rw_ena_inter <= 0;
            PC_next_4_inter <= 0;
            rf_write_addr_inter <= 0;
            mdata_sel_inter <= 0;
        end
        else begin
        case(pipeline_control)
        2'b00: begin
            opcode_inter <= opcode;
            fun_inter <= fun;
            rs_inter <= rs;
            rt_inter <= rt;
            rd_inter <= rd;
            sa_inter <= sa;
            Imm_inter <= Imm;
            Sel_alua_inter <= Sel_alua;
            Sel_alub_inter <= Sel_alub;
            SignalException_inter <= SignalException;
            sel_alu_op_inter <= sel_alu_op;
            REGrs_inter <= REGrs;
            REGrt_inter <= REGrt;
            data_rw_ena_inter <= data_rw_ena;
            PC_next_4_inter <= PC_next_4;
            rf_write_addr_inter <= rf_write_addr;
            mdata_sel_inter <= mdata_sel;
        end
        2'b01:begin 
            rs_inter <= empty;
            rt_inter <= empty;
            rd_inter <= empty;
            sa_inter <= empty;
            Imm_inter <= empty;
            Sel_alua_inter <= empty;
            Sel_alub_inter <= empty;
            SignalException_inter <= empty;
            sel_alu_op_inter <= empty;
            REGrs_inter <= empty;
            REGrt_inter <= empty;
            opcode_inter <= empty;
            fun_inter <= empty;
            data_rw_ena_inter <= empty;
            PC_next_4_inter <= empty;
            rf_write_addr_inter <= empty;
            mdata_sel_inter <= empty;
        end
        2'b10:begin
            rs_inter <= rs_inter;
            rt_inter <= rt_inter;
            rd_inter <= rd_inter;
            sa_inter <= sa_inter;
            Imm_inter <= Imm_inter;
            Sel_alua_inter <= Sel_alua_inter;
            Sel_alub_inter <= Sel_alub_inter;
            SignalException_inter <= SignalException_inter;
            sel_alu_op_inter <= sel_alu_op_inter;
            REGrs_inter <= REGrs_inter;
            REGrt_inter <= REGrt_inter;
            opcode_inter <= opcode_inter;
            fun_inter <= fun_inter;
            data_rw_ena_inter <= data_rw_ena_inter;
            PC_next_4_inter <= PC_next_4_inter;
            rf_write_addr_inter <= rf_write_addr_inter;
            mdata_sel_inter <= mdata_sel_inter;
        end
        endcase
        end
    end

    assign EXE_rs_MEM = rs_inter;
    assign EXE_rt_MEM = rt_inter;
    assign EXE_rd_MEM = rd_inter;
    assign EXE_Imm_MEM = Imm_inter;
    assign EXE_Sel_alua = Sel_alua_inter;
    assign EXE_Sel_alub = Sel_alub_inter;
    assign EXE_SignalException = SignalException_inter;
    assign EXE_sel_alu_op = sel_alu_op_inter;
    assign EXE_REGrs_MEM = REGrs_inter;
    assign EXE_REGrt_MEM = REGrt_inter;
    assign EXE_PC_next_4_MEM = PC_next_4_inter;
    assign EXE_sa = sa_inter;
    assign EXE_opcode_MEM = opcode_inter;
    assign EXE_fun_MEM = fun_inter;
    assign EXE_data_rw_ena_MEM = data_rw_ena_inter;
    assign EXE_rf_write_addr_MEM = rf_write_addr_inter;
    assign EXE_mdata_sel_MEM = mdata_sel_inter;


endmodule
