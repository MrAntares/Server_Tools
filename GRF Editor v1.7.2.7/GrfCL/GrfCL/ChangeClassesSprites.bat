REM Encoding of the file must be ANSI
@echo off
chcp 1252

set JobDirection=3rdTo2nd
REM set JobDirection=2ndTo3rd

set BodySpritesPathMale=data\sprite\�ΰ���\����\��\
set BodySpritesPathFemale=data\sprite\�ΰ���\����\��\

REM Set up GrfCL to extract the sprites
REM Breaking on exceptions will allow you to see which commands
REM have issues; every batch file uses it as its first option
set c= -breakOnExceptions true
set c=%c% -open rdata.grf
set c=%c% -extractFiles "%BodySpritesPathMale%" ""
set c=%c% -extractFiles "%BodySpritesPathFemale%" ""
set c=%c% -close

GrfCL.exe %c%

echo All sprites have been extracted
SET /P Pause=Press any key...

REM Constants...
set Male=_��
set Female=_��

set ArcBishop=��ũ���
set ArcBishopMount=��ũ������ī
set GuillotineCross=���ƾũ�ν�
set GuillotineCrossMount=�̺��ν����ƾũ�ν�
set Mechanic=���ɴ�
set MechanicMount=���ɴи����
set Ranger=������
set RangerMount=����������
set RuneKnight=�鳪��Ʈ
set RuneKnightMount=���ڷ鳪��Ʈ
set Warlock=����
set WarlockMount=�������
set ShadowChaser=������ü�̼�
set ShadowChaserMount=�̺��ν�������ü�̼�
set Minstrel=�ν�Ʈ��
set MinstrelMount=Ÿ���ν�Ʈ��
set Wanderer=������
set WandererMount=Ÿ��������
set Sura=����
set SuraMount=�������ī
set RoyalGuard=����
set RoyalGuardPecoMount=�׸�������
set RoyalGuardMount=���ڷξⰡ��
set Genetic=���׸�
set GeneticMount=���׸������
set Sorcerer=�Ҽ���
set SorcererMount=����Ҽ���

set HighPriest=��������
set HighPriestMount=����������Ʈ����ī
set AssassinCross=��ؽ�ũ�ν�
set AssassinCrossMount=�̺��ν�����ũ�ν�
set Mastersmith=ȭ��Ʈ���̽�
set MastersmithMount=ȭ��Ʈ���̽������
set Sniper=��������
set SniperMount=Ÿ����������
set LordKnight=�ε峪��Ʈ
set LordKnightMount=���ڷε峪��Ʈ
set HighWizard=����������
set HighWizardMount=��������������
set StalkerChaser=����Ŀ
set StalkerChaserMount=�̺��ν�����Ŀ
set Clown=Ŭ���
set ClownMount=Ÿ��ũ���
set Gypsy=����
set GypsyMount=Ÿ��¤��
set Champion=è�ǿ�
set ChampionMount=è�ǿ¾���ī
set Paladin=�ȶ��
set PaladinPecoMount=�����ȶ��
set PaladinMount=�����ȶ��
set Biochemist=ũ��������
set BiochemistMount=ũ�������͸����
set Professor=�����伭
set ProfessorMount=���������伭

set Sprites3rdJob[0]=%ArcBishop%
set Sprites3rdJob[1]=%ArcBishopMount%
set Sprites3rdJob[2]=%GuillotineCross%
set Sprites3rdJob[3]=%GuillotineCrossMount%
set Sprites3rdJob[4]=%Mechanic%
set Sprites3rdJob[5]=%MechanicMount%
set Sprites3rdJob[6]=%Ranger%
set Sprites3rdJob[7]=%RangerMount%
set Sprites3rdJob[8]=%RuneKnight%
set Sprites3rdJob[9]=%RuneKnightMount%
set Sprites3rdJob[10]=%Warlock%
set Sprites3rdJob[11]=%WarlockMount%
set Sprites3rdJob[12]=%ShadowChaser%
set Sprites3rdJob[13]=%ShadowChaserMount%
set Sprites3rdJob[14]=%Minstrel%
set Sprites3rdJob[15]=%MinstrelMount%
set Sprites3rdJob[16]=%Wanderer%
set Sprites3rdJob[17]=%WandererMount%
set Sprites3rdJob[18]=%Sura%
set Sprites3rdJob[19]=%SuraMount%
set Sprites3rdJob[20]=%RoyalGuard%
set Sprites3rdJob[21]=%RoyalGuardPecoMount%
set Sprites3rdJob[22]=%RoyalGuardMount%
set Sprites3rdJob[23]=%Genetic%
set Sprites3rdJob[24]=%GeneticMount%
set Sprites3rdJob[25]=%Sorcerer%
set Sprites3rdJob[26]=%SorcererMount%

set Sprites2ndJob[0]=%HighPriest%
set Sprites2ndJob[1]=%HighPriestMount%
set Sprites2ndJob[2]=%AssassinCross%
set Sprites2ndJob[3]=%AssassinCrossMount%
set Sprites2ndJob[4]=%Mastersmith%
set Sprites2ndJob[5]=%MastersmithMount%
set Sprites2ndJob[6]=%Sniper%
set Sprites2ndJob[7]=%SniperMount%
set Sprites2ndJob[8]=%LordKnight%
set Sprites2ndJob[9]=%LordKnightMount%
set Sprites2ndJob[10]=%HighWizard%
set Sprites2ndJob[11]=%HighWizardMount%
set Sprites2ndJob[12]=%StalkerChaser%
set Sprites2ndJob[13]=%StalkerChaserMount%
set Sprites2ndJob[14]=%Clown%
set Sprites2ndJob[15]=%ClownMount%
set Sprites2ndJob[16]=%Gypsy%
set Sprites2ndJob[17]=%GypsyMount%
set Sprites2ndJob[18]=%Champion%
set Sprites2ndJob[19]=%ChampionMount%
set Sprites2ndJob[20]=%Paladin%
set Sprites2ndJob[21]=%PaladinPecoMount%
set Sprites2ndJob[22]=%PaladinMount%
set Sprites2ndJob[23]=%Biochemist%
set Sprites2ndJob[24]=%BiochemistMount%
set Sprites2ndJob[25]=%Professor%
set Sprites2ndJob[26]=%ProfessorMount%

setlocal EnableDelayedExpansion

for /L %%i in (0,1,26) do (
	if "!JobDirection!" == "2ndTo3rd" (
		call:RenameSpriteMale !Sprites3rdJob[%%i]! !Sprites2ndJob[%%i]!
		call:RenameSpriteFemale !Sprites3rdJob[%%i]! !Sprites2ndJob[%%i]!
	) else (
		call:RenameSpriteMale !Sprites2ndJob[%%i]! !Sprites3rdJob[%%i]!
		call:RenameSpriteFemale !Sprites2ndJob[%%i]! !Sprites3rdJob[%%i]!
	)
)

echo All sprites have been renamed
SET /P Pause=Press any key...

REM Set up GrfCL to make a new GRF from the sprites created
set c= -breakOnExceptions true

set c=%c% -new
for /L %%i in (0,1,26) do (
	if "!JobDirection!" == "2ndTo3rd" (
		set c=!c! -add %BodySpritesPathMale% %BodySpritesPathMale%!Sprites2ndJob[%%i]!%Male%.spr %BodySpritesPathMale%!Sprites2ndJob[%%i]!%Male%.act
		set c=!c! -add %BodySpritesPathFemale% %BodySpritesPathFemale%!Sprites2ndJob[%%i]!%Female%.spr %BodySpritesPathFemale%!Sprites2ndJob[%%i]!%Female%.act
	) else (
		set c=!c! -add %BodySpritesPathMale% %BodySpritesPathMale%!Sprites3rdJob[%%i]!%Male%.spr %BodySpritesPathMale%!Sprites3rdJob[%%i]!%Male%.act
		set c=!c! -add %BodySpritesPathFemale% %BodySpritesPathFemale%!Sprites3rdJob[%%i]!%Female%.spr %BodySpritesPathFemale%!Sprites3rdJob[%%i]!%Female%.act
	)
)

REM Removes the female

set c=%c% -save example.grf
set c=%c% -close
set c=%c% -write "Finished writing the new GRF!"
set c=%c% -break
GrfCL.exe %c%

REM %~1 : Source path
REM %~2 : Destination path
:RenameSpriteMale
move "%BodySpritesPathMale%%~1%Male%.spr" "%BodySpritesPathMale%%~2%Male%.spr"
move "%BodySpritesPathMale%%~1%Male%.act" "%BodySpritesPathMale%%~2%Male%.act"
goto:eof

REM %~1 : Source path
REM %~2 : Destination path
:RenameSpriteFemale
move %BodySpritesPathFemale%%~1%Female%.spr %BodySpritesPathFemale%%~2%Female%.spr
move %BodySpritesPathFemale%%~1%Female%.act %BodySpritesPathFemale%%~2%Female%.act
goto:eof