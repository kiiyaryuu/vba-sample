@echo off

:: --- �ϐ��̐錾 ---
set base_file="sample.xlsm"

:: --- �o�b�`�t�@�C�����e ---

:: ���s�������� -y �̏ꍇ :bool_exe_yes �ɃX�L�b�v
if {%1} == {-y} (goto :bool_exe_yes)

set /p bool_exe="VBA�R�[�h���������܂���? (Y=Yes / N=NO)"
:: /i �͑啶���Ə������𐧌������ɔ�r����
if /i {%bool_exe%} == {y} (goto :bool_exe_yes)
if /i {%bool_exe%} == {yes} (goto :bool_exe_yes)

:: "no" �̏ꍇ�����I��
echo �������I�����܂�
exit

:bool_exe_yes
:copy_file
    echo �x�[�X�t�@�C������R�s�[���Ă��܂�
    copy .\bin\base_xls\%base_file% .\bin\%base_file%

    if %ERRORLEVEL% equ 0 (
        echo �R�s�[���������܂���
        echo �R�[�h�̌������J�n���܂�
        echo:

        :: vbac�̎��s
        cscript vbac.wsf combine
        echo �R�[�h�̌������I�����܂���
        echo:
    ) else (
        echo:
        echo �w�肳�ꂽ�t�@�C����������Ȃ����A�R�s�[���Excel�t�@�C�����J���Ă��܂��B
        echo �G���^�[�L�[�������ƍēx���s���܂��B
        pause
        goto :copy_file
    )
exit
