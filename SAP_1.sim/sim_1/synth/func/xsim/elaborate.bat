@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Tue Jul 16 20:39:53 +0100 2019
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto e89ca1b8bf08401d86fea87a84c8990c --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot control_sequencer_func_synth xil_defaultlib.control_sequencer -log elaborate.log"
call xelab  -wto e89ca1b8bf08401d86fea87a84c8990c --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot control_sequencer_func_synth xil_defaultlib.control_sequencer -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
