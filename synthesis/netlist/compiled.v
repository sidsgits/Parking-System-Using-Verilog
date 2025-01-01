/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP3
// Date      : Sun Dec  8 14:02:46 2024
/////////////////////////////////////////////////////////////


module Car_Parking_System_FSM_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  SAEDRVT14_ADDH_0P5 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  SAEDRVT14_ADDH_0P5 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  SAEDRVT14_ADDH_0P5 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  SAEDRVT14_ADDH_0P5 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  SAEDRVT14_ADDH_0P5 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  SAEDRVT14_ADDH_0P5 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  SAEDRVT14_INV_1 U1 ( .A(A[0]), .X(SUM[0]) );
  SAEDRVT14_EO2_V1_0P75 U2 ( .A1(carry[7]), .A2(A[7]), .X(SUM[7]) );
endmodule


module Car_Parking_System_FSM ( clk, rstn, vehicle_at_entry, vehicle_at_exit, 
        correct_password, entry_gate, exit_gate, entry_led, exit_led, state, 
        vehicle_count, seg_display );
  output [2:0] state;
  output [7:0] vehicle_count;
  output [6:0] seg_display;
  input clk, rstn, vehicle_at_entry, vehicle_at_exit, correct_password;
  output entry_gate, exit_gate, entry_led, exit_led;
  wire   entry_led, N49, N50, N51, N52, N53, N54, N55, N56, N58, N59, N60, N61,
         N62, N63, N64, N65, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, exit_led;
  wire   [2:0] present_state;
  wire   [2:0] next_state;
  assign entry_gate = entry_led;
  assign seg_display[4] = seg_display[5];
  assign seg_display[2] = seg_display[3];
  assign exit_gate = exit_led;

  SAEDRVT14_FDPRBQ_V2_1 \vehicle_count_reg[0]  ( .D(n31), .CK(clk), .RD(n69), 
        .Q(vehicle_count[0]) );
  SAEDRVT14_FDPRBQ_V2_1 \vehicle_count_reg[7]  ( .D(n30), .CK(clk), .RD(n69), 
        .Q(vehicle_count[7]) );
  SAEDRVT14_FDPRBQ_V2_1 \vehicle_count_reg[6]  ( .D(n24), .CK(clk), .RD(n69), 
        .Q(vehicle_count[6]) );
  SAEDRVT14_FDPRBQ_V2_1 \present_state_reg[1]  ( .D(next_state[1]), .CK(clk), 
        .RD(n69), .Q(present_state[1]) );
  SAEDRVT14_FDPRBQ_V2_1 \present_state_reg[0]  ( .D(next_state[0]), .CK(clk), 
        .RD(n69), .Q(present_state[0]) );
  SAEDRVT14_FDPRBQ_V2_1 \present_state_reg[2]  ( .D(n70), .CK(clk), .RD(n69), 
        .Q(present_state[2]) );
  SAEDRVT14_FDPRBQ_V2_1 \vehicle_count_reg[5]  ( .D(n25), .CK(clk), .RD(n69), 
        .Q(vehicle_count[5]) );
  SAEDRVT14_FDPRBQ_V2_1 \vehicle_count_reg[4]  ( .D(n26), .CK(clk), .RD(n69), 
        .Q(vehicle_count[4]) );
  SAEDRVT14_FDPRBQ_V2_1 \vehicle_count_reg[3]  ( .D(n27), .CK(clk), .RD(n69), 
        .Q(vehicle_count[3]) );
  SAEDRVT14_FDPRBQ_V2_1 \vehicle_count_reg[2]  ( .D(n28), .CK(clk), .RD(n69), 
        .Q(vehicle_count[2]) );
  SAEDRVT14_FDPRBQ_V2_1 \vehicle_count_reg[1]  ( .D(n29), .CK(clk), .RD(n69), 
        .Q(vehicle_count[1]) );
  SAEDRVT14_FDPRBQ_V2_1 \state_reg[2]  ( .D(present_state[2]), .CK(clk), .RD(
        n69), .Q(state[2]) );
  SAEDRVT14_FDPRBQ_V2_1 \state_reg[1]  ( .D(present_state[1]), .CK(clk), .RD(
        n69), .Q(state[1]) );
  SAEDRVT14_FDPRBQ_V2_1 \state_reg[0]  ( .D(present_state[0]), .CK(clk), .RD(
        n69), .Q(state[0]) );
  Car_Parking_System_FSM_DW01_inc_0 add_91_S2 ( .A(vehicle_count), .SUM({N56, 
        N55, N54, N53, N52, N51, N50, N49}) );
  SAEDRVT14_OR2_MM_0P5 U40 ( .A1(exit_led), .A2(entry_led), .X(n61) );
  SAEDRVT14_INV_1 U41 ( .A(n36), .X(n38) );
  SAEDRVT14_INV_1 U42 ( .A(vehicle_count[0]), .X(N58) );
  SAEDRVT14_OR2_MM_0P5 U43 ( .A1(vehicle_count[0]), .A2(vehicle_count[1]), .X(
        n32) );
  SAEDRVT14_AO21B_0P5 U44 ( .A1(vehicle_count[0]), .A2(vehicle_count[1]), .B(
        n32), .X(N59) );
  SAEDRVT14_OR2_MM_0P5 U45 ( .A1(n32), .A2(vehicle_count[2]), .X(n33) );
  SAEDRVT14_AO21B_0P5 U46 ( .A1(n32), .A2(vehicle_count[2]), .B(n33), .X(N60)
         );
  SAEDRVT14_OR2_MM_0P5 U47 ( .A1(n33), .A2(vehicle_count[3]), .X(n34) );
  SAEDRVT14_AO21B_0P5 U48 ( .A1(n33), .A2(vehicle_count[3]), .B(n34), .X(N61)
         );
  SAEDRVT14_OR2_MM_0P5 U49 ( .A1(n34), .A2(vehicle_count[4]), .X(n35) );
  SAEDRVT14_AO21B_0P5 U50 ( .A1(n34), .A2(vehicle_count[4]), .B(n35), .X(N62)
         );
  SAEDRVT14_NR2_ISO_1 U51 ( .CK(n35), .EN(vehicle_count[5]), .X(n36) );
  SAEDRVT14_AO21_1 U52 ( .A1(n35), .A2(vehicle_count[5]), .B(n36), .X(N63) );
  SAEDRVT14_EO2_V1_0P75 U53 ( .A1(vehicle_count[6]), .A2(n36), .X(N64) );
  SAEDRVT14_NR2_ISO_1 U54 ( .CK(vehicle_count[6]), .EN(n38), .X(n37) );
  SAEDRVT14_EO2_V1_0P75 U55 ( .A1(vehicle_count[7]), .A2(n37), .X(N65) );
  SAEDRVT14_MUXI2_U_0P5 U56 ( .D0(n39), .D1(n40), .S(n41), .X(seg_display[6])
         );
  SAEDRVT14_NR2_ISO_1 U57 ( .CK(present_state[1]), .EN(n39), .X(n40) );
  SAEDRVT14_ND2_CDC_0P5 U58 ( .A1(n42), .A2(n43), .X(seg_display[3]) );
  SAEDRVT14_AO21B_0P5 U59 ( .A1(present_state[2]), .A2(seg_display[1]), .B(n42), .X(seg_display[0]) );
  SAEDRVT14_NR2_ISO_1 U60 ( .CK(present_state[1]), .EN(present_state[0]), .X(
        seg_display[1]) );
  SAEDRVT14_AO33_1 U61 ( .A1(seg_display[5]), .A2(present_state[0]), .A3(
        correct_password), .B1(n44), .B2(n45), .B3(n46), .X(next_state[1]) );
  SAEDRVT14_AN2B_MM_1 U62 ( .B(vehicle_at_exit), .A(n43), .X(n46) );
  SAEDRVT14_NR2_ISO_1 U63 ( .CK(n47), .EN(n43), .X(next_state[0]) );
  SAEDRVT14_ND2_CDC_0P5 U64 ( .A1(seg_display[5]), .A2(n41), .X(n43) );
  SAEDRVT14_AOI21_0P5 U65 ( .A1(vehicle_at_exit), .A2(n45), .B(n48), .X(n47)
         );
  SAEDRVT14_INV_0P5 U66 ( .A(n44), .X(n48) );
  SAEDRVT14_ND3B_0P75 U67 ( .A(vehicle_count[7]), .B1(n49), .B2(
        vehicle_at_entry), .X(n44) );
  SAEDRVT14_ND3B_0P75 U68 ( .A(n50), .B1(n51), .B2(vehicle_count[6]), .X(n49)
         );
  SAEDRVT14_OR4_1 U69 ( .A1(vehicle_count[1]), .A2(vehicle_count[0]), .A3(n51), 
        .A4(n52), .X(n45) );
  SAEDRVT14_ND3B_0P75 U70 ( .A(vehicle_count[5]), .B1(n53), .B2(n54), .X(n52)
         );
  SAEDRVT14_ND3B_0P75 U71 ( .A(vehicle_count[2]), .B1(n55), .B2(n56), .X(n51)
         );
  SAEDRVT14_INV_0P5 U72 ( .A(rstn), .X(n69) );
  SAEDRVT14_INV_0P5 U73 ( .A(n57), .X(n70) );
  SAEDRVT14_ND3B_0P75 U74 ( .A(correct_password), .B1(present_state[0]), .B2(
        seg_display[5]), .X(n57) );
  SAEDRVT14_NR2_ISO_1 U75 ( .CK(present_state[2]), .EN(present_state[1]), .X(
        seg_display[5]) );
  SAEDRVT14_AO221_0P5 U76 ( .A1(N49), .A2(n58), .B1(N58), .B2(n59), .C(n60), 
        .X(n31) );
  SAEDRVT14_AN2B_MM_1 U77 ( .B(vehicle_count[0]), .A(n61), .X(n60) );
  SAEDRVT14_AO221_0P5 U78 ( .A1(N56), .A2(n58), .B1(N65), .B2(n59), .C(n62), 
        .X(n30) );
  SAEDRVT14_NR2_ISO_1 U79 ( .CK(n61), .EN(n53), .X(n62) );
  SAEDRVT14_INV_0P5 U80 ( .A(vehicle_count[7]), .X(n53) );
  SAEDRVT14_AO221_0P5 U81 ( .A1(N50), .A2(n58), .B1(N59), .B2(n59), .C(n63), 
        .X(n29) );
  SAEDRVT14_AN2B_MM_1 U82 ( .B(vehicle_count[1]), .A(n61), .X(n63) );
  SAEDRVT14_AO221_0P5 U83 ( .A1(N51), .A2(n58), .B1(N60), .B2(n59), .C(n64), 
        .X(n28) );
  SAEDRVT14_AN2B_MM_1 U84 ( .B(vehicle_count[2]), .A(n61), .X(n64) );
  SAEDRVT14_AO221_0P5 U85 ( .A1(N52), .A2(n58), .B1(N61), .B2(n59), .C(n65), 
        .X(n27) );
  SAEDRVT14_NR2_ISO_1 U86 ( .CK(n61), .EN(n56), .X(n65) );
  SAEDRVT14_INV_0P5 U87 ( .A(vehicle_count[3]), .X(n56) );
  SAEDRVT14_AO221_0P5 U88 ( .A1(N53), .A2(n58), .B1(N62), .B2(n59), .C(n66), 
        .X(n26) );
  SAEDRVT14_NR2_ISO_1 U89 ( .CK(n61), .EN(n55), .X(n66) );
  SAEDRVT14_INV_0P5 U90 ( .A(vehicle_count[4]), .X(n55) );
  SAEDRVT14_AO221_0P5 U91 ( .A1(N54), .A2(n58), .B1(N63), .B2(n59), .C(n67), 
        .X(n25) );
  SAEDRVT14_NR2_ISO_1 U92 ( .CK(n50), .EN(n61), .X(n67) );
  SAEDRVT14_INV_0P5 U93 ( .A(vehicle_count[5]), .X(n50) );
  SAEDRVT14_AO221_0P5 U94 ( .A1(N55), .A2(n58), .B1(N64), .B2(n59), .C(n68), 
        .X(n24) );
  SAEDRVT14_NR2_ISO_1 U95 ( .CK(n54), .EN(n61), .X(n68) );
  SAEDRVT14_INV_0P5 U96 ( .A(vehicle_count[6]), .X(n54) );
  SAEDRVT14_AN2_1 U97 ( .A1(present_state[0]), .A2(n61), .X(n59) );
  SAEDRVT14_AN2_1 U98 ( .A1(n61), .A2(n41), .X(n58) );
  SAEDRVT14_INV_0P5 U99 ( .A(n42), .X(exit_led) );
  SAEDRVT14_ND3B_0P75 U100 ( .A(n41), .B1(n39), .B2(present_state[1]), .X(n42)
         );
  SAEDRVT14_AN3_0P5 U101 ( .A1(n39), .A2(n41), .A3(present_state[1]), .X(
        entry_led) );
  SAEDRVT14_INV_0P5 U102 ( .A(present_state[0]), .X(n41) );
  SAEDRVT14_INV_0P5 U103 ( .A(present_state[2]), .X(n39) );
endmodule

