@echo off
REM ����� � 01 �� 10
for %%i in (01 02 03 04 05 06 07 08 09 10) do (
  COPY %%i connect.in
  REM ������ ������� �������
  solution.exe 
  REM �������� ����������
  check.exe %%i connect.out %%i.a 
)
