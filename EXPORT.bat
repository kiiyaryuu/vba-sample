@echo off

:: --- �o�b�`�t�@�C�����e ---

:: ���s�������� -y �̏ꍇ :bool_exe_yes �ɃX�L�b�v
if {%1} == {-y} (goto :bool_exe_yes)

set /p selected="VBA�R�[�h�𕪗����܂���? (Y=Yes / N=NO)"
:: /i �͑啶���Ə������𐧌������ɔ�r����
if /i {%bool_exe%} == {y} (goto :bool_exe_yes)
if /i {%bool_exe%} == {yes} (goto :bool_exe_yes)

:: "no" �̏ꍇ�����I��
echo �������I�����܂�
exit

:bool_exe_yes
    pushd %0\..
    cscript vbac.wsf decombine
    echo �R�[�h�̕������I�����܂���
exit
