REM Encoding of the file must be ANSI
@echo off
chcp 1252

set JobDirection=3rdTo2nd
REM set JobDirection=2ndTo3rd

set BodySpritesPathMale=data\sprite\인간족\몸통\남\
set BodySpritesPathFemale=data\sprite\인간족\몸통\여\

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
set Male=_남
set Female=_여

set ArcBishop=아크비숍
set ArcBishopMount=아크비숍알파카
set GuillotineCross=길로틴크로스
set GuillotineCrossMount=켈베로스길로틴크로스
set Mechanic=미케닉
set MechanicMount=미케닉멧돼지
set Ranger=레인져
set RangerMount=레인져늑대
set RuneKnight=룬나이트
set RuneKnightMount=사자룬나이트
set Warlock=워록
set WarlockMount=여우워록
set ShadowChaser=쉐도우체이서
set ShadowChaserMount=켈베로스쉐도우체이서
set Minstrel=민스트럴
set MinstrelMount=타조민스트럴
set Wanderer=원더러
set WandererMount=타조원더러
set Sura=슈라
set SuraMount=슈라알파카
set RoyalGuard=가드
set RoyalGuardPecoMount=그리폰가드
set RoyalGuardMount=사자로얄가드
set Genetic=제네릭
set GeneticMount=제네릭멧돼지
set Sorcerer=소서러
set SorcererMount=여우소서러

set HighPriest=하이프리
set HighPriestMount=하이프리스트알파카
set AssassinCross=어쌔신크로스
set AssassinCrossMount=켈베로스어쎄신크로스
set Mastersmith=화이트스미스
set MastersmithMount=화이트스미스멧돼지
set Sniper=스나이퍼
set SniperMount=타조스나이퍼
set LordKnight=로드나이트
set LordKnightMount=사자로드나이트
set HighWizard=하이위저드
set HighWizardMount=여우하이위저드
set StalkerChaser=스토커
set StalkerChaserMount=켈베로스스토커
set Clown=클라운
set ClownMount=타조크라운
set Gypsy=집시
set GypsyMount=타조짚시
set Champion=챔피온
set ChampionMount=챔피온알파카
set Paladin=팔라딘
set PaladinPecoMount=페코팔라딘
set PaladinMount=사자팔라딘
set Biochemist=크리에이터
set BiochemistMount=크리에이터멧돼지
set Professor=프로페서
set ProfessorMount=여우프로페서

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