@echo off
REM ****************************************************************************
REM Vivado (TM) v2022.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Fri Dec 09 10:29:59 +0700 2022
REM SW Build 3526262 on Mon Apr 18 15:48:16 MDT 2022
REM
REM IP Build 3524634 on Mon Apr 18 20:55:01 MDT 2022
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim pos_divider_tester_behav -key {Behavioral:pos_divider_sim:Functional:pos_divider_tester} -tclbatch pos_divider_tester.tcl -view D:/Education/year3/term1/HW_SYS_LAB/TermProject/VivadoProject/pos_divider_tester_behav.wcfg -log simulate.log"
call xsim  pos_divider_tester_behav -key {Behavioral:pos_divider_sim:Functional:pos_divider_tester} -tclbatch pos_divider_tester.tcl -view D:/Education/year3/term1/HW_SYS_LAB/TermProject/VivadoProject/pos_divider_tester_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
