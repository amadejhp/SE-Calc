@echo off

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
title Space Engineers Blueprints Calculator
color A

set start=%time%

set file=%~1
if not [%1]==[] goto :run

:test
start "Blueprints" %appdata%\SpaceEngineers\Blueprints\Local
echo.
echo.
echo Drag and drop the .sbc file OR a whole folder below and press Enter:
set /p "file=>"
Set _file=%file:"=%
if x%file:bp.sbc=%==x%file% set file=%_file%\bp.sbc



:run
set count=0
for /F "tokens=3 delims=<>" %%a in ('findstr "DisplayName" "%file%" ') do (
set /a count+=1
IF !count!==1 set owner=^%%a
IF !count!==2 set name=^%%a
)



:read
echo.
echo Reading Blueprint: %name%  by %owner%
echo.
echo Please Wait . . .
echo.

set /a percent=0


:START

REM LIST OF COMPONENTS
set SteelPlate=0
set Construction=0
set Superconductor=0
set PowerCell=0
set MetalGrid=0
set Computer=0
set Display=0
set Motor=0
set LargeTube=0
set SmallTube=0
set InteriorPlate=0
set RadioCommunication=0
set BulletproofGlass=0
set Girder=0
set Explosives=0
set Detector=0
set Medical=0
set Gravity=0
set Reactor=0
set SolarCell=0
REM ----------------------------------
set TOTAL=0
set PCU=0
set HEALTH=0
set MASS=0
REM ----------------------------------
set steel=%SteelPlate%
set const=%Construction%
set super=%Superconductor%
set power=%PowerCell%
set grid=%MetalGrid%
set comp=%Computer%
set disp=%Display%
set motor=%Motor%
set tube=%LargeTube%
set stube=%SmallTube%
set inter=%InteriorPlate%
set radio=%RadioCommunication%
set glass=%BulletproofGlass%
set girder=%Girder%
set boom=%Explosives%
set detect=%Detector%
set medic=%Medical%
set grav=%Gravity%
set react=%Reactor%
set solar=%SolarCell%
set thrust=%Thrust%
set canvas=%Canvas%
REM ----------------------------------

REM LIST OF BLOCKS

REM --- ARMOR BLOCKS START

for /F %%N in ('find /C "<SubtypeName>LargeBlockArmorBlock<" ^< "%file%"') do (
    set "LargeBlockArmorBlock=%%N"
        set /a SteelPlate+=%%N*20
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockArmorSlope<" ^< "%file%"') do (
    set "LargeBlockArmorSlope=%%N"
        set /a SteelPlate+=%%N*10
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockArmorCorner<" ^< "%file%"') do (
    set "LargeBlockArmorCorner=%%N"
        set /a SteelPlate+=%%N*3
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockArmorCornerInv<" ^< "%file%"') do (
    set "LargeBlockArmorCornerInv=%%N"
        set /a SteelPlate+=%%N*16
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]

for /F %%N in ('find /C "<SubtypeName>LargeRoundArmor_Slope<" ^< "%file%"') do (
    set "LargeRoundArmor_Slope=%%N"
        set /a SteelPlate+=%%N*10
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeRoundArmor_Corner<" ^< "%file%"') do (
    set "LargeRoundArmor_Corner=%%N"
        set /a SteelPlate+=%%N*3
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeRoundArmor_CornerInv<" ^< "%file%"') do (
    set "LargeRoundArmor_CornerInv=%%N"
        set /a SteelPlate+=%%N*16
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeHeavyBlockArmorBlock<" ^< "%file%"') do (
    set "LargeHeavyBlockArmorBlock=%%N"
        set /a SteelPlate+=%%N*135
        set /a MetalGrid+=%%N*50
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeHeavyBlockArmorSlope<" ^< "%file%"') do (
    set "LargeHeavyBlockArmorSlope=%%N"
        set /a SteelPlate+=%%N*65
        set /a MetalGrid+=%%N*25
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeHeavyBlockArmorCorner<" ^< "%file%"') do (
    set "LargeHeavyBlockArmorCorner=%%N"
        set /a SteelPlate+=%%N*20
        set /a MetalGrid+=%%N*10
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeHeavyBlockArmorCornerInv<" ^< "%file%"') do (
    set "LargeHeavyBlockArmorCornerInv=%%N"
        set /a SteelPlate+=%%N*110
        set /a MetalGrid+=%%N*50
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockArmorBlock<" ^< "%file%"') do (
    set "SmallBlockArmorBlock=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallBlockArmorSlope<" ^< "%file%"') do (
    set "SmallBlockArmorSlope=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockArmorCorner<" ^< "%file%"') do (
    set "SmallBlockArmorCorner=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockArmorCornerInv<" ^< "%file%"') do (
    set "SmallBlockArmorCornerInv=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallHeavyBlockArmorBlock<" ^< "%file%"') do (
    set "SmallHeavyBlockArmorBlock=%%N"
        set /a SteelPlate+=%%N*3
        set /a MetalGrid+=%%N*2
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallHeavyBlockArmorSlope<" ^< "%file%"') do (
    set "SmallHeavyBlockArmorSlope=%%N"
        set /a SteelPlate+=%%N*2
        set /a MetalGrid+=%%N*1
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallHeavyBlockArmorCorner<" ^< "%file%"') do (
    set "SmallHeavyBlockArmorCorner=%%N"
        set /a SteelPlate+=%%N*1
        set /a MetalGrid+=%%N*1
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallHeavyBlockArmorCornerInv<" ^< "%file%"') do (
    set "SmallHeavyBlockArmorCornerInv=%%N"
        set /a SteelPlate+=%%N*2
        set /a MetalGrid+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeHalfArmorBlock<" ^< "%file%"') do (
    set "LargeHalfArmorBlock=%%N"
        set /a SteelPlate+=%%N*10
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeHeavyHalfArmorBlock<" ^< "%file%"') do (
    set "LargeHeavyHalfArmorBlock=%%N"
        set /a SteelPlate+=%%N*50
        set /a MetalGrid+=%%N*25
        set /a SteelPlate+=%%N*25
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeHalfSlopeArmorBlock<" ^< "%file%"') do (
    set "LargeHalfSlopeArmorBlock=%%N"
        set /a SteelPlate+=%%N*5
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeHeavyHalfSlopeArmorBlock<" ^< "%file%"') do (
    set "LargeHeavyHalfSlopeArmorBlock=%%N"
        set /a SteelPlate+=%%N*30
        set /a MetalGrid+=%%N*15
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>HalfArmorBlock<" ^< "%file%"') do (
    set "HalfArmorBlock=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>HeavyHalfArmorBlock<" ^< "%file%"') do (
    set "HeavyHalfArmorBlock=%%N"
        set /a SteelPlate+=%%N*2
        set /a MetalGrid+=%%N*1
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>HalfSlopeArmorBlock<" ^< "%file%"') do (
    set "HalfSlopeArmorBlock=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>HeavyHalfSlopeArmorBlock<" ^< "%file%"') do (
    set "HeavyHalfSlopeArmorBlock=%%N"
        set /a SteelPlate+=%%N*1
        set /a MetalGrid+=%%N*1
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockArmorRoundSlope<" ^< "%file%"') do (
    set "LargeBlockArmorRoundSlope=%%N"
        set /a SteelPlate+=%%N*10
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeBlockArmorRoundCorner<" ^< "%file%"') do (
    set "LargeBlockArmorRoundCorner=%%N"
        set /a SteelPlate+=%%N*3
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockArmorRoundCornerInv<" ^< "%file%"') do (
    set "LargeBlockArmorRoundCornerInv=%%N"
        set /a SteelPlate+=%%N*16
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeHeavyBlockArmorRoundSlope<" ^< "%file%"') do (
    set "LargeHeavyBlockArmorRoundSlope=%%N"
        set /a SteelPlate+=%%N*115
        set /a MetalGrid+=%%N*50
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeHeavyBlockArmorRoundCorner<" ^< "%file%"') do (
    set "LargeHeavyBlockArmorRoundCorner=%%N"
        set /a SteelPlate+=%%N*110
        set /a MetalGrid+=%%N*40
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeHeavyBlockArmorRoundCornerInv<" ^< "%file%"') do (
    set "LargeHeavyBlockArmorRoundCornerInv=%%N"
        set /a SteelPlate+=%%N*125
        set /a MetalGrid+=%%N*50
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockArmorRoundSlope<" ^< "%file%"') do (
    set "SmallBlockArmorRoundSlope=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockArmorRoundCorner<" ^< "%file%"') do (
    set "SmallBlockArmorRoundCorner=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockArmorRoundCornerInv<" ^< "%file%"') do (
    set "SmallBlockArmorRoundCornerInv=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallHeavyBlockArmorRoundSlope<" ^< "%file%"') do (
    set "SmallHeavyBlockArmorRoundSlope=%%N"
        set /a SteelPlate+=%%N*2
        set /a MetalGrid+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallHeavyBlockArmorRoundCorner<" ^< "%file%"') do (
    set "SmallHeavyBlockArmorRoundCorner=%%N"
        set /a SteelPlate+=%%N*2
        set /a MetalGrid+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallHeavyBlockArmorRoundCornerInv<" ^< "%file%"') do (
    set "SmallHeavyBlockArmorRoundCornerInv=%%N"
        set /a SteelPlate+=%%N*3
        set /a MetalGrid+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )


for /F %%N in ('find /C "<SubtypeName>LargeBlockArmorSlope2Base<" ^< "%file%"') do (
    set "LargeBlockArmorSlope2Base=%%N"
        set /a SteelPlate+=%%N*15
        set /a SteelPlate+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeBlockArmorSlope2Tip<" ^< "%file%"') do (
    set "LargeBlockArmorSlope2Tip=%%N"
        set /a SteelPlate+=%%N*5
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockArmorCorner2Base<" ^< "%file%"') do (
    set "LargeBlockArmorCorner2Base=%%N"
        set /a SteelPlate+=%%N*8
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockArmorCorner2Tip<" ^< "%file%"') do (
    set "LargeBlockArmorCorner2Tip=%%N"
        set /a SteelPlate+=%%N*3
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )


for /F %%N in ('find /C "<SubtypeName>LargeBlockArmorInvCorner2Base<" ^< "%file%"') do (
    set "LargeBlockArmorInvCorner2Base=%%N"
        set /a SteelPlate+=%%N*18
        set /a SteelPlate+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeBlockArmorInvCorner2Tip<" ^< "%file%"') do (
    set "LargeBlockArmorInvCorner2Tip=%%N"
        set /a SteelPlate+=%%N*13
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeHeavyBlockArmorSlope2Base<" ^< "%file%"') do (
    set "LargeHeavyBlockArmorSlope2Base=%%N"
        set /a SteelPlate+=%%N*100
        set /a MetalGrid+=%%N*45
        set /a SteelPlate+=%%N*12
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeHeavyBlockArmorSlope2Tip<" ^< "%file%"') do (
    set "LargeHeavyBlockArmorSlope2Tip=%%N"
        set /a SteelPlate+=%%N*30
        set /a MetalGrid+=%%N*6
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeHeavyBlockArmorCorner2Base<" ^< "%file%"') do (
    set "LargeHeavyBlockArmorCorner2Base=%%N"
        set /a SteelPlate+=%%N*50
        set /a MetalGrid+=%%N*15
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeHeavyBlockArmorCorner2Tip<" ^< "%file%"') do (
    set "LargeHeavyBlockArmorCorner2Tip=%%N"
        set /a SteelPlate+=%%N*17
        set /a MetalGrid+=%%N*6
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeHeavyBlockArmorInvCorner2Base<" ^< "%file%"') do (
    set "LargeHeavyBlockArmorInvCorner2Base=%%N"
        set /a SteelPlate+=%%N*120
        set /a MetalGrid+=%%N*45
        set /a SteelPlate+=%%N*13
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeHeavyBlockArmorInvCorner2Tip<" ^< "%file%"') do (
    set "LargeHeavyBlockArmorInvCorner2Tip=%%N"
        set /a SteelPlate+=%%N*84
        set /a MetalGrid+=%%N*25
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockArmorSlope2Base<" ^< "%file%"') do (
    set "SmallBlockArmorSlope2Base=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallBlockArmorSlope2Tip<" ^< "%file%"') do (
    set "SmallBlockArmorSlope2Tip=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )


for /F %%N in ('find /C "<SubtypeName>SmallBlockArmorCorner2Base<" ^< "%file%"') do (
    set "SmallBlockArmorCorner2Base=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockArmorCorner2Tip<" ^< "%file%"') do (
    set "SmallBlockArmorCorner2Tip=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockArmorInvCorner2Base<" ^< "%file%"') do (
    set "SmallBlockArmorInvCorner2Base=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallBlockArmorInvCorner2Tip<" ^< "%file%"') do (
    set "SmallBlockArmorInvCorner2Tip=%%N"
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallHeavyBlockArmorSlope2Base<" ^< "%file%"') do (
    set "SmallHeavyBlockArmorSlope2Base=%%N"
        set /a SteelPlate+=%%N*2
        set /a MetalGrid+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallHeavyBlockArmorSlope2Tip<" ^< "%file%"') do (
    set "SmallHeavyBlockArmorSlope2Tip=%%N"
        set /a SteelPlate+=%%N*1
        set /a MetalGrid+=%%N*1
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallHeavyBlockArmorCorner2Base<" ^< "%file%"') do (
    set "SmallHeavyBlockArmorCorner2Base=%%N"
        set /a SteelPlate+=%%N*2
        set /a MetalGrid+=%%N*1
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallHeavyBlockArmorCorner2Tip<" ^< "%file%"') do (
    set "SmallHeavyBlockArmorCorner2Tip=%%N"
        set /a SteelPlate+=%%N*1
        set /a MetalGrid+=%%N*1
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallHeavyBlockArmorInvCorner2Base<" ^< "%file%"') do (
    set "SmallHeavyBlockArmorInvCorner2Base=%%N"
        set /a SteelPlate+=%%N*3
        set /a MetalGrid+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallHeavyBlockArmorInvCorner2Tip<" ^< "%file%"') do (
    set "SmallHeavyBlockArmorInvCorner2Tip=%%N"
        set /a SteelPlate+=%%N*3
        set /a MetalGrid+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

REM --- ARMOR BLOCKS END
REM --- AUTOMATION BLOCKS START

for /F %%N in ('find /C "<SubtypeName>SmallProgrammableBlock<" ^< "%file%"') do (
    set "SmallProgrammableBlock=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*2
        set /a LargeTube+=%%N*2
        set /a Motor+=%%N*1
        set /a Display+=%%N*1
        set /a Computer+=%%N*2
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeProjector<" ^< "%file%"') do (
    set "LargeProjector=%%N"
        set /a SteelPlate+=%%N*11
        set /a Construction+=%%N*4
        set /a LargeTube+=%%N*2
        set /a Motor+=%%N*1
        set /a Computer+=%%N*2
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallProjector<" ^< "%file%"') do (
    set "SmallProjector=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*2
        set /a LargeTube+=%%N*2
        set /a Motor+=%%N*1
        set /a Computer+=%%N*2
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockSensor<" ^< "%file%"') do (
    set "SmallBlockSensor=%%N"
        set /a InteriorPlate+=%%N*5
        set /a Construction+=%%N*5
        set /a Computer+=%%N*6
        set /a RadioCommunication+=%%N*4
        set /a Detector+=%%N*6
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockSensor<" ^< "%file%"') do (
    set "LargeBlockSensor=%%N"
        set /a InteriorPlate+=%%N*5
        set /a Construction+=%%N*5
        set /a Computer+=%%N*6
        set /a RadioCommunication+=%%N*4
        set /a Detector+=%%N*6
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallBlockSoundBlock<" ^< "%file%"') do (
    set "SmallBlockSoundBlock=%%N"
        set /a InteriorPlate+=%%N*1
        set /a Construction+=%%N*6
        set /a Computer+=%%N*3
        set /a InteriorPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockSoundBlock<" ^< "%file%"') do (
    set "LargeBlockSoundBlock=%%N"
        set /a InteriorPlate+=%%N*1
        set /a Construction+=%%N*6
        set /a Computer+=%%N*3
        set /a InteriorPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )


for /F %%N in ('find /C "<SubtypeName>ButtonPanelLarge<" ^< "%file%"') do (
    set "ButtonPanelLarge=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a Computer+=%%N*20
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*5
    )

for /F %%N in ('find /C "<SubtypeName>ButtonPanelSmall<" ^< "%file%"') do (
    set "ButtonPanelSmall=%%N"
        set /a InteriorPlate+=%%N*2
        set /a Construction+=%%N*1
        set /a Computer+=%%N*1
        set /a Construction+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*5
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]

for /F %%N in ('find /C "<SubtypeName>TimerBlockLarge<" ^< "%file%"') do (
    set "TimerBlockLarge=%%N"
        set /a InteriorPlate+=%%N*6
        set /a Construction+=%%N*20
        set /a Computer+=%%N*5
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>TimerBlockSmall<" ^< "%file%"') do (
    set "TimerBlockSmall=%%N"
        set /a InteriorPlate+=%%N*2
        set /a Construction+=%%N*2
        set /a Computer+=%%N*1
        set /a Construction+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>LargeProgrammableBlock<" ^< "%file%"') do (
    set "LargeProgrammableBlock=%%N"
        set /a SteelPlate+=%%N*11
        set /a Construction+=%%N*4
        set /a LargeTube+=%%N*2
        set /a Motor+=%%N*1
        set /a Display+=%%N*1
        set /a Computer+=%%N*2
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

REM --- AUTOMATION BLOCKS END
REM --- COMMUNICATION BLOCKS START

for /F %%N in ('find /C "<SubtypeName>LargeBlockRadioAntenna<" ^< "%file%"') do (
    set "LargeBlockRadioAntenna=%%N"
        set /a SteelPlate+=%%N*60
        set /a LargeTube+=%%N*40
        set /a SmallTube+=%%N*60
        set /a Construction+=%%N*30
        set /a Computer+=%%N*8
        set /a RadioCommunication+=%%N*40
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeBlockBeacon<" ^< "%file%"') do (
    set "LargeBlockBeacon=%%N"
        set /a SteelPlate+=%%N*40
        set /a Construction+=%%N*30
        set /a LargeTube+=%%N*20
        set /a Computer+=%%N*10
        set /a RadioCommunication+=%%N*40
        set /a SteelPlate+=%%N*40
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockBeacon<" ^< "%file%"') do (
    set "SmallBlockBeacon=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*1
        set /a SmallTube+=%%N*1
        set /a Computer+=%%N*1
        set /a RadioCommunication+=%%N*4
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockRadioAntenna<" ^< "%file%"') do (
    set "SmallBlockRadioAntenna=%%N"
        set /a SteelPlate+=%%N*1
        set /a SmallTube+=%%N*1
        set /a Construction+=%%N*1
        set /a Computer+=%%N*1
        set /a RadioCommunication+=%%N*4
        set /a Construction+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockRemoteControl<" ^< "%file%"') do (
    set "LargeBlockRemoteControl=%%N"
        set /a InteriorPlate+=%%N*5
        set /a Construction+=%%N*10
        set /a Motor+=%%N*1
        set /a Computer+=%%N*15
        set /a InteriorPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallBlockRemoteControl<" ^< "%file%"') do (
    set "SmallBlockRemoteControl=%%N"
        set /a InteriorPlate+=%%N*1
        set /a Construction+=%%N*1
        set /a Motor+=%%N*1
        set /a Computer+=%%N*1
        set /a InteriorPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockLaserAntenna<" ^< "%file%"') do (
    set "LargeBlockLaserAntenna=%%N"
        set /a SteelPlate+=%%N*40
        set /a Construction+=%%N*40
        set /a Motor+=%%N*16
        set /a Detector+=%%N*30
        set /a RadioCommunication+=%%N*20
        set /a Superconductor+=%%N*100
        set /a Computer+=%%N*50
        set /a BulletproofGlass+=%%N*4
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockLaserAntenna<" ^< "%file%"') do (
    set "SmallBlockLaserAntenna=%%N"
        set /a SteelPlate+=%%N*6
        set /a SmallTube+=%%N*10
        set /a Construction+=%%N*10
        set /a Motor+=%%N*5
        set /a RadioCommunication+=%%N*5
        set /a Superconductor+=%%N*10
        set /a Computer+=%%N*30
        set /a BulletproofGlass+=%%N*2
        set /a SteelPlate+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

REM --- COMMUNICATION BLOCKS END
REM --- CONTROL BLOCKS START

for /F %%N in ('find /C "<SubtypeName>ControlPanel<" ^< "%file%"') do (
    set "ControlPanel=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*1
        set /a Computer+=%%N*1
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*5
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallControlPanel<" ^< "%file%"') do (
    set "SmallControlPanel=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*1
        set /a Computer+=%%N*1
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*5
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockCockpit<" ^< "%file%"') do (
    set "LargeBlockCockpit=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*15
        set /a Motor+=%%N*2
        set /a Computer+=%%N*100
        set /a Display+=%%N*10
        set /a Construction+=%%N*5
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockCockpitSeat<" ^< "%file%"') do (
    set "LargeBlockCockpitSeat=%%N"
        set /a SteelPlate+=%%N*20
        set /a Construction+=%%N*20
        set /a Motor+=%%N*1
        set /a Display+=%%N*8
        set /a Computer+=%%N*100
        set /a SteelPlate+=%%N*10
        set /a BulletproofGlass+=%%N*60
        set /a TOTAL+=%%N
        set /a PCU+=%%N*150
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockCockpit<" ^< "%file%"') do (
    set "SmallBlockCockpit=%%N"
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*10
        set /a Motor+=%%N*1
        set /a Display+=%%N*5
        set /a Computer+=%%N*15
        set /a SteelPlate+=%%N*5
        set /a BulletproofGlass+=%%N*30
        set /a TOTAL+=%%N
        set /a PCU+=%%N*150
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>DBSmallBlockFighterCockpit<" ^< "%file%"') do (
    set "DBSmallBlockFighterCockpit=%%N"
        set /a Construction+=%%N*20
        set /a Motor+=%%N*1
        set /a SteelPlate+=%%N*10
        set /a MetalGrid+=%%N*10
        set /a InteriorPlate+=%%N*15
        set /a Display+=%%N*4
        set /a Computer+=%%N*20
        set /a BulletproofGlass+=%%N*40
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*150
    )

for /F %%N in ('find /C "<SubtypeName>CockpitOpen<" ^< "%file%"') do (
    set "CockpitOpen=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*15
        set /a Motor+=%%N*2
        set /a Computer+=%%N*100
        set /a Display+=%%N*4
        set /a Construction+=%%N*5
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockGyro<" ^< "%file%"') do (
    set "LargeBlockGyro=%%N"
        set /a SteelPlate+=%%N*500
        set /a Construction+=%%N*40
        set /a LargeTube+=%%N*4
        set /a MetalGrid+=%%N*50
        set /a Motor+=%%N*4
        set /a Computer+=%%N*5
        set /a SteelPlate+=%%N*100
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockGyro<" ^< "%file%"') do (
    set "SmallBlockGyro=%%N"
        set /a SteelPlate+=%%N*15
        set /a Construction+=%%N*5
        set /a LargeTube+=%%N*1
        set /a Motor+=%%N*2
        set /a Computer+=%%N*3
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>OpenCockpitSmall<" ^< "%file%"') do (
    set "OpenCockpitSmall=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*15
        set /a Motor+=%%N*1
        set /a Computer+=%%N*15
        set /a Display+=%%N*2
        set /a Construction+=%%N*5
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>OpenCockpitLarge<" ^< "%file%"') do (
    set "OpenCockpitLarge=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*20
        set /a Motor+=%%N*2
        set /a Computer+=%%N*100
        set /a Display+=%%N*6
        set /a Construction+=%%N*10
        set /a InteriorPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*150
    )

REM --- CONTROL BLOCKS END
REM --- DECORATIVE BLOCKS START

for /F %%N in ('find /C "<SubtypeName>LargeBlockDesk<" ^< "%file%"') do (
    set "LargeBlockDesk=%%N"
        set /a InteriorPlate+=%%N*20
        set /a Construction+=%%N*20
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockDeskCorner<" ^< "%file%"') do (
    set "LargeBlockDeskCorner=%%N"
        set /a InteriorPlate+=%%N*15
        set /a Construction+=%%N*15
        set /a InteriorPlate+=%%N*5
        set /a Construction+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeBlockDeskChairless<" ^< "%file%"') do (
    set "LargeBlockDeskChairless=%%N"
        set /a InteriorPlate+=%%N*20
        set /a Construction+=%%N*20
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockDeskChairlessCorner<" ^< "%file%"') do (
    set "LargeBlockDeskChairlessCorner=%%N"
        set /a InteriorPlate+=%%N*15
        set /a Construction+=%%N*15
        set /a InteriorPlate+=%%N*5
        set /a Construction+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockKitchen<" ^< "%file%"') do (
    set "LargeBlockKitchen=%%N"
        set /a InteriorPlate+=%%N*20
        set /a Construction+=%%N*30
        set /a LargeTube+=%%N*6
        set /a Motor+=%%N*6
        set /a BulletproofGlass+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockBed<" ^< "%file%"') do (
    set "LargeBlockBed=%%N"
        set /a InteriorPlate+=%%N*30
        set /a Construction+=%%N*20
        set /a SmallTube+=%%N*8
        set /a BulletproofGlass+=%%N*10
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeBlockLockerRoom<" ^< "%file%"') do (
    set "LargeBlockLockerRoom=%%N"
        set /a InteriorPlate+=%%N*30
        set /a Construction+=%%N*20
        set /a Display+=%%N*4
        set /a BulletproofGlass+=%%N*10
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockLockerRoomCorner<" ^< "%file%"') do (
    set "LargeBlockLockerRoomCorner=%%N"
        set /a InteriorPlate+=%%N*25
        set /a Construction+=%%N*15
        set /a Display+=%%N*4
        set /a BulletproofGlass+=%%N*10
        set /a Construction+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockPlanters<" ^< "%file%"') do (
    set "LargeBlockPlanters=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a SmallTube+=%%N*8
        set /a BulletproofGlass+=%%N*8
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockCouch<" ^< "%file%"') do (
    set "LargeBlockCouch=%%N"
        set /a InteriorPlate+=%%N*20
        set /a Construction+=%%N*20
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeBlockCouchCorner<" ^< "%file%"') do (
    set "LargeBlockCouchCorner=%%N"
        set /a InteriorPlate+=%%N*25
        set /a Construction+=%%N*25
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockLockers<" ^< "%file%"') do (
    set "LargeBlockLockers=%%N"
        set /a InteriorPlate+=%%N*20
        set /a Construction+=%%N*10
        set /a Display+=%%N*3
        set /a Computer+=%%N*2
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockBathroomOpen<" ^< "%file%"') do (
    set "LargeBlockBathroomOpen=%%N"
        set /a InteriorPlate+=%%N*30
        set /a Construction+=%%N*15
        set /a SmallTube+=%%N*8
        set /a Motor+=%%N*4
        set /a LargeTube+=%%N*2
        set /a Construction+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockBathroom<" ^< "%file%"') do (
    set "LargeBlockBathroom=%%N"
        set /a InteriorPlate+=%%N*30
        set /a Construction+=%%N*20
        set /a SmallTube+=%%N*8
        set /a Motor+=%%N*4
        set /a LargeTube+=%%N*2
        set /a Construction+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeBlockToilet<" ^< "%file%"') do (
    set "LargeBlockToilet=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a SmallTube+=%%N*2
        set /a Motor+=%%N*2
        set /a LargeTube+=%%N*1
        set /a Construction+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockConsole<" ^< "%file%"') do (
    set "LargeBlockConsole=%%N"
        set /a InteriorPlate+=%%N*20
        set /a Construction+=%%N*20
        set /a Computer+=%%N*8
        set /a Display+=%%N*10
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*150
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockCockpitIndustrial<" ^< "%file%"') do (
    set "SmallBlockCockpitIndustrial=%%N"
        set /a SteelPlate+=%%N*10
        set /a Construction+=%%N*20
        set /a MetalGrid+=%%N*10
        set /a Motor+=%%N*2
        set /a Display+=%%N*6
        set /a Computer+=%%N*20
        set /a BulletproofGlass+=%%N*60
        set /a SmallTube+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*150
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockCockpitIndustrial<" ^< "%file%"') do (
    set "LargeBlockCockpitIndustrial=%%N"
        set /a SteelPlate+=%%N*20
        set /a Construction+=%%N*30
        set /a MetalGrid+=%%N*15
        set /a Motor+=%%N*2
        set /a Display+=%%N*10
        set /a Computer+=%%N*60
        set /a BulletproofGlass+=%%N*80
        set /a SmallTube+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*150
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 	
REM --- DECORATIVE BLOCKS END
REM --- DECORATIVE 2 BLOCKS START

for /F %%N in ('find /C "<SubtypeName>FoodDispenser<" ^< "%file%"') do (
    set "FoodDispenser=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a Motor+=%%N*4
        set /a Display+=%%N*10
        set /a Computer+=%%N*10
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>Jukebox<" ^< "%file%"') do (
    set "Jukebox=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a Computer+=%%N*4
        set /a Display+=%%N*4
        set /a InteriorPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>LabEquipment<" ^< "%file%"') do (
    set "LabEquipment=%%N"
        set /a InteriorPlate+=%%N*15
        set /a Construction+=%%N*10
        set /a Motor+=%%N*1
        set /a BulletproofGlass+=%%N*4
        set /a Construction+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Shower<" ^< "%file%"') do (
    set "Shower=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*20
        set /a SmallTube+=%%N*12
        set /a BulletproofGlass+=%%N*8
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>WindowWall<" ^< "%file%"') do (
    set "WindowWall=%%N"
        set /a SteelPlate+=%%N*8
        set /a Construction+=%%N*5
        set /a BulletproofGlass+=%%N*10
        set /a Construction+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>WindowWallLeft<" ^< "%file%"') do (
    set "WindowWallLeft=%%N"
        set /a SteelPlate+=%%N*10
        set /a Construction+=%%N*5
        set /a BulletproofGlass+=%%N*8
        set /a Construction+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>WindowWallRight<" ^< "%file%"') do (
    set "WindowWallRight=%%N"
        set /a SteelPlate+=%%N*10
        set /a Construction+=%%N*5
        set /a BulletproofGlass+=%%N*8
        set /a Construction+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>MedicalStation<" ^< "%file%"') do (
    set "MedicalStation=%%N"
        set /a InteriorPlate+=%%N*15
        set /a Construction+=%%N*10
        set /a Motor+=%%N*2
        set /a Medical+=%%N*1
        set /a Display+=%%N*2
        set /a Construction+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>TransparentLCDLarge<" ^< "%file%"') do (
    set "TransparentLCDLarge=%%N"
        set /a Construction+=%%N*8
        set /a Computer+=%%N*6
        set /a Display+=%%N*10
        set /a BulletproofGlass+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>TransparentLCDSmall<" ^< "%file%"') do (
    set "TransparentLCDSmall=%%N"
        set /a Construction+=%%N*4
        set /a Computer+=%%N*4
        set /a Display+=%%N*3
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>Catwalk<" ^< "%file%"') do (
    set "Catwalk=%%N"
        set /a Construction+=%%N*10
        set /a Girder+=%%N*4
        set /a SmallTube+=%%N*20
        set /a Construction+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>CatwalkCorner<" ^< "%file%"') do (
    set "CatwalkCorner=%%N"
        set /a Construction+=%%N*14
        set /a Girder+=%%N*4
        set /a SmallTube+=%%N*32
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>CatwalkStraight<" ^< "%file%"') do (
    set "CatwalkStraight=%%N"
        set /a Construction+=%%N*14
        set /a Girder+=%%N*4
        set /a SmallTube+=%%N*32
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>CatwalkWall<" ^< "%file%"') do (
    set "CatwalkWall=%%N"
        set /a Construction+=%%N*12
        set /a Girder+=%%N*4
        set /a SmallTube+=%%N*26
        set /a Construction+=%%N*8
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>CatwalkRailingEnd<" ^< "%file%"') do (
    set "CatwalkRailingEnd=%%N"
        set /a Construction+=%%N*16
        set /a Girder+=%%N*4
        set /a SmallTube+=%%N*38
        set /a Construction+=%%N*12
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>CatwalkRailingHalfRight<" ^< "%file%"') do (
    set "CatwalkRailingHalfRight=%%N"
        set /a Construction+=%%N*16
        set /a Girder+=%%N*4
        set /a SmallTube+=%%N*36
        set /a Construction+=%%N*12
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>CatwalkRailingHalfLeft<" ^< "%file%"') do (
    set "CatwalkRailingHalfLeft=%%N"
        set /a Construction+=%%N*16
        set /a Girder+=%%N*4
        set /a SmallTube+=%%N*36
        set /a Construction+=%%N*12
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>GratedStairs<" ^< "%file%"') do (
    set "GratedStairs=%%N"
        set /a Construction+=%%N*12
        set /a SmallTube+=%%N*12
        set /a InteriorPlate+=%%N*16
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>GratedHalfStairs<" ^< "%file%"') do (
    set "GratedHalfStairs=%%N"
        set /a Construction+=%%N*10
        set /a SmallTube+=%%N*6
        set /a InteriorPlate+=%%N*8
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>GratedHalfStairsMirrored<" ^< "%file%"') do (
    set "GratedHalfStairsMirrored=%%N"
        set /a Construction+=%%N*10
        set /a SmallTube+=%%N*6
        set /a InteriorPlate+=%%N*8
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>RailingStraight<" ^< "%file%"') do (
    set "RailingStraight=%%N"
        set /a Construction+=%%N*4
        set /a SmallTube+=%%N*6
        set /a Construction+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>RailingDouble<" ^< "%file%"') do (
    set "RailingDouble=%%N"
        set /a Construction+=%%N*8
        set /a SmallTube+=%%N*12
        set /a Construction+=%%N*8
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>RailingCorner<" ^< "%file%"') do (
    set "RailingCorner=%%N"
        set /a Construction+=%%N*8
        set /a SmallTube+=%%N*12
        set /a Construction+=%%N*8
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>RailingDiagonal<" ^< "%file%"') do (
    set "RailingDiagonal=%%N"
        set /a Construction+=%%N*6
        set /a SmallTube+=%%N*9
        set /a Construction+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>RailingHalfRight<" ^< "%file%"') do (
    set "RailingHalfRight=%%N"
        set /a Construction+=%%N*4
        set /a SmallTube+=%%N*4
        set /a Construction+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>RailingHalfLeft<" ^< "%file%"') do (
    set "RailingHalfLeft=%%N"
        set /a Construction+=%%N*4
        set /a SmallTube+=%%N*4
        set /a Construction+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>RotatingLightLarge<" ^< "%file%"') do (
    set "RotatingLightLarge=%%N"
        set /a Construction+=%%N*2
        set /a Motor+=%%N*1
        set /a Construction+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>RotatingLightSmall<" ^< "%file%"') do (
    set "RotatingLightSmall=%%N"
        set /a Construction+=%%N*2
        set /a Motor+=%%N*1
        set /a Construction+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>Freight1<" ^< "%file%"') do (
    set "Freight1=%%N"
        set /a InteriorPlate+=%%N*5
        set /a Construction+=%%N*8
        set /a InteriorPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>Freight2<" ^< "%file%"') do (
    set "Freight2=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*16
        set /a InteriorPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>Freight3<" ^< "%file%"') do (
    set "Freight3=%%N"
        set /a InteriorPlate+=%%N*15
        set /a Construction+=%%N*24
        set /a InteriorPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

REM --- DECORATIVE 2 BLOCKS END
REM --- DOORS BLOCKS START

for /F %%N in ('find /C "MyObjectBuilder_Door" ^< "%file%"') do (
    set "Door=%%N" #NO SUBTYPE ID
        set /a InteriorPlate+=%%N*4
        set /a Construction+=%%N*15
        set /a SmallTube+=%%N*4
        set /a Motor+=%%N*2
        set /a Display+=%%N*1
        set /a Computer+=%%N*2
        set /a InteriorPlate+=%%N*6
        set /a Construction+=%%N*25
        set /a SteelPlate+=%%N*8
        set /a TOTAL+=%%N
        set /a PCU+=%%N*115
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "MyObjectBuilder_AirtightHangarDoor" ^< "%file%"') do (
    set "AirtightHangarDoor=%%N" #NO SUBTYPE ID
        set /a SteelPlate+=%%N*250
        set /a Construction+=%%N*15
        set /a SmallTube+=%%N*40
        set /a Motor+=%%N*16
        set /a Computer+=%%N*2
        set /a Construction+=%%N*25
        set /a SteelPlate+=%%N*100
        set /a TOTAL+=%%N
        set /a PCU+=%%N*115
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockSlideDoor<" ^< "%file%"') do (
    set "LargeBlockSlideDoor=%%N"
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*15
        set /a SmallTube+=%%N*4
        set /a Motor+=%%N*4
        set /a Display+=%%N*1
        set /a Computer+=%%N*2
        set /a Construction+=%%N*25
        set /a BulletproofGlass+=%%N*15
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*115
    )

for /F %%N in ('find /C "<SubtypeName>ArmorCenter<" ^< "%file%"') do (
    set "ArmorCenter=%%N"
        set /a SteelPlate+=%%N*125
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>ArmorCorner<" ^< "%file%"') do (
    set "ArmorCorner=%%N"
        set /a SteelPlate+=%%N*105
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>ArmorInvCorner<" ^< "%file%"') do (
    set "ArmorInvCorner=%%N"
        set /a SteelPlate+=%%N*120
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>ArmorSide<" ^< "%file%"') do (
    set "ArmorSide=%%N"
        set /a SteelPlate+=%%N*115
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallArmorCenter<" ^< "%file%"') do (
    set "SmallArmorCenter=%%N"
        set /a SteelPlate+=%%N*3
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallArmorCorner<" ^< "%file%"') do (
    set "SmallArmorCorner=%%N"
        set /a SteelPlate+=%%N*3
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallArmorInvCorner<" ^< "%file%"') do (
    set "SmallArmorInvCorner=%%N"
        set /a SteelPlate+=%%N*3
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallArmorSide<" ^< "%file%"') do (
    set "SmallArmorSide=%%N"
        set /a SteelPlate+=%%N*3
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

REM --- DOORS BLOCKS END
REM --- ECONOMY BLOCKS START

for /F %%N in ('find /C "<SubtypeName>StoreBlock<" ^< "%file%"') do (
    set "StoreBlock=%%N"
        set /a SteelPlate+=%%N*20
        set /a Construction+=%%N*20
        set /a Motor+=%%N*6
        set /a Display+=%%N*4
        set /a Computer+=%%N*10
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>SafeZoneBlock<" ^< "%file%"') do (
    set "SafeZoneBlock=%%N"
        set /a SteelPlate+=%%N*750
        set /a Construction+=%%N*180
        set /a Gravity+=%%N*10
        set /a ZoneChip+=%%N*5
        set /a MetalGrid+=%%N*80
        set /a Computer+=%%N*120
        set /a SteelPlate+=%%N*50
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>ContractBlock<" ^< "%file%"') do (
    set "ContractBlock=%%N"
        set /a SteelPlate+=%%N*20
        set /a Construction+=%%N*20
        set /a Motor+=%%N*6
        set /a Display+=%%N*4
        set /a Computer+=%%N*10
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>VendingMachine<" ^< "%file%"') do (
    set "VendingMachine=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a Motor+=%%N*4
        set /a Display+=%%N*4
        set /a Computer+=%%N*10
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>AtmBlock<" ^< "%file%"') do (
    set "AtmBlock=%%N"
        set /a SteelPlate+=%%N*10
        set /a Construction+=%%N*20
        set /a Motor+=%%N*2
        set /a Computer+=%%N*10
        set /a Display+=%%N*4
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

REM --- ECONOMY BLOCKS END
REM --- ENERGY BLOCKS START

for /F %%N in ('find /C "<SubtypeName>LargeBlockBatteryBlock<" ^< "%file%"') do (
    set "LargeBlockBatteryBlock=%%N"
        set /a SteelPlate+=%%N*20
        set /a Construction+=%%N*10
        set /a PowerCell+=%%N*80
        set /a Computer+=%%N*25
        set /a Construction+=%%N*20
        set /a SteelPlate+=%%N*60
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallBlockBatteryBlock<" ^< "%file%"') do (
    set "SmallBlockBatteryBlock=%%N"
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*2
        set /a PowerCell+=%%N*20
        set /a Computer+=%%N*2
        set /a Construction+=%%N*3
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockSmallBatteryBlock<" ^< "%file%"') do (
    set "SmallBlockSmallBatteryBlock=%%N"
        set /a SteelPlate+=%%N*2
        set /a Construction+=%%N*1
        set /a PowerCell+=%%N*2
        set /a Computer+=%%N*2
        set /a Construction+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockSmallGenerator<" ^< "%file%"') do (
    set "SmallBlockSmallGenerator=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*10
        set /a MetalGrid+=%%N*2
        set /a LargeTube+=%%N*1
        set /a Reactor+=%%N*3
        set /a Motor+=%%N*1
        set /a Computer+=%%N*10
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockLargeGenerator<" ^< "%file%"') do (
    set "SmallBlockLargeGenerator=%%N"
        set /a SteelPlate+=%%N*40
        set /a Construction+=%%N*9
        set /a MetalGrid+=%%N*9
        set /a LargeTube+=%%N*3
        set /a Reactor+=%%N*95
        set /a Motor+=%%N*5
        set /a Computer+=%%N*25
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeBlockSmallGenerator<" ^< "%file%"') do (
    set "LargeBlockSmallGenerator=%%N"
        set /a SteelPlate+=%%N*50
        set /a Construction+=%%N*40
        set /a MetalGrid+=%%N*4
        set /a LargeTube+=%%N*8
        set /a Reactor+=%%N*100
        set /a Motor+=%%N*6
        set /a Computer+=%%N*25
        set /a SteelPlate+=%%N*30
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockLargeGenerator<" ^< "%file%"') do (
    set "LargeBlockLargeGenerator=%%N"
        set /a SteelPlate+=%%N*800
        set /a Construction+=%%N*70
        set /a MetalGrid+=%%N*40
        set /a LargeTube+=%%N*40
        set /a Superconductor+=%%N*100
        set /a Reactor+=%%N*2000
        set /a Motor+=%%N*20
        set /a Computer+=%%N*75
        set /a SteelPlate+=%%N*200
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>LargeHydrogenEngine<" ^< "%file%"') do (
    set "LargeHydrogenEngine=%%N"
        set /a SteelPlate+=%%N*80
        set /a Construction+=%%N*60
        set /a LargeTube+=%%N*12
        set /a SmallTube+=%%N*20
        set /a Motor+=%%N*12
        set /a Computer+=%%N*4
        set /a PowerCell+=%%N*1
        set /a Construction+=%%N*10
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>SmallHydrogenEngine<" ^< "%file%"') do (
    set "SmallHydrogenEngine=%%N"
        set /a SteelPlate+=%%N*20
        set /a Construction+=%%N*18
        set /a LargeTube+=%%N*4
        set /a SmallTube+=%%N*6
        set /a Motor+=%%N*4
        set /a Computer+=%%N*1
        set /a PowerCell+=%%N*1
        set /a Construction+=%%N*2
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeBlockWindTurbine<" ^< "%file%"') do (
    set "LargeBlockWindTurbine=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Motor+=%%N*8
        set /a Construction+=%%N*20
        set /a Girder+=%%N*24
        set /a Computer+=%%N*2
        set /a InteriorPlate+=%%N*30
        set /a TOTAL+=%%N
        set /a PCU+=%%N*55
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockSolarPanel<" ^< "%file%"') do (
    set "LargeBlockSolarPanel=%%N"
        set /a SteelPlate+=%%N*4
        set /a Construction+=%%N*10
        set /a Girder+=%%N*12
        set /a Computer+=%%N*4
        set /a SolarCell+=%%N*32
        set /a Construction+=%%N*4
        set /a BulletproofGlass+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*55
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockSolarPanel<" ^< "%file%"') do (
    set "SmallBlockSolarPanel=%%N"
        set /a SteelPlate+=%%N*2
        set /a Construction+=%%N*1
        set /a Girder+=%%N*4
        set /a Computer+=%%N*1
        set /a SolarCell+=%%N*8
        set /a Construction+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*55
    )

REM --- ENERGY BLOCKS END
REM --- EXTRAS BLOCKS START

for /F %%N in ('find /C "<SubtypeName>Monolith<" ^< "%file%"') do (
    set "Monolith=%%N"
        set /a SteelPlate+=%%N*130
        set /a Superconductor+=%%N*130
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>Stereolith<" ^< "%file%"') do (
    set "Stereolith=%%N"
        set /a SteelPlate+=%%N*130
        set /a Superconductor+=%%N*130
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>DeadAstronaut<" ^< "%file%"') do (
    set "DeadAstronaut=%%N"
        set /a SteelPlate+=%%N*13
        set /a Superconductor+=%%N*13
        set /a TOTAL+=%%N
    )

for /F %%N in ('find /C "<SubtypeName>LargeDeadAstronaut<" ^< "%file%"') do (
    set "LargeDeadAstronaut=%%N"
        set /a SteelPlate+=%%N*13
        set /a Superconductor+=%%N*13
        set /a TOTAL+=%%N
    )

REM --- EXTRAS BLOCKS END
REM --- FROSTBITE BLOCKS START

for /F %%N in ('find /C "<SubtypeName>LargeBlockRadioAntennaDish<" ^< "%file%"') do (
    set "LargeBlockRadioAntennaDish=%%N"
        set /a Construction+=%%N*10
        set /a Girder+=%%N*120
        set /a SteelPlate+=%%N*60
        set /a Construction+=%%N*30
        set /a Computer+=%%N*8
        set /a RadioCommunication+=%%N*40
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeBlockGate<" ^< "%file%"') do (
    set "LargeBlockGate=%%N"
        set /a SteelPlate+=%%N*600
        set /a Construction+=%%N*40
        set /a SmallTube+=%%N*100
        set /a Motor+=%%N*20
        set /a Computer+=%%N*10
        set /a Construction+=%%N*60
        set /a SteelPlate+=%%N*200
        set /a TOTAL+=%%N
        set /a PCU+=%%N*115
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockOffsetDoor<" ^< "%file%"') do (
    set "LargeBlockOffsetDoor=%%N"
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*15
        set /a SmallTube+=%%N*4
        set /a Motor+=%%N*4
        set /a Display+=%%N*1
        set /a Computer+=%%N*2
        set /a Construction+=%%N*20
        set /a BulletproofGlass+=%%N*6
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*115
    )

for /F %%N in ('find /C "<SubtypeName>DeadBody01<" ^< "%file%"') do (
    set "DeadBody01=%%N"
        set /a BulletproofGlass+=%%N*1
        set /a RadioCommunication+=%%N*1
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>DeadBody02<" ^< "%file%"') do (
    set "DeadBody02=%%N"
        set /a BulletproofGlass+=%%N*1
        set /a RadioCommunication+=%%N*1
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>DeadBody03<" ^< "%file%"') do (
    set "DeadBody03=%%N"
        set /a BulletproofGlass+=%%N*1
        set /a RadioCommunication+=%%N*1
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>DeadBody04<" ^< "%file%"') do (
    set "DeadBody04=%%N"
        set /a BulletproofGlass+=%%N*1
        set /a RadioCommunication+=%%N*1
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>DeadBody05<" ^< "%file%"') do (
    set "DeadBody05=%%N"
        set /a BulletproofGlass+=%%N*1
        set /a RadioCommunication+=%%N*1
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>DeadBody06<" ^< "%file%"') do (
    set "DeadBody06=%%N"
        set /a BulletproofGlass+=%%N*1
        set /a RadioCommunication+=%%N*1
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
REM --- FROSTBITE BLOCKS END
REM --- GRAVITY BLOCKS START

for /F %%N in ('find /C "MyObjectBuilder_GravityGenerator" ^< "%file%"') do (
    set "GravityGenerator=%%N" #NO SUBTYPE ID
        set /a SteelPlate+=%%N*54
        set /a Gravity+=%%N*6
        set /a Construction+=%%N*60
        set /a SteelPlate+=%%N*56
        set /a LargeTube+=%%N*4
        set /a Motor+=%%N*6
        set /a Computer+=%%N*40
        set /a SteelPlate+=%%N*40
        set /a TOTAL+=%%N
        set /a PCU+=%%N*185
    )

for /F %%N in ('find /C "MyObjectBuilder_GravityGeneratorSphere" ^< "%file%"') do (
    set "GravityGeneratorSphere=%%N" #NO SUBTYPE ID
        set /a SteelPlate+=%%N*54
        set /a Gravity+=%%N*6
        set /a Construction+=%%N*60
        set /a SteelPlate+=%%N*56
        set /a LargeTube+=%%N*4
        set /a Motor+=%%N*6
        set /a Computer+=%%N*40
        set /a SteelPlate+=%%N*40
        set /a TOTAL+=%%N
        set /a PCU+=%%N*200
    )

for /F %%N in ('find /C "<SubtypeName>VirtualMassLarge<" ^< "%file%"') do (
    set "VirtualMassLarge=%%N"
        set /a SteelPlate+=%%N*30
        set /a Superconductor+=%%N*20
        set /a Construction+=%%N*30
        set /a Computer+=%%N*20
        set /a Gravity+=%%N*9
        set /a SteelPlate+=%%N*60
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>VirtualMassSmall<" ^< "%file%"') do (
    set "VirtualMassSmall=%%N"
        set /a SteelPlate+=%%N*1
        set /a Superconductor+=%%N*2
        set /a Construction+=%%N*2
        set /a Computer+=%%N*2
        set /a Gravity+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SpaceBallLarge<" ^< "%file%"') do (
    set "SpaceBallLarge=%%N"
        set /a SteelPlate+=%%N*90
        set /a Construction+=%%N*30
        set /a Computer+=%%N*20
        set /a Gravity+=%%N*3
        set /a SteelPlate+=%%N*135
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>SpaceBallSmall<" ^< "%file%"') do (
    set "SpaceBallSmall=%%N"
        set /a SteelPlate+=%%N*50
        set /a Construction+=%%N*10
        set /a Computer+=%%N*7
        set /a Gravity+=%%N*1
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

REM --- GRAVITY BLOCKS END
REM --- INTERIORS BLOCKS START

for /F %%N in ('find /C "MyObjectBuilder_Passage" ^< "%file%"') do (
    set "Passage=%%N" #NO SUBTYPE ID
        set /a InteriorPlate+=%%N*74
        set /a Construction+=%%N*20
        set /a SmallTube+=%%N*48
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeStairs<" ^< "%file%"') do (
    set "LargeStairs=%%N"
        set /a InteriorPlate+=%%N*40
        set /a Construction+=%%N*30
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeRamp<" ^< "%file%"') do (
    set "LargeRamp=%%N"
        set /a InteriorPlate+=%%N*60
        set /a Construction+=%%N*16
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeSteelCatwalk<" ^< "%file%"') do (
    set "LargeSteelCatwalk=%%N"
        set /a InteriorPlate+=%%N*20
        set /a Construction+=%%N*5
        set /a SmallTube+=%%N*20
        set /a InteriorPlate+=%%N*7
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeSteelCatwalk2Sides<" ^< "%file%"') do (
    set "LargeSteelCatwalk2Sides=%%N"
        set /a InteriorPlate+=%%N*20
        set /a Construction+=%%N*7
        set /a SmallTube+=%%N*25
        set /a InteriorPlate+=%%N*12
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeSteelCatwalkCorner<" ^< "%file%"') do (
    set "LargeSteelCatwalkCorner=%%N"
        set /a InteriorPlate+=%%N*20
        set /a Construction+=%%N*7
        set /a SmallTube+=%%N*25
        set /a InteriorPlate+=%%N*12
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeSteelCatwalkPlate<" ^< "%file%"') do (
    set "LargeSteelCatwalkPlate=%%N"
        set /a InteriorPlate+=%%N*15
        set /a Construction+=%%N*7
        set /a SmallTube+=%%N*17
        set /a InteriorPlate+=%%N*8
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeCoverWall<" ^< "%file%"') do (
    set "LargeCoverWall=%%N"
        set /a SteelPlate+=%%N*4
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeCoverWallHalf<" ^< "%file%"') do (
    set "LargeCoverWallHalf=%%N"
        set /a SteelPlate+=%%N*2
        set /a Construction+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockInteriorWall<" ^< "%file%"') do (
    set "LargeBlockInteriorWall=%%N"
        set /a InteriorPlate+=%%N*20
        set /a Construction+=%%N*8
        set /a InteriorPlate+=%%N*5
        set /a Construction+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeInteriorPillar<" ^< "%file%"') do (
    set "LargeInteriorPillar=%%N"
        set /a InteriorPlate+=%%N*25
        set /a Construction+=%%N*10
        set /a SmallTube+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>PassengerSeatLarge<" ^< "%file%"') do (
    set "PassengerSeatLarge=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*20
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>PassengerSeatSmall<" ^< "%file%"') do (
    set "PassengerSeatSmall=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*20
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "MyObjectBuilder_Ladder2" ^< "%file%"') do (
    set "Ladder2=%%N" #NO SUBTYPE ID
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a SmallTube+=%%N*10
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LadderSmall<" ^< "%file%"') do (
    set "LadderSmall=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a SmallTube+=%%N*10
        set /a Construction+=%%N*10
        set /a TOTAL+=%%N
    )

REM --- INTERIORS BLOCKS END
REM --- LCD PANELS BLOCKS START

for /F %%N in ('find /C "<SubtypeName>SmallTextPanel<" ^< "%file%"') do (
    set "SmallTextPanel=%%N"
        set /a InteriorPlate+=%%N*1
        set /a Construction+=%%N*4
        set /a Computer+=%%N*4
        set /a Display+=%%N*3
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallLCDPanelWide<" ^< "%file%"') do (
    set "SmallLCDPanelWide=%%N"
        set /a InteriorPlate+=%%N*1
        set /a Construction+=%%N*8
        set /a Computer+=%%N*8
        set /a Display+=%%N*6
        set /a BulletproofGlass+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallLCDPanel<" ^< "%file%"') do (
    set "SmallLCDPanel=%%N"
        set /a InteriorPlate+=%%N*1
        set /a Construction+=%%N*4
        set /a Computer+=%%N*4
        set /a Display+=%%N*3
        set /a BulletproofGlass+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeBlockCorner_LCD_1<" ^< "%file%"') do (
    set "LargeBlockCorner_LCD_1=%%N"
        set /a Construction+=%%N*5
        set /a Computer+=%%N*3
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockCorner_LCD_2<" ^< "%file%"') do (
    set "LargeBlockCorner_LCD_2=%%N"
        set /a Construction+=%%N*5
        set /a Computer+=%%N*3
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockCorner_LCD_Flat_1<" ^< "%file%"') do (
    set "LargeBlockCorner_LCD_Flat_1=%%N"
        set /a Construction+=%%N*5
        set /a Computer+=%%N*3
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockCorner_LCD_Flat_2<" ^< "%file%"') do (
    set "LargeBlockCorner_LCD_Flat_2=%%N"
        set /a Construction+=%%N*5
        set /a Computer+=%%N*3
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallBlockCorner_LCD_1<" ^< "%file%"') do (
    set "SmallBlockCorner_LCD_1=%%N"
        set /a Construction+=%%N*3
        set /a Computer+=%%N*2
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockCorner_LCD_2<" ^< "%file%"') do (
    set "SmallBlockCorner_LCD_2=%%N"
        set /a Construction+=%%N*3
        set /a Computer+=%%N*2
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockCorner_LCD_Flat_1<" ^< "%file%"') do (
    set "SmallBlockCorner_LCD_Flat_1=%%N"
        set /a Construction+=%%N*3
        set /a Computer+=%%N*2
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockCorner_LCD_Flat_2<" ^< "%file%"') do (
    set "SmallBlockCorner_LCD_Flat_2=%%N"
        set /a Construction+=%%N*3
        set /a Computer+=%%N*2
        set /a Display+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeTextPanel<" ^< "%file%"') do (
    set "LargeTextPanel=%%N"
        set /a InteriorPlate+=%%N*1
        set /a Construction+=%%N*6
        set /a Computer+=%%N*6
        set /a Display+=%%N*10
        set /a BulletproofGlass+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>LargeLCDPanel<" ^< "%file%"') do (
    set "LargeLCDPanel=%%N"
        set /a InteriorPlate+=%%N*1
        set /a Construction+=%%N*6
        set /a Computer+=%%N*6
        set /a Display+=%%N*10
        set /a BulletproofGlass+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>LargeLCDPanelWide<" ^< "%file%"') do (
    set "LargeLCDPanelWide=%%N"
        set /a InteriorPlate+=%%N*2
        set /a Construction+=%%N*12
        set /a Computer+=%%N*12
        set /a Display+=%%N*20
        set /a BulletproofGlass+=%%N*12
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

REM --- LCD PANELS BLOCKS END
REM --- LIGHTS BLOCKS START

for /F %%N in ('find /C "<SubtypeName>LargeBlockFrontLight<" ^< "%file%"') do (
    set "LargeBlockFrontLight=%%N"
        set /a SteelPlate+=%%N*8
        set /a LargeTube+=%%N*2
        set /a InteriorPlate+=%%N*20
        set /a Construction+=%%N*15
        set /a BulletproofGlass+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallBlockFrontLight<" ^< "%file%"') do (
    set "SmallBlockFrontLight=%%N"
        set /a SteelPlate+=%%N*1
        set /a LargeTube+=%%N*1
        set /a InteriorPlate+=%%N*1
        set /a Construction+=%%N*1
        set /a BulletproofGlass+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>SmallLight<" ^< "%file%"') do (
    set "SmallLight=%%N"
        set /a Construction+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockSmallLight<" ^< "%file%"') do (
    set "SmallBlockSmallLight=%%N"
        set /a Construction+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockLight_1corner<" ^< "%file%"') do (
    set "LargeBlockLight_1corner=%%N"
        set /a Construction+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeBlockLight_2corner<" ^< "%file%"') do (
    set "LargeBlockLight_2corner=%%N"
        set /a Construction+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockLight_1corner<" ^< "%file%"') do (
    set "SmallBlockLight_1corner=%%N"
        set /a Construction+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockLight_2corner<" ^< "%file%"') do (
    set "SmallBlockLight_2corner=%%N"
        set /a Construction+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

REM --- LIGHTS BLOCKS END
REM --- LOGISTICS BLOCKS START

for /F %%N in ('find /C "<SubtypeName>OxygenTankSmall<" ^< "%file%"') do (
    set "OxygenTankSmall=%%N"
        set /a SteelPlate+=%%N*10
        set /a LargeTube+=%%N*8
        set /a SmallTube+=%%N*10
        set /a Computer+=%%N*8
        set /a Construction+=%%N*10
        set /a SteelPlate+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "MyObjectBuilder_OxygenTank" ^< "%file%"') do (
    set "OxygenTank=%%N" #NO SUBTYPE ID
        set /a SteelPlate+=%%N*60
        set /a LargeTube+=%%N*40
        set /a SmallTube+=%%N*60
        set /a Computer+=%%N*8
        set /a Construction+=%%N*40
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>LargeHydrogenTank<" ^< "%file%"') do (
    set "LargeHydrogenTank=%%N"
        set /a SteelPlate+=%%N*160
        set /a LargeTube+=%%N*80
        set /a SmallTube+=%%N*60
        set /a Computer+=%%N*8
        set /a Construction+=%%N*40
        set /a SteelPlate+=%%N*120
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>LargeHydrogenTankSmall<" ^< "%file%"') do (
    set "LargeHydrogenTankSmall=%%N"
        set /a SteelPlate+=%%N*60
        set /a LargeTube+=%%N*40
        set /a SmallTube+=%%N*60
        set /a Computer+=%%N*8
        set /a Construction+=%%N*40
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>SmallHydrogenTank<" ^< "%file%"') do (
    set "SmallHydrogenTank=%%N"
        set /a SteelPlate+=%%N*60
        set /a LargeTube+=%%N*40
        set /a SmallTube+=%%N*60
        set /a Computer+=%%N*8
        set /a Construction+=%%N*40
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallHydrogenTankSmall<" ^< "%file%"') do (
    set "SmallHydrogenTankSmall=%%N"
        set /a SteelPlate+=%%N*6
        set /a LargeTube+=%%N*2
        set /a SmallTube+=%%N*4
        set /a Computer+=%%N*8
        set /a Construction+=%%N*6
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "MyObjectBuilder_AirVent" ^< "%file%"') do (
    set "AirVent=%%N" #NO SUBTYPE ID
        set /a SteelPlate+=%%N*30
        set /a Construction+=%%N*20
        set /a Motor+=%%N*10
        set /a Computer+=%%N*5
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>SmallAirVent<" ^< "%file%"') do (
    set "SmallAirVent=%%N"
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*10
        set /a Motor+=%%N*2
        set /a Computer+=%%N*5
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockSmallContainer<" ^< "%file%"') do (
    set "SmallBlockSmallContainer=%%N"
        set /a InteriorPlate+=%%N*2
        set /a Construction+=%%N*1
        set /a Computer+=%%N*1
        set /a Motor+=%%N*1
        set /a Display+=%%N*1
        set /a InteriorPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallBlockMediumContainer<" ^< "%file%"') do (
    set "SmallBlockMediumContainer=%%N"
        set /a InteriorPlate+=%%N*20
        set /a Construction+=%%N*10
        set /a Computer+=%%N*4
        set /a Motor+=%%N*4
        set /a Display+=%%N*1
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockLargeContainer<" ^< "%file%"') do (
    set "SmallBlockLargeContainer=%%N"
        set /a InteriorPlate+=%%N*55
        set /a Construction+=%%N*25
        set /a Computer+=%%N*6
        set /a Motor+=%%N*8
        set /a Display+=%%N*1
        set /a InteriorPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockSmallContainer<" ^< "%file%"') do (
    set "LargeBlockSmallContainer=%%N"
        set /a InteriorPlate+=%%N*30
        set /a Construction+=%%N*35
        set /a MetalGrid+=%%N*4
        set /a SmallTube+=%%N*20
        set /a Motor+=%%N*4
        set /a Display+=%%N*1
        set /a Computer+=%%N*2
        set /a Construction+=%%N*5
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockLargeContainer<" ^< "%file%"') do (
    set "LargeBlockLargeContainer=%%N"
        set /a InteriorPlate+=%%N*300
        set /a Construction+=%%N*60
        set /a MetalGrid+=%%N*24
        set /a SmallTube+=%%N*60
        set /a Motor+=%%N*20
        set /a Display+=%%N*1
        set /a Computer+=%%N*8
        set /a Construction+=%%N*20
        set /a InteriorPlate+=%%N*60
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallBlockConveyor<" ^< "%file%"') do (
    set "SmallBlockConveyor=%%N"
        set /a InteriorPlate+=%%N*2
        set /a Construction+=%%N*4
        set /a Motor+=%%N*1
        set /a InteriorPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockConveyor<" ^< "%file%"') do (
    set "LargeBlockConveyor=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*20
        set /a SmallTube+=%%N*20
        set /a Motor+=%%N*6
        set /a Construction+=%%N*10
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>Collector<" ^< "%file%"') do (
    set "Collector=%%N"
        set /a SteelPlate+=%%N*30
        set /a Construction+=%%N*50
        set /a SmallTube+=%%N*12
        set /a Motor+=%%N*8
        set /a Display+=%%N*4
        set /a Computer+=%%N*10
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>CollectorSmall<" ^< "%file%"') do (
    set "CollectorSmall=%%N"
        set /a SteelPlate+=%%N*25
        set /a Construction+=%%N*35
        set /a SmallTube+=%%N*12
        set /a Motor+=%%N*8
        set /a Display+=%%N*2
        set /a Computer+=%%N*8
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>Connector<" ^< "%file%"') do (
    set "Connector=%%N"
        set /a SteelPlate+=%%N*130
        set /a Construction+=%%N*40
        set /a SmallTube+=%%N*12
        set /a Motor+=%%N*8
        set /a Computer+=%%N*20
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*125
    )

for /F %%N in ('find /C "<SubtypeName>ConnectorSmall<" ^< "%file%"') do (
    set "ConnectorSmall=%%N"
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*4
        set /a SmallTube+=%%N*2
        set /a Motor+=%%N*1
        set /a Computer+=%%N*4
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*125
    )

for /F %%N in ('find /C "<SubtypeName>ConnectorMedium<" ^< "%file%"') do (
    set "ConnectorMedium=%%N"
        set /a SteelPlate+=%%N*15
        set /a Construction+=%%N*12
        set /a SmallTube+=%%N*6
        set /a Motor+=%%N*6
        set /a Computer+=%%N*6
        set /a SteelPlate+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*125
    )

for /F %%N in ('find /C "<SubtypeName>ConveyorTube<" ^< "%file%"') do (
    set "ConveyorTube=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*20
        set /a SmallTube+=%%N*12
        set /a Motor+=%%N*6
        set /a InteriorPlate+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>ConveyorTubeSmall<" ^< "%file%"') do (
    set "ConveyorTubeSmall=%%N"
        set /a InteriorPlate+=%%N*1
        set /a Motor+=%%N*1
        set /a Construction+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>ConveyorTubeMedium<" ^< "%file%"') do (
    set "ConveyorTubeMedium=%%N"
        set /a InteriorPlate+=%%N*8
        set /a Construction+=%%N*20
        set /a SmallTube+=%%N*10
        set /a Motor+=%%N*6
        set /a InteriorPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>ConveyorFrameMedium<" ^< "%file%"') do (
    set "ConveyorFrameMedium=%%N"
        set /a InteriorPlate+=%%N*4
        set /a Construction+=%%N*12
        set /a SmallTube+=%%N*5
        set /a Motor+=%%N*2
        set /a InteriorPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>ConveyorTubeCurved<" ^< "%file%"') do (
    set "ConveyorTubeCurved=%%N"
        set /a InteriorPlate+=%%N*10
        set /a Construction+=%%N*20
        set /a SmallTube+=%%N*12
        set /a Motor+=%%N*6
        set /a InteriorPlate+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>ConveyorTubeSmallCurved<" ^< "%file%"') do (
    set "ConveyorTubeSmallCurved=%%N"
        set /a InteriorPlate+=%%N*1
        set /a Motor+=%%N*1
        set /a Construction+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>ConveyorTubeCurvedMedium<" ^< "%file%"') do (
    set "ConveyorTubeCurvedMedium=%%N"
        set /a InteriorPlate+=%%N*2
        set /a Construction+=%%N*20
        set /a SmallTube+=%%N*10
        set /a Motor+=%%N*6
        set /a InteriorPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*10
    )

for /F %%N in ('find /C "<SubtypeName>SmallShipConveyorHub<" ^< "%file%"') do (
    set "SmallShipConveyorHub=%%N"
        set /a InteriorPlate+=%%N*20
        set /a Construction+=%%N*30
        set /a SmallTube+=%%N*25
        set /a Motor+=%%N*2
        set /a Construction+=%%N*15
        set /a InteriorPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockConveyorSorter<" ^< "%file%"') do (
    set "LargeBlockConveyorSorter=%%N"
        set /a InteriorPlate+=%%N*40
        set /a Construction+=%%N*100
        set /a SmallTube+=%%N*50
        set /a Computer+=%%N*20
        set /a Motor+=%%N*2
        set /a Construction+=%%N*20
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>MediumBlockConveyorSorter<" ^< "%file%"') do (
    set "MediumBlockConveyorSorter=%%N"
        set /a InteriorPlate+=%%N*4
        set /a Construction+=%%N*10
        set /a SmallTube+=%%N*5
        set /a Computer+=%%N*5
        set /a Motor+=%%N*2
        set /a Construction+=%%N*2
        set /a InteriorPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockConveyorSorter<" ^< "%file%"') do (
    set "SmallBlockConveyorSorter=%%N"
        set /a InteriorPlate+=%%N*4
        set /a Construction+=%%N*10
        set /a SmallTube+=%%N*5
        set /a Computer+=%%N*5
        set /a Motor+=%%N*2
        set /a Construction+=%%N*2
        set /a InteriorPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

REM --- LOGISTICS BLOCKS END
REM --- MECHANICAL BLOCKS START

for /F %%N in ('find /C "<SubtypeName>LargePistonBase<" ^< "%file%"') do (
    set "LargePistonBase=%%N"
        set /a SteelPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a LargeTube+=%%N*4
        set /a Motor+=%%N*4
        set /a Computer+=%%N*2
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )


for /F %%N in ('find /C "<SubtypeName>LargePistonTop<" ^< "%file%"') do (
    set "LargePistonTop=%%N"
        set /a SteelPlate+=%%N*10
        set /a LargeTube+=%%N*8
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallPistonBase<" ^< "%file%"') do (
    set "SmallPistonBase=%%N"
        set /a SteelPlate+=%%N*2
        set /a Construction+=%%N*4
        set /a SmallTube+=%%N*4
        set /a Motor+=%%N*2
        set /a Computer+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

for /F %%N in ('find /C "<SubtypeName>SmallPistonTop<" ^< "%file%"') do (
    set "SmallPistonTop=%%N"
        set /a SteelPlate+=%%N*4
        set /a LargeTube+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeStator<" ^< "%file%"') do (
    set "LargeStator=%%N"
        set /a SteelPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a LargeTube+=%%N*4
        set /a Motor+=%%N*4
        set /a Computer+=%%N*2
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

for /F %%N in ('find /C "<SubtypeName>LargeRotor<" ^< "%file%"') do (
    set "LargeRotor=%%N"
        set /a SteelPlate+=%%N*30
        set /a LargeTube+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallStator<" ^< "%file%"') do (
    set "SmallStator=%%N"
        set /a SteelPlate+=%%N*3
        set /a Construction+=%%N*5
        set /a SmallTube+=%%N*1
        set /a Motor+=%%N*1
        set /a Computer+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

for /F %%N in ('find /C "<SubtypeName>SmallRotor<" ^< "%file%"') do (
    set "SmallRotor=%%N"
        set /a SteelPlate+=%%N*12
        set /a SmallTube+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeAdvancedStator<" ^< "%file%"') do (
    set "LargeAdvancedStator=%%N"
        set /a SteelPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a LargeTube+=%%N*4
        set /a Motor+=%%N*4
        set /a Computer+=%%N*2
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

for /F %%N in ('find /C "<SubtypeName>LargeAdvancedRotor<" ^< "%file%"') do (
    set "LargeAdvancedRotor=%%N"
        set /a SteelPlate+=%%N*30
        set /a LargeTube+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallAdvancedStator<" ^< "%file%"') do (
    set "SmallAdvancedStator=%%N"
        set /a SteelPlate+=%%N*3
        set /a Construction+=%%N*5
        set /a SmallTube+=%%N*1
        set /a Motor+=%%N*1
        set /a Computer+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

for /F %%N in ('find /C "<SubtypeName>SmallAdvancedRotor<" ^< "%file%"') do (
    set "SmallAdvancedRotor=%%N"
        set /a SteelPlate+=%%N*30
        set /a LargeTube+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

REM --- MECHANICAL BLOCKS END
REM --- MEDICAL BLOCKS START

for /F %%N in ('find /C "<SubtypeName>LargeMedicalRoom<" ^< "%file%"') do (
    set "LargeMedicalRoom=%%N"
        set /a InteriorPlate+=%%N*220
        set /a Construction+=%%N*80
        set /a MetalGrid+=%%N*60
        set /a SmallTube+=%%N*20
        set /a LargeTube+=%%N*5
        set /a Display+=%%N*10
        set /a Computer+=%%N*10
        set /a Medical+=%%N*15
        set /a InteriorPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*30
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockCryoChamber<" ^< "%file%"') do (
    set "LargeBlockCryoChamber=%%N"
        set /a InteriorPlate+=%%N*30
        set /a Construction+=%%N*20
        set /a Motor+=%%N*8
        set /a Display+=%%N*8
        set /a Medical+=%%N*3
        set /a Computer+=%%N*30
        set /a InteriorPlate+=%%N*10
        set /a BulletproofGlass+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallBlockCryoChamber<" ^< "%file%"') do (
    set "SmallBlockCryoChamber=%%N"
        set /a InteriorPlate+=%%N*15
        set /a Construction+=%%N*10
        set /a Motor+=%%N*4
        set /a Display+=%%N*4
        set /a Medical+=%%N*3
        set /a Computer+=%%N*15
        set /a InteriorPlate+=%%N*5
        set /a BulletproofGlass+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

REM --- MEDICAL BLOCKS END
REM --- PRODUCTION BLOCKS START

for /F %%N in ('find /C "<SubtypeName>LargeRefinery<" ^< "%file%"') do (
    set "LargeRefinery=%%N"
        set /a SteelPlate+=%%N*1100
        set /a Construction+=%%N*40
        set /a LargeTube+=%%N*20
        set /a Motor+=%%N*16
        set /a MetalGrid+=%%N*20
        set /a Computer+=%%N*20
        set /a SteelPlate+=%%N*100
        set /a TOTAL+=%%N
        set /a PCU+=%%N*90
    )

for /F %%N in ('find /C "<SubtypeName>Blast Furnace<" ^< "%file%"') do (
    set "Blast Furnace=%%N"
        set /a SteelPlate+=%%N*100
        set /a Construction+=%%N*20
        set /a Motor+=%%N*10
        set /a Computer+=%%N*10
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*75
    )

for /F %%N in ('find /C "MyObjectBuilder_OxygenGenerator" ^< "%file%"') do (
    set "OxygenGenerator=%%N" #NO SUBTYPE ID
        set /a SteelPlate+=%%N*110
        set /a Construction+=%%N*5
        set /a LargeTube+=%%N*2
        set /a Motor+=%%N*4
        set /a Computer+=%%N*5
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>OxygenGeneratorSmall<" ^< "%file%"') do (
    set "OxygenGeneratorSmall=%%N"
        set /a SteelPlate+=%%N*6
        set /a Construction+=%%N*8
        set /a LargeTube+=%%N*2
        set /a Motor+=%%N*1
        set /a Computer+=%%N*3
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>LargeAssembler<" ^< "%file%"') do (
    set "LargeAssembler=%%N"
        set /a SteelPlate+=%%N*120
        set /a Construction+=%%N*80
        set /a Motor+=%%N*20
        set /a Display+=%%N*10
        set /a MetalGrid+=%%N*10
        set /a Computer+=%%N*160
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*40
    )

for /F %%N in ('find /C "<SubtypeName>BasicAssembler<" ^< "%file%"') do (
    set "BasicAssembler=%%N"
        set /a SteelPlate+=%%N*60
        set /a Construction+=%%N*40
        set /a Motor+=%%N*10
        set /a Display+=%%N*4
        set /a Computer+=%%N*80
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*40
    )

for /F %%N in ('find /C "<SubtypeName>SurvivalKitLarge<" ^< "%file%"') do (
    set "SurvivalKitLarge=%%N"
        set /a SteelPlate+=%%N*20
        set /a Construction+=%%N*2
        set /a Medical+=%%N*3
        set /a Motor+=%%N*4
        set /a Display+=%%N*1
        set /a Computer+=%%N*5
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*140
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SurvivalKit<" ^< "%file%"') do (
    set "SurvivalKit=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*2
        set /a Medical+=%%N*3
        set /a Motor+=%%N*4
        set /a Display+=%%N*1
        set /a Computer+=%%N*5
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*140
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockOxygenFarm<" ^< "%file%"') do (
    set "LargeBlockOxygenFarm=%%N"
        set /a SteelPlate+=%%N*40
        set /a BulletproofGlass+=%%N*60
        set /a LargeTube+=%%N*20
        set /a SmallTube+=%%N*10
        set /a Construction+=%%N*20
        set /a Computer+=%%N*20
        set /a BulletproofGlass+=%%N*40
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>LargeProductivityModule<" ^< "%file%"') do (
    set "LargeProductivityModule=%%N"
        set /a SteelPlate+=%%N*80
        set /a Construction+=%%N*40
        set /a SmallTube+=%%N*20
        set /a Computer+=%%N*60
        set /a Motor+=%%N*4
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeEffectivenessModule<" ^< "%file%"') do (
    set "LargeEffectivenessModule=%%N"
        set /a SteelPlate+=%%N*80
        set /a Construction+=%%N*50
        set /a SmallTube+=%%N*15
        set /a Superconductor+=%%N*20
        set /a Motor+=%%N*4
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeEnergyModule<" ^< "%file%"') do (
    set "LargeEnergyModule=%%N"
        set /a SteelPlate+=%%N*80
        set /a Construction+=%%N*40
        set /a SmallTube+=%%N*20
        set /a PowerCell+=%%N*20
        set /a Motor+=%%N*4
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )
REM --- PRODUCTION BLOCKS START
REM --- THRUSTER BLOCKS START

for /F %%N in ('find /C "<SubtypeName>SmallBlockSmallThrust<" ^< "%file%"') do (
    set "SmallBlockSmallThrust=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*1
        set /a LargeTube+=%%N*1
        set /a Thrust+=%%N*1
        set /a Construction+=%%N*1
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockLargeThrust<" ^< "%file%"') do (
    set "SmallBlockLargeThrust=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*1
        set /a LargeTube+=%%N*5
        set /a Thrust+=%%N*12
        set /a Construction+=%%N*1
        set /a SteelPlate+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockSmallThrust<" ^< "%file%"') do (
    set "LargeBlockSmallThrust=%%N"
        set /a SteelPlate+=%%N*15
        set /a Construction+=%%N*40
        set /a LargeTube+=%%N*8
        set /a Thrust+=%%N*80
        set /a Construction+=%%N*20
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeBlockLargeThrust<" ^< "%file%"') do (
    set "LargeBlockLargeThrust=%%N"
        set /a SteelPlate+=%%N*100
        set /a Construction+=%%N*70
        set /a LargeTube+=%%N*40
        set /a Thrust+=%%N*960
        set /a Construction+=%%N*30
        set /a SteelPlate+=%%N*50
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockLargeHydrogenThrust<" ^< "%file%"') do (
    set "LargeBlockLargeHydrogenThrust=%%N"
        set /a SteelPlate+=%%N*100
        set /a Construction+=%%N*150
        set /a MetalGrid+=%%N*250
        set /a LargeTube+=%%N*40
        set /a Construction+=%%N*30
        set /a SteelPlate+=%%N*50
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockSmallHydrogenThrust<" ^< "%file%"') do (
    set "LargeBlockSmallHydrogenThrust=%%N"
        set /a SteelPlate+=%%N*15
        set /a Construction+=%%N*40
        set /a MetalGrid+=%%N*40
        set /a LargeTube+=%%N*8
        set /a Construction+=%%N*20
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockLargeHydrogenThrust<" ^< "%file%"') do (
    set "SmallBlockLargeHydrogenThrust=%%N"
        set /a SteelPlate+=%%N*20
        set /a Construction+=%%N*20
        set /a MetalGrid+=%%N*22
        set /a LargeTube+=%%N*10
        set /a Construction+=%%N*10
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallBlockSmallHydrogenThrust<" ^< "%file%"') do (
    set "SmallBlockSmallHydrogenThrust=%%N"
        set /a SteelPlate+=%%N*2
        set /a Construction+=%%N*10
        set /a MetalGrid+=%%N*4
        set /a LargeTube+=%%N*2
        set /a Construction+=%%N*5
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockLargeAtmosphericThrust<" ^< "%file%"') do (
    set "LargeBlockLargeAtmosphericThrust=%%N"
        set /a SteelPlate+=%%N*100
        set /a Construction+=%%N*40
        set /a LargeTube+=%%N*50
        set /a MetalGrid+=%%N*40
        set /a Motor+=%%N*1100
        set /a Construction+=%%N*20
        set /a SteelPlate+=%%N*130
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockSmallAtmosphericThrust<" ^< "%file%"') do (
    set "LargeBlockSmallAtmosphericThrust=%%N"
        set /a SteelPlate+=%%N*15
        set /a Construction+=%%N*30
        set /a LargeTube+=%%N*8
        set /a MetalGrid+=%%N*10
        set /a Motor+=%%N*110
        set /a Construction+=%%N*20
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockLargeAtmosphericThrust<" ^< "%file%"') do (
    set "SmallBlockLargeAtmosphericThrust=%%N"
        set /a SteelPlate+=%%N*10
        set /a Construction+=%%N*20
        set /a LargeTube+=%%N*4
        set /a MetalGrid+=%%N*8
        set /a Motor+=%%N*90
        set /a Construction+=%%N*10
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallBlockSmallAtmosphericThrust<" ^< "%file%"') do (
    set "SmallBlockSmallAtmosphericThrust=%%N"
        set /a SteelPlate+=%%N*2
        set /a Construction+=%%N*20
        set /a LargeTube+=%%N*1
        set /a MetalGrid+=%%N*1
        set /a Motor+=%%N*18
        set /a Construction+=%%N*2
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*15
    )

REM --- THRUSTER BLOCKS END
REM --- TOOLS BLOCKS START

for /F %%N in ('find /C "<SubtypeName>SmallBlockDrill<" ^< "%file%"') do (
    set "SmallBlockDrill=%%N"
        set /a SteelPlate+=%%N*20
        set /a Construction+=%%N*30
        set /a LargeTube+=%%N*4
        set /a Motor+=%%N*1
        set /a Computer+=%%N*1
        set /a SteelPlate+=%%N*12
        set /a TOTAL+=%%N
        set /a PCU+=%%N*190
    )

for /F %%N in ('find /C "<SubtypeName>LargeBlockDrill<" ^< "%file%"') do (
    set "LargeBlockDrill=%%N"
        set /a SteelPlate+=%%N*180
        set /a Construction+=%%N*40
        set /a LargeTube+=%%N*12
        set /a Motor+=%%N*5
        set /a Computer+=%%N*5
        set /a SteelPlate+=%%N*120
        set /a TOTAL+=%%N
        set /a PCU+=%%N*190
    )

for /F %%N in ('find /C "<SubtypeName>LargeShipGrinder<" ^< "%file%"') do (
    set "LargeShipGrinder=%%N"
        set /a SteelPlate+=%%N*15
        set /a Construction+=%%N*25
        set /a LargeTube+=%%N*1
        set /a Motor+=%%N*4
        set /a Computer+=%%N*2
        set /a Construction+=%%N*5
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallShipGrinder<" ^< "%file%"') do (
    set "SmallShipGrinder=%%N"
        set /a SteelPlate+=%%N*10
        set /a Construction+=%%N*15
        set /a SmallTube+=%%N*4
        set /a Motor+=%%N*4
        set /a Computer+=%%N*2
        set /a Construction+=%%N*2
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

for /F %%N in ('find /C "<SubtypeName>LargeShipWelder<" ^< "%file%"') do (
    set "LargeShipWelder=%%N"
        set /a SteelPlate+=%%N*15
        set /a Construction+=%%N*25
        set /a LargeTube+=%%N*1
        set /a Motor+=%%N*2
        set /a Computer+=%%N*2
        set /a Construction+=%%N*5
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*150
    )

for /F %%N in ('find /C "<SubtypeName>SmallShipWelder<" ^< "%file%"') do (
    set "SmallShipWelder=%%N"
        set /a SteelPlate+=%%N*10
        set /a Construction+=%%N*15
        set /a SmallTube+=%%N*6
        set /a Motor+=%%N*2
        set /a Computer+=%%N*2
        set /a Construction+=%%N*2
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*150
    )

for /F %%N in ('find /C "<SubtypeName>LargeOreDetector<" ^< "%file%"') do (
    set "LargeOreDetector=%%N"
        set /a SteelPlate+=%%N*30
        set /a Construction+=%%N*40
        set /a Motor+=%%N*5
        set /a Computer+=%%N*25
        set /a Detector+=%%N*20
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*40
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallBlockOreDetector<" ^< "%file%"') do (
    set "SmallBlockOreDetector=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*2
        set /a Motor+=%%N*1
        set /a Computer+=%%N*1
        set /a Detector+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*40
    )

REM --- TOOLS BLOCKS END
REM --- UTILITY BLOCKS START

for /F %%N in ('find /C "<SubtypeName>LargeBlockLandingGear<" ^< "%file%"') do (
    set "LargeBlockLandingGear=%%N"
        set /a SteelPlate+=%%N*100
        set /a Construction+=%%N*20
        set /a Motor+=%%N*6
        set /a SteelPlate+=%%N*50
        set /a TOTAL+=%%N
        set /a PCU+=%%N*35
    )

for /F %%N in ('find /C "<SubtypeName>SmallBlockLandingGear<" ^< "%file%"') do (
    set "SmallBlockLandingGear=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*5
        set /a Motor+=%%N*1
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*35
    )

for /F %%N in ('find /C "<SubtypeName>LargeJumpDrive<" ^< "%file%"') do (
    set "LargeJumpDrive=%%N"
        set /a SteelPlate+=%%N*40
        set /a MetalGrid+=%%N*50
        set /a Gravity+=%%N*20
        set /a Detector+=%%N*20
        set /a PowerCell+=%%N*120
        set /a Superconductor+=%%N*1000
        set /a Computer+=%%N*300
        set /a Construction+=%%N*40
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallCameraBlock<" ^< "%file%"') do (
    set "SmallCameraBlock=%%N"
        set /a SteelPlate+=%%N*1
        set /a Computer+=%%N*3
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>LargeCameraBlock<" ^< "%file%"') do (
    set "LargeCameraBlock=%%N"
        set /a SteelPlate+=%%N*1
        set /a Computer+=%%N*3
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>LargeShipMergeBlock<" ^< "%file%"') do (
    set "LargeShipMergeBlock=%%N"
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*15
        set /a Motor+=%%N*2
        set /a LargeTube+=%%N*6
        set /a Computer+=%%N*2
        set /a SteelPlate+=%%N*7
        set /a TOTAL+=%%N
        set /a PCU+=%%N*125
    )

for /F %%N in ('find /C "<SubtypeName>SmallShipMergeBlock<" ^< "%file%"') do (
    set "SmallShipMergeBlock=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*5
        set /a Motor+=%%N*1
        set /a SmallTube+=%%N*2
        set /a Computer+=%%N*1
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*125
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LgParachute<" ^< "%file%"') do (
    set "LgParachute=%%N"
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*25
        set /a SmallTube+=%%N*5
        set /a Motor+=%%N*3
        set /a Computer+=%%N*2
        set /a SteelPlate+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmParachute<" ^< "%file%"') do (
    set "SmParachute=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*2
        set /a SmallTube+=%%N*1
        set /a Motor+=%%N*1
        set /a Computer+=%%N*1
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

REM --- UTILITY BLOCKS END
REM --- WEAPONS BLOCKS START

for /F %%N in ('find /C "<SubtypeName>LargeWarhead<" ^< "%file%"') do (
    set "LargeWarhead=%%N"
        set /a SteelPlate+=%%N*10
        set /a Girder+=%%N*24
        set /a Construction+=%%N*12
        set /a SmallTube+=%%N*12
        set /a Computer+=%%N*2
        set /a Explosives+=%%N*6
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

for /F %%N in ('find /C "<SubtypeName>SmallWarhead<" ^< "%file%"') do (
    set "SmallWarhead=%%N"
        set /a SteelPlate+=%%N*1
        set /a Girder+=%%N*1
        set /a Construction+=%%N*1
        set /a SmallTube+=%%N*2
        set /a Computer+=%%N*1
        set /a Explosives+=%%N*2
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeDecoy<" ^< "%file%"') do (
    set "LargeDecoy=%%N"
        set /a SteelPlate+=%%N*10
        set /a Construction+=%%N*10
        set /a Computer+=%%N*10
        set /a RadioCommunication+=%%N*1
        set /a LargeTube+=%%N*2
        set /a SteelPlate+=%%N*20
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallDecoy<" ^< "%file%"') do (
    set "SmallDecoy=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*1
        set /a Computer+=%%N*1
        set /a RadioCommunication+=%%N*1
        set /a SmallTube+=%%N*2
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "MyObjectBuilder_LargeGatlingTurret" ^< "%file%"') do (
    set "LargeGatlingTurret=%%N" #NO SUBTYPE ID
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*25
        set /a MetalGrid+=%%N*15
        set /a SmallTube+=%%N*6
        set /a Motor+=%%N*8
        set /a Computer+=%%N*10
        set /a Construction+=%%N*5
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*225
    )

for /F %%N in ('find /C "<SubtypeName>SmallGatlingTurret<" ^< "%file%"') do (
    set "SmallGatlingTurret=%%N"
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*25
        set /a MetalGrid+=%%N*5
        set /a SmallTube+=%%N*6
        set /a Motor+=%%N*4
        set /a Computer+=%%N*10
        set /a Construction+=%%N*5
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*225
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "MyObjectBuilder_LargeMissileTurret" ^< "%file%"') do (
    set "LargeMissileTurret=%%N" #NO SUBTYPE ID
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*30
        set /a MetalGrid+=%%N*5
        set /a LargeTube+=%%N*6
        set /a Motor+=%%N*16
        set /a Computer+=%%N*12
        set /a Construction+=%%N*10
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*275
    )

for /F %%N in ('find /C "<SubtypeName>SmallMissileTurret<" ^< "%file%"') do (
    set "SmallMissileTurret=%%N"
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*30
        set /a MetalGrid+=%%N*2
        set /a LargeTube+=%%N*2
        set /a Motor+=%%N*8
        set /a Computer+=%%N*12
        set /a Construction+=%%N*10
        set /a SteelPlate+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*100
    )

for /F %%N in ('find /C "<SubtypeName>LargeInteriorTurret<" ^< "%file%"') do (
    set "LargeInteriorTurret=%%N"
        set /a InteriorPlate+=%%N*6
        set /a Construction+=%%N*15
        set /a SmallTube+=%%N*1
        set /a Motor+=%%N*2
        set /a Computer+=%%N*5
        set /a Construction+=%%N*5
        set /a SteelPlate+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*125
    )

for /F %%N in ('find /C "MyObjectBuilder_SmallMissileLauncher" ^< "%file%"') do (
    set "SmallMissileLauncher=%%N" #NO SUBTYPE ID
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*2
        set /a MetalGrid+=%%N*1
        set /a LargeTube+=%%N*4
        set /a Motor+=%%N*1
        set /a Computer+=%%N*1
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*425
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>LargeMissileLauncher<" ^< "%file%"') do (
    set "LargeMissileLauncher=%%N"
        set /a SteelPlate+=%%N*20
        set /a Construction+=%%N*8
        set /a MetalGrid+=%%N*30
        set /a LargeTube+=%%N*25
        set /a Motor+=%%N*6
        set /a Computer+=%%N*4
        set /a SteelPlate+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*825
    )

for /F %%N in ('find /C "<SubtypeName>SmallRocketLauncherReload<" ^< "%file%"') do (
    set "SmallRocketLauncherReload=%%N"
        set /a SmallTube+=%%N*50
        set /a InteriorPlate+=%%N*40
        set /a Construction+=%%N*24
        set /a LargeTube+=%%N*8
        set /a MetalGrid+=%%N*10
        set /a Motor+=%%N*4
        set /a Computer+=%%N*2
        set /a SteelPlate+=%%N*8
        set /a InteriorPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*425
    )

for /F %%N in ('find /C "MyObjectBuilder_SmallGatlingGun" ^< "%file%"') do (
    set "SmallGatlingGun=%%N" #NO SUBTYPE ID
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*1
        set /a MetalGrid+=%%N*2
        set /a SmallTube+=%%N*6
        set /a Motor+=%%N*1
        set /a Computer+=%%N*1
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*80
    )

REM --- WEAPONS BLOCKS END
REM --- WHEELS BLOCKS START

for /F %%N in ('find /C "<SubtypeName>Suspension3x3<" ^< "%file%"') do (
    set "Suspension3x3=%%N"
        set /a SteelPlate+=%%N*15
        set /a Construction+=%%N*15
        set /a LargeTube+=%%N*6
        set /a SmallTube+=%%N*12
        set /a Motor+=%%N*6
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>Suspension5x5<" ^< "%file%"') do (
    set "Suspension5x5=%%N"
        set /a SteelPlate+=%%N*40
        set /a Construction+=%%N*40
        set /a LargeTube+=%%N*20
        set /a SmallTube+=%%N*30
        set /a Motor+=%%N*20
        set /a SteelPlate+=%%N*30
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>Suspension1x1<" ^< "%file%"') do (
    set "Suspension1x1=%%N"
        set /a SteelPlate+=%%N*15
        set /a Construction+=%%N*15
        set /a LargeTube+=%%N*6
        set /a SmallTube+=%%N*12
        set /a Motor+=%%N*6
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallSuspension3x3<" ^< "%file%"') do (
    set "SmallSuspension3x3=%%N"
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*7
        set /a SmallTube+=%%N*2
        set /a Motor+=%%N*1
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallSuspension5x5<" ^< "%file%"') do (
    set "SmallSuspension5x5=%%N"
        set /a SteelPlate+=%%N*10
        set /a Construction+=%%N*12
        set /a SmallTube+=%%N*4
        set /a Motor+=%%N*2
        set /a SteelPlate+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallSuspension1x1<" ^< "%file%"') do (
    set "SmallSuspension1x1=%%N"
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*7
        set /a SmallTube+=%%N*2
        set /a Motor+=%%N*1
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>Suspension3x3mirrored<" ^< "%file%"') do (
    set "Suspension3x3mirrored=%%N"
        set /a SteelPlate+=%%N*15
        set /a Construction+=%%N*15
        set /a LargeTube+=%%N*6
        set /a SmallTube+=%%N*12
        set /a Motor+=%%N*6
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>Suspension5x5mirrored<" ^< "%file%"') do (
    set "Suspension5x5mirrored=%%N"
        set /a SteelPlate+=%%N*40
        set /a Construction+=%%N*40
        set /a LargeTube+=%%N*20
        set /a SmallTube+=%%N*30
        set /a Motor+=%%N*20
        set /a SteelPlate+=%%N*30
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>Suspension1x1mirrored<" ^< "%file%"') do (
    set "Suspension1x1mirrored=%%N"
        set /a SteelPlate+=%%N*15
        set /a Construction+=%%N*15
        set /a LargeTube+=%%N*6
        set /a SmallTube+=%%N*12
        set /a Motor+=%%N*6
        set /a SteelPlate+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallSuspension3x3mirrored<" ^< "%file%"') do (
    set "SmallSuspension3x3mirrored=%%N"
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*7
        set /a SmallTube+=%%N*2
        set /a Motor+=%%N*1
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallSuspension5x5mirrored<" ^< "%file%"') do (
    set "SmallSuspension5x5mirrored=%%N"
        set /a SteelPlate+=%%N*10
        set /a Construction+=%%N*12
        set /a SmallTube+=%%N*4
        set /a Motor+=%%N*2
        set /a SteelPlate+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallSuspension1x1mirrored<" ^< "%file%"') do (
    set "SmallSuspension1x1mirrored=%%N"
        set /a SteelPlate+=%%N*5
        set /a Construction+=%%N*7
        set /a SmallTube+=%%N*2
        set /a Motor+=%%N*1
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*50
    )

for /F %%N in ('find /C "<SubtypeName>SmallRealWheel1x1<" ^< "%file%"') do (
    set "SmallRealWheel1x1=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*5
        set /a LargeTube+=%%N*1
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallRealWheel<" ^< "%file%"') do (
    set "SmallRealWheel=%%N"
        set /a SteelPlate+=%%N*3
        set /a Construction+=%%N*10
        set /a LargeTube+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>SmallRealWheel5x5<" ^< "%file%"') do (
    set "SmallRealWheel5x5=%%N"
        set /a SteelPlate+=%%N*4
        set /a Construction+=%%N*15
        set /a LargeTube+=%%N*2
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>RealWheel1x1<" ^< "%file%"') do (
    set "RealWheel1x1=%%N"
        set /a SteelPlate+=%%N*4
        set /a Construction+=%%N*20
        set /a LargeTube+=%%N*4
        set /a SteelPlate+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>RealWheel<" ^< "%file%"') do (
    set "RealWheel=%%N"
        set /a SteelPlate+=%%N*6
        set /a Construction+=%%N*25
        set /a LargeTube+=%%N*6
        set /a SteelPlate+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>RealWheel5x5<" ^< "%file%"') do (
    set "RealWheel5x5=%%N"
        set /a SteelPlate+=%%N*8
        set /a Construction+=%%N*30
        set /a LargeTube+=%%N*8
        set /a SteelPlate+=%%N*8
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>SmallRealWheel1x1mirrored<" ^< "%file%"') do (
    set "SmallRealWheel1x1mirrored=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*5
        set /a LargeTube+=%%N*1
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>SmallRealWheelmirrored<" ^< "%file%"') do (
    set "SmallRealWheelmirrored=%%N"
        set /a SteelPlate+=%%N*3
        set /a Construction+=%%N*10
        set /a LargeTube+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>SmallRealWheel5x5mirrored<" ^< "%file%"') do (
    set "SmallRealWheel5x5mirrored=%%N"
        set /a SteelPlate+=%%N*4
        set /a Construction+=%%N*15
        set /a LargeTube+=%%N*2
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>RealWheel1x1mirrored<" ^< "%file%"') do (
    set "RealWheel1x1mirrored=%%N"
        set /a SteelPlate+=%%N*4
        set /a Construction+=%%N*20
        set /a LargeTube+=%%N*4
        set /a SteelPlate+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>RealWheelmirrored<" ^< "%file%"') do (
    set "RealWheelmirrored=%%N"
        set /a SteelPlate+=%%N*6
        set /a Construction+=%%N*25
        set /a LargeTube+=%%N*6
        set /a SteelPlate+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>RealWheel5x5mirrored<" ^< "%file%"') do (
    set "RealWheel5x5mirrored=%%N"
        set /a SteelPlate+=%%N*8
        set /a Construction+=%%N*30
        set /a LargeTube+=%%N*8
        set /a SteelPlate+=%%N*8
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>Wheel1x1<" ^< "%file%"') do (
    set "Wheel1x1=%%N"
        set /a SteelPlate+=%%N*4
        set /a Construction+=%%N*20
        set /a LargeTube+=%%N*4
        set /a SteelPlate+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallWheel1x1<" ^< "%file%"') do (
    set "SmallWheel1x1=%%N"
        set /a SteelPlate+=%%N*1
        set /a Construction+=%%N*5
        set /a LargeTube+=%%N*1
        set /a SteelPlate+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>Wheel3x3<" ^< "%file%"') do (
    set "Wheel3x3=%%N"
        set /a SteelPlate+=%%N*6
        set /a Construction+=%%N*25
        set /a LargeTube+=%%N*6
        set /a SteelPlate+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>SmallWheel3x3<" ^< "%file%"') do (
    set "SmallWheel3x3=%%N"
        set /a SteelPlate+=%%N*3
        set /a Construction+=%%N*10
        set /a LargeTube+=%%N*1
        set /a SteelPlate+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

for /F %%N in ('find /C "<SubtypeName>Wheel5x5<" ^< "%file%"') do (
    set "Wheel5x5=%%N"
        set /a SteelPlate+=%%N*8
        set /a Construction+=%%N*30
        set /a LargeTube+=%%N*8
        set /a SteelPlate+=%%N*8
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallWheel5x5<" ^< "%file%"') do (
    set "SmallWheel5x5=%%N"
        set /a SteelPlate+=%%N*4
        set /a Construction+=%%N*15
        set /a LargeTube+=%%N*2
        set /a SteelPlate+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*25
    )

REM --- WHEELS BLOCKS END
REM --- WINDOWS BLOCKS START

for /F %%N in ('find /C "<SubtypeName>LargeWindowSquare<" ^< "%file%"') do (
    set "LargeWindowSquare=%%N"
        set /a InteriorPlate+=%%N*12
        set /a Construction+=%%N*8
        set /a SmallTube+=%%N*4
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>LargeWindowEdge<" ^< "%file%"') do (
    set "LargeWindowEdge=%%N"
        set /a InteriorPlate+=%%N*16
        set /a Construction+=%%N*12
        set /a SmallTube+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )


for /F %%N in ('find /C "<SubtypeName>Window1x2Slope<" ^< "%file%"') do (
    set "Window1x2Slope=%%N"
        set /a Girder+=%%N*16
        set /a BulletproofGlass+=%%N*40
        set /a BulletproofGlass+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>Window1x2Inv<" ^< "%file%"') do (
    set "Window1x2Inv=%%N"
        set /a Girder+=%%N*15
        set /a BulletproofGlass+=%%N*30
        set /a BulletproofGlass+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Window1x2Face<" ^< "%file%"') do (
    set "Window1x2Face=%%N"
        set /a Girder+=%%N*15
        set /a BulletproofGlass+=%%N*30
        set /a BulletproofGlass+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Window1x2SideLeft<" ^< "%file%"') do (
    set "Window1x2SideLeft=%%N"
        set /a Girder+=%%N*13
        set /a BulletproofGlass+=%%N*20
        set /a BulletproofGlass+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Window1x2SideLeftInv<" ^< "%file%"') do (
    set "Window1x2SideLeftInv=%%N"
        set /a Girder+=%%N*13
        set /a BulletproofGlass+=%%N*20
        set /a BulletproofGlass+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>Window1x2SideRight<" ^< "%file%"') do (
    set "Window1x2SideRight=%%N"
        set /a Girder+=%%N*13
        set /a BulletproofGlass+=%%N*20
        set /a BulletproofGlass+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Window1x2SideRightInv<" ^< "%file%"') do (
    set "Window1x2SideRightInv=%%N"
        set /a Girder+=%%N*13
        set /a BulletproofGlass+=%%N*20
        set /a BulletproofGlass+=%%N*6
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Window1x1Slope<" ^< "%file%"') do (
    set "Window1x1Slope=%%N"
        set /a Girder+=%%N*12
        set /a BulletproofGlass+=%%N*25
        set /a BulletproofGlass+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Window1x1Face<" ^< "%file%"') do (
    set "Window1x1Face=%%N"
        set /a Girder+=%%N*11
        set /a BulletproofGlass+=%%N*16
        set /a BulletproofGlass+=%%N*8
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>Window1x1Side<" ^< "%file%"') do (
    set "Window1x1Side=%%N"
        set /a Girder+=%%N*9
        set /a BulletproofGlass+=%%N*12
        set /a BulletproofGlass+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Window1x1SideInv<" ^< "%file%"') do (
    set "Window1x1SideInv=%%N"
        set /a Girder+=%%N*9
        set /a BulletproofGlass+=%%N*12
        set /a BulletproofGlass+=%%N*5
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Window1x1Inv<" ^< "%file%"') do (
    set "Window1x1Inv=%%N"
        set /a Girder+=%%N*11
        set /a BulletproofGlass+=%%N*16
        set /a BulletproofGlass+=%%N*8
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Window1x2Flat<" ^< "%file%"') do (
    set "Window1x2Flat=%%N"
        set /a Girder+=%%N*15
        set /a BulletproofGlass+=%%N*40
        set /a BulletproofGlass+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>Window1x2FlatInv<" ^< "%file%"') do (
    set "Window1x2FlatInv=%%N"
        set /a Girder+=%%N*15
        set /a BulletproofGlass+=%%N*35
        set /a BulletproofGlass+=%%N*15
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Window1x1Flat<" ^< "%file%"') do (
    set "Window1x1Flat=%%N"
        set /a Girder+=%%N*10
        set /a BulletproofGlass+=%%N*15
        set /a BulletproofGlass+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Window1x1FlatInv<" ^< "%file%"') do (
    set "Window1x1FlatInv=%%N"
        set /a Girder+=%%N*10
        set /a BulletproofGlass+=%%N*15
        set /a BulletproofGlass+=%%N*10
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Window3x3Flat<" ^< "%file%"') do (
    set "Window3x3Flat=%%N"
        set /a Girder+=%%N*40
        set /a BulletproofGlass+=%%N*160
        set /a BulletproofGlass+=%%N*36
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>Window3x3FlatInv<" ^< "%file%"') do (
    set "Window3x3FlatInv=%%N"
        set /a Girder+=%%N*40
        set /a BulletproofGlass+=%%N*160
        set /a BulletproofGlass+=%%N*36
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Window2x3Flat<" ^< "%file%"') do (
    set "Window2x3Flat=%%N"
        set /a Girder+=%%N*25
        set /a BulletproofGlass+=%%N*115
        set /a BulletproofGlass+=%%N*25
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>Window2x3FlatInv<" ^< "%file%"') do (
    set "Window2x3FlatInv=%%N"
        set /a Girder+=%%N*25
        set /a BulletproofGlass+=%%N*115
        set /a BulletproofGlass+=%%N*25
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )


for /F %%N in ('find /C "<SubtypeName>SmallWindow1x2Slope<" ^< "%file%"') do (
    set "SmallWindow1x2Slope=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*2
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallWindow1x2Inv<" ^< "%file%"') do (
    set "SmallWindow1x2Inv=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*2
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallWindow1x2Face<" ^< "%file%"') do (
    set "SmallWindow1x2Face=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*2
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallWindow1x2SideLeft<" ^< "%file%"') do (
    set "SmallWindow1x2SideLeft=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*2
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallWindow1x2SideLeftInv<" ^< "%file%"') do (
    set "SmallWindow1x2SideLeftInv=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*2
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallWindow1x2SideRight<" ^< "%file%"') do (
    set "SmallWindow1x2SideRight=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*2
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallWindow1x2SideRightInv<" ^< "%file%"') do (
    set "SmallWindow1x2SideRightInv=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*2
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallWindow1x1Slope<" ^< "%file%"') do (
    set "SmallWindow1x1Slope=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallWindow1x1Face<" ^< "%file%"') do (
    set "SmallWindow1x1Face=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallWindow1x1Side<" ^< "%file%"') do (
    set "SmallWindow1x1Side=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallWindow1x1SideInv<" ^< "%file%"') do (
    set "SmallWindow1x1SideInv=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallWindow1x1Inv<" ^< "%file%"') do (
    set "SmallWindow1x1Inv=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallWindow1x2Flat<" ^< "%file%"') do (
    set "SmallWindow1x2Flat=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*2
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]
 
for /F %%N in ('find /C "<SubtypeName>SmallWindow1x2FlatInv<" ^< "%file%"') do (
    set "SmallWindow1x2FlatInv=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*2
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallWindow1x1Flat<" ^< "%file%"') do (
    set "SmallWindow1x1Flat=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallWindow1x1FlatInv<" ^< "%file%"') do (
    set "SmallWindow1x1FlatInv=%%N"
        set /a Girder+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a BulletproofGlass+=%%N*1
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallWindow3x3Flat<" ^< "%file%"') do (
    set "SmallWindow3x3Flat=%%N"
        set /a Girder+=%%N*3
        set /a BulletproofGlass+=%%N*9
        set /a BulletproofGlass+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )
set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]

for /F %%N in ('find /C "<SubtypeName>SmallWindow3x3FlatInv<" ^< "%file%"') do (
    set "SmallWindow3x3FlatInv=%%N"
        set /a Girder+=%%N*3
        set /a BulletproofGlass+=%%N*9
        set /a BulletproofGlass+=%%N*3
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallWindow2x3Flat<" ^< "%file%"') do (
    set "SmallWindow2x3Flat=%%N"
        set /a Girder+=%%N*2
        set /a BulletproofGlass+=%%N*6
        set /a BulletproofGlass+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

for /F %%N in ('find /C "<SubtypeName>SmallWindow2x3FlatInv<" ^< "%file%"') do (
    set "SmallWindow2x3FlatInv=%%N"
        set /a Girder+=%%N*2
        set /a BulletproofGlass+=%%N*6
        set /a BulletproofGlass+=%%N*2
        set /a TOTAL+=%%N
        set /a PCU+=%%N*1
    )

REM --- WINDOWS BLOCKS END

set /a percent+=1
title Space Engineers Blueprints Calculator [Calculating: %percent%%%]




REM ----------------------------------
REM Block deduction
	set N=0
if %LargeHydrogenTank% neq 0 set N=%LargeHydrogenTank%
		set /a SteelPlates-=%N%*80
		set /a Computer-=%N%*8
		set /a Construction-=%N%*40
		set /a SmallTube-=%N%*60
		set /a LargeTube-=%N%*40
		set /a OxygenTank-=%N%*1
		set /a TOTAL-=%N%
        set /a PCU-=%%N*25
	set N=0
if %SmallHydrogenTank% neq 0 set N=%SmallHydrogenTank%
		set /a SteelPlates-=%N%*80
		set /a Computer-=%N%*8
		set /a Construction-=%N%*40
		set /a SmallTube-=%N%*60
		set /a LargeTube-=%N%*40
		set /a OxygenTank-=%N%*1
		set /a TOTAL-=%N%
		set /a PCU-=%%N*25
	set N=0
if %OxygenGeneratorSmall% neq 0 set N=%OxygenGeneratorSmall%
		set /a SteelPlates-=%N%*80
		set /a Computer-=%N%*8
		set /a Construction-=%N%*40
		set /a SmallTube-=%N%*60
		set /a LargeTube-=%N%*40
		set /a OxygenGenerator-=%N%*1
		set /a TOTAL-=%N%
        set /a PCU-=%%N*50		
	set N=0
if %ConnectorMedium% neq 0 set N=%ConnectorMedium%
		set /a SteelPlates-=%N%*150
		set /a Construction-=%N%*40
		set /a Motor-=%N%*8
		set /a SmallTube-=%N%*12
		set /a Computer-=%N%*20
		set /a Connector-=%N%*1		
		set /a TOTAL-=%N%
        set /a PCU-=%%N*125
	set N=0
if %ConnectorMedium% neq 0 set N=%ConnectorSmall%
		set /a SteelPlates-=%N%*150
		set /a Construction-=%N%*40
		set /a Motor-=%N%*8
		set /a SmallTube-=%N%*12
		set /a Connector-=%N%*1
		set /a Computer-=%N%*20
		set /a TOTAL-=%N%
        set /a PCU-=%%N*125
	set N=0
if %SmallAirVent% neq 0 set N=%SmallAirVent%
		set /a SteelPlates-=%N%*45
		set /a Computer-=%N%*5
		set /a Construction-=%N%*20
		set /a Motor-=%N%*4
		set /a AirVent-=%N%*1
		set /a TOTAL-=%N%
        set /a PCU-=%%N*10
	set N=0
if %GravityGeneratorSphere% neq 0 set N=%GravityGeneratorSphere%	
		set /a SteelPlates-=%N%*150
		set /a Construction-=%N%*60
		set /a Gravity-=%N%*6
		set /a LargeTube-=%N%*4
		set /a Motor-=%N%*6
		set /a Computer-=%N%*40
		set /a GravityGenerator-=%N%		
		set /a TOTAL-=%N%
        set /a PCU-=%%N*200
	)
	set N=0
if %SmallMissileLauncher% neq 0 set N=%SmallMissileLauncher%	
        set /a SteelPlate-=%N%*1
        set /a Construction-=%N%*2
        set /a MetalGrid-=%N%*1
        set /a LargeTube-=%N%*4
        set /a Motor-=%N%*1
        set /a Computer-=%N%*1
        set /a SteelPlate-=%N%*3
		set /a SmallMissileLauncher-=%N%
        set /a TOTAL-=%N%
        set /a PCU-=%N%*425
	)



REM ---
set end=%time%
set /a timing=%end%-%start%
REM ---	


set /a MASS+=%SteelPlate%*20
set /a MASS+=%Construction%*8
set /a MASS+=%Superconductor%*15
set /a MASS+=%PowerCell%*25
set /a MASS+=%MetalGrid%*6
set /a MASS+=%Computer%*0.2
set /a MASS+=%Display%*8
set /a MASS+=%Motor%*24
set /a MASS+=%LargeTube%*25
set /a MASS+=%SmallTube%*4
set /a MASS+=%InteriorPlate%*3
set /a MASS+=%RadioCommunication%*8
set /a MASS+=%BulletproofGlass%*15
set /a MASS+=%Girder%*6
set /a MASS+=%Explosives%*2
set /a MASS+=%Detector%*5
set /a MASS+=%Medical%*150
set /a MASS+=%Gravity%*800
set /a MASS+=%Reactor%*25
set /a MASS+=%SolarCell%*6
set /a MASS+=%Thrust%*40
set /a MASS+=%Canvas%*15


REM -----------------------------------------------------------------------------------

set /a HEALTH+=%SteelPlate%*53
set /a HEALTH+=%Construction%*18
set /a HEALTH+=%Superconductor%*14
set /a HEALTH+=%PowerCell%*14
set /a HEALTH+=%MetalGrid%*69
set /a HEALTH+=%Computer%*11
set /a HEALTH+=%Display%*12
set /a HEALTH+=%Motor%*14
set /a HEALTH+=%LargeTube%*22
set /a HEALTH+=%SmallTube%*18
set /a HEALTH+=%InteriorPlate%*36
set /a HEALTH+=%RadioCommunication%*11
set /a HEALTH+=%BulletproofGlass%*14
set /a HEALTH+=%Girder%*0
set /a HEALTH+=%Explosives%*21
set /a HEALTH+=%Detector%*11
set /a HEALTH+=%Medical%*12
set /a HEALTH+=%Gravity%*12
set /a HEALTH+=%Reactor%*14
set /a HEALTH+=%SolarCell%*11
set /a HEALTH+=%Thrust%*12
set /a HEALTH+=%Canvas%*14


REM -----------------------------------------------------------------------------------


:INPUT
cls
echo.
echo Reading Blueprint: %name%  by %owner%
echo.
echo Blueprint Calculated
echo.
echo TOTAL BLOCKS: %TOTAL%
echo.
echo TOTAL PCU: %PCU%
echo.
echo ESTIMATED MASS: %MASS%
echo.
echo ESTIMATED HEALTH: %HEALTH%
echo.

set options="tokens=1-4 delims=:.,"
for /f %options% %%a in ("%start%") do set start_h=%%a&set /a start_m=100%%b %% 100&set /a start_s=100%%c %% 100&set /a start_ms=100%%d %% 100
for /f %options% %%a in ("%end%") do set end_h=%%a&set /a end_m=100%%b %% 100&set /a end_s=100%%c %% 100&set /a end_ms=100%%d %% 100

set /a hours=%end_h%-%start_h%
set /a mins=%end_m%-%start_m%
set /a secs=%end_s%-%start_s%
set /a ms=%end_ms%-%start_ms%
if %ms% lss 0 set /a secs = %secs% - 1 & set /a ms = 100%ms%
if %secs% lss 0 set /a mins = %mins% - 1 & set /a secs = 60%secs%
if %mins% lss 0 set /a hours = %hours% - 1 & set /a mins = 60%mins%
if %hours% lss 0 set /a hours = 24%hours%
if 1%ms% lss 100 set ms=0%ms%

set /a totalsecs = %hours%*3600 + %mins%*60 + %secs%
echo CALCULATION TIME: %hours%:%mins%:%secs%.%ms% (%totalsecs%.%ms%s total)

REM echo Do you want to get a list of blocks, components, ore or full list? (B / C / O / F)
REM set /p "list=>"
REM if %list%==b goto BLOCKS 
REM if %list%==B goto BLOCKS
REM if %list%==c goto COMPS
REM if %list%==C goto COMPS
REM if %list%==o goto ORES
REM if %list%==O goto ORES
REM if %list%==f goto FULL
REM if %list%==F goto FULL
REM if %list%==t goto test
REM goto INPUT

REM -----------------------------------------------------
set line=0
REM LIST OF BLOCKS:

set line1=					
set line2=					
set line3=					
set line4=					
set line5=					
set line6=					
set line7=					
set line8=					
set line9=					
set line10=					
set line11=					
set line12=					
set line13=					
set line14=					
set line15=					
set line16=					
set line17=					
set line18=					
set line19=					
set line20=					
set line21=					
set line22=					
set line23=					
set line24=					
set line25=					
set line26=					
set line27=					
set line28=					
set line29=					
set line30=					
set line31=					
set line32=					
set line33=					
set line34=					
set line35=					
set line36=					
set line37=					
set line38=					
set line39=					
set line40=					
set line41=					
set line42=					
set line43=					
set line44=					
set line45=					
set line46=					
set line47=					
set line48=					
set line49=					
set line50=					
set line51=					
set line52=					
set line53=					
set line54=					
set line55=					
set line56=					
set line57=					
set line58=					
set line59=					
set line60=					
set line61=					
set line62=					
set line63=					
set line64=					
set line65=					
set line66=					
set line67=					
set line68=					
set line69=					
set line70=					
set line71=					
set line72=					
set line73=					
set line74=					
set line75=					
set line76=					
set line77=					
set line78=					
set line79=					
set line80=					
set line81=					
set line82=					
set line83=					
set line84=					
set line85=					
set line86=					
set line87=					
set line88=					
set line89=					
set line90=					
set line91=					
set line92=					
set line93=					
set line94=					
set line95=					
set line96=					
set line97=					
set line98=					
set line99=					
set line100=					
set line101=					
set line102=					
set line103=					
set line104=					
set line105=					
set line106=					
set line107=					
set line108=					
set line109=					
set line110=					
set line111=					
set line112=					
set line113=					
set line114=					
set line115=					
set line116=					
set line117=					
set line118=					
set line119=					
set line120=					
set line121=					
set line122=					
set line123=					
set line124=					
set line125=					
set line126=					
set line127=					
set line128=					
set line129=					
set line130=					
set line131=					
set line132=					
set line133=					
set line134=					
set line135=					
set line136=					
set line137=					
set line138=					
set line139=					
set line140=					
set line141=					
set line142=					
set line143=					
set line144=					
set line145=					
set line146=					
set line147=					
set line148=					
set line149=					
set line150=					
set line151=					
set line152=					
set line153=					
set line154=					
set line155=					
set line156=					
set line157=					
set line158=					
set line159=					
set line160=					
set line161=					
set line162=					
set line163=					
set line164=					
set line165=					
set line166=					
set line167=					
set line168=					
set line169=					
set line170=					
set line171=					
set line172=					
set line173=					
set line174=					
set line175=					
set line176=					
set line177=					
set line178=					
set line179=					
set line180=					
set line181=					
set line182=					
set line183=					
set line184=					
set line185=					
set line186=					
set line187=					
set line188=					
set line189=					
set line190=					
set line191=					
set line192=					
set line193=					
set line194=					
set line195=					
set line196=					
set line197=					
set line198=					
set line199=					
set line200=					
set line201=					
set line202=					
set line203=					
set line204=					
set line205=					
set line206=					
set line207=					
set line208=					
set line209=					
set line210=					
set line211=					
set line212=					
set line213=					
set line214=					
set line215=					
set line216=					
set line217=					
set line218=					
set line219=					
set line220=					
set line221=					
set line222=					
set line223=					
set line224=					
set line225=					
set line226=					
set line227=					
set line228=					
set line229=					
set line230=					
set line231=					
set line232=					
set line233=					
set line234=					
set line235=					
set line236=					
set line237=					
set line238=					
set line239=					
set line240=					
set line241=					
set line242=					
set line243=					
set line244=					
set line245=					
set line246=					
set line247=					
set line248=					
set line249=					
set line250=					
set line251=					
set line252=					
set line253=					
set line254=					
set line255=					
set line256=					
set line257=					
set line258=					
set line259=					
set line260=					
set line261=					
set line262=					
set line263=					
set line264=					
set line265=					
set line266=					
set line267=					
set line268=					
set line269=					
set line270=					
set line271=					
set line272=					
set line273=					
set line274=					
set line275=					
set line276=					
set line277=					
set line278=					
set line279=					
set line280=					
set line281=					
set line282=					
set line283=					
set line284=					
set line285=					
set line286=					
set line287=					
set line288=					
set line289=					
set line290=					
set line291=					
set line292=					
set line293=					
set line294=					
set line295=					
set line296=					
set line297=					
set line298=					
set line299=					
set line300=					

REM --- BLOCK GROUPING ---
set /a LargeLightArmor=%LargeBlockArmorBlock%+%LargeBlockArmorSlope%+%LargeBlockArmorCorner%+%LargeBlockArmorCornerInv%+%LargeRoundArmor_Slope%+%LargeRoundArmor_Corner%+%LargeRoundArmor_CornerInv%+%LargeHalfArmorBlock%+%LargeHalfSlopeArmorBlock%+%LargeBlockArmorRoundSlope%+%LargeBlockArmorRoundCorner%+%LargeBlockArmorRoundCornerInv%+%LargeBlockArmorSlope2Base%+%LargeBlockArmorSlope2Tip%+%LargeBlockArmorCorner2Base%+%LargeBlockArmorCorner2Tip%+%LargeBlockArmorInvCorner2Base%+%LargeBlockArmorInvCorner2Tip%


set /a LargeHeavyArmor=%LargeHeavyBlockArmorBlock%+%LargeHeavyBlockArmorSlope%+%LargeHeavyBlockArmorCorner%+%LargeHeavyBlockArmorCornerInv%+%LargeHeavyHalfArmorBlock%+%LargeHeavyHalfSlopeArmorBlock%+%LargeHeavyBlockArmorRoundSlope%+%LargeHeavyBlockArmorRoundCorner%+%LargeHeavyBlockArmorRoundCornerInv%+%LargeHeavyBlockArmorSlope2Base%+%LargeHeavyBlockArmorSlope2Tip%+%LargeHeavyBlockArmorCorner2Base%+%LargeHeavyBlockArmorCorner2Tip%+%LargeHeavyBlockArmorInvCorner2Base%+%LargeHeavyBlockArmorInvCorner2Tip%


set /a SmallLightArmor=%SmallBlockArmorBlock%+%SmallBlockArmorSlope%+%SmallBlockArmorCorner%+%SmallBlockArmorCornerInv%+%HalfArmorBlock%+%HalfSlopeArmorBlock%+%SmallBlockArmorRoundSlope%+%SmallBlockArmorRoundCorner%+%SmallBlockArmorRoundCornerInv%+%SmallBlockArmorSlope2Base%+%SmallBlockArmorSlope2Tip%+%SmallBlockArmorCorner2Base%+%SmallBlockArmorCorner2Tip%+%SmallBlockArmorInvCorner2Base%+%SmallBlockArmorInvCorner2Tip%


set /a SmallHeavyArmor=%SmallHeavyBlockArmorBlock%+%SmallHeavyBlockArmorSlope%+%SmallHeavyBlockArmorCorner%+%SmallHeavyBlockArmorCornerInv%+%HeavyHalfArmorBlock%+%HeavyHalfSlopeArmorBlock%+%SmallHeavyBlockArmorRoundSlope%+%SmallHeavyBlockArmorRoundCorner%+%SmallHeavyBlockArmorRoundCornerInv%+%SmallHeavyBlockArmorSlope2Base%+%SmallHeavyBlockArmorSlope2Tip%+%SmallHeavyBlockArmorCorner2Base%+%SmallHeavyBlockArmorCorner2Tip%+%SmallHeavyBlockArmorInvCorner2Base%+%SmallHeavyBlockArmorInvCorner2Tip%

set /a LargeBlastdoors=%ArmorCenter%+%ArmorCorner%+%ArmorInvCorner%+%ArmorSide%

set /a SmallBlastdoors=%SmallArmorCenter%+%SmallArmorCorner%+%SmallArmorInvCorner%+%SmallArmorSide%

set /a DecoDLC=%LargeBlockDesk%+%LargeBlockDeskCorner%+%LargeBlockDeskChairless%+%LargeBlockDeskChairlessCorner%+%LargeBlockKitchen%+%LargeBlockBed%+%LargeBlockLockerRoom%+%LargeBlockLockerRoomCorner%+%LargeBlockPlanters%+%LargeBlockCouch%+%LargeBlockCouchCorner%+%LargeBlockLockers%+%LargeBlockBathroomOpen%+%LargeBlockBathroom%+%LargeBlockToilet%+%LargeBlockConsole%+%SmallBlockCockpitIndustrial%+%LargeBlockCockpitIndustrial%+%FoodDispenser%+%Jukebox%+%LabEquipment%+%Shower%+%WindowWall%+%WindowWallLeft%+%WindowWallRight%+%MedicalStation%+%TransparentLCDLarge%+%TransparentLCDSmall%+%Catwalk%+%CatwalkCorner%+%CatwalkStraight%+%CatwalkWall%+%CatwalkRailingEnd%+%CatwalkRailingHalfRight%+%CatwalkRailingHalfLeft%+%GratedStairs%+%GratedHalfStairs%+%GratedHalfStairsMirrored%+%RailingStraight%+%RailingDouble%+%RailingCorner%+%RailingDiagonal%+%RailingHalfRight%+%RailingHalfLeft%+%RotatingLightLarge%+%RotatingLightSmall%+%Freight1%+%Freight2%+%Freight3%+%DeadBody01%+%DeadBody02%+%DeadBody03%+%DeadBody04%+%DeadBody05%+%DeadBody06%

set /a Doors=%Door%+%LargeBlockSlideDoor%+%LargeBlockGate%+%LargeBlockOffsetDoor%

set /a CatWalks=%LargeSteelCatwalk%+%LargeSteelCatwalk2Sides%+%LargeSteelCatwalkCorner%+%LargeSteelCatwalkPlate%

set /a LargeLCDs=%LargeTextPanel%+%LargeLCDPanel%+%LargeLCDPanelWide%

set /a SmallLCDs=%SmallTextPanel%+%SmallLCDPanelWide%+%SmallLCDPanel%

set /a LargeCornerLCDs=%LargeBlockCorner_LCD_1%+%LargeBlockCorner_LCD_2%+%LargeBlockCorner_LCD_Flat_1%+%LargeBlockCorner_LCD_Flat_2%

set /a SmallCornerLCDs=%SmallBlockCorner_LCD_1%+%SmallBlockCorner_LCD_2%+%SmallBlockCorner_LCD_Flat_1%+%SmallBlockCorner_LCD_Flat_2%

set /a LargeCornerLights=%LargeBlockLight_1corner%+%LargeBlockLight_2corner%

set /a SmallCornerLights=%SmallBlockLight_1corner%+%SmallBlockLight_2corner%

set /a LargeConveyors=%ConveyorTube%+%ConveyorTubeCurved%+%LargeBlockConveyor%

set /a SmallConveyors=%ConveyorTubeSmall%+%ConveyorTubeSmallCurved%+%ConveyorTubeMedium%+%ConveyorFrameMedium%+%SmallShipConveyorHub%+%SmallBlockConveyor%

set /a LargeWheel3x3=%Suspension3x3%+%Suspension3x3mirrored%
set /a LargeWheel5x5=%Suspension5x5%+%Suspension5x5mirrored%
set /a LargeWheel1x1=%Suspension1x1%+%Suspension1x1mirrored%
set /a SmallWheel3x3=%SmallSuspension3x3%+%SmallSuspension3x3mirrored%
set /a SmallWheel5x5=%SmallSuspension5x5%+%SmallSuspension5x5mirrored%
set /a SmallWheel1x1=%SmallSuspension1x1%+%SmallSuspension1x1mirrored%

set /a LargeWindows=%LargeWindowSquare%+%LargeWindowEdge%+%Window1x2Slope%+%Window1x2Inv%+%Window1x2Face%+%Window1x2SideLeft%+%Window1x2SideLeftInv%+%Window1x2SideRight%+%Window1x2SideRightInv%+%Window1x1Slope%+%Window1x1Face%+ %Window1x1Side%+%Window1x1SideInv%+%Window1x1Inv%+%Window1x2Flat%+%Window1x2FlatInv%+%Window1x1Flat%+%Window1x1FlatInv%+%Window3x3Flat%+%Window3x3FlatInv%+%Window2x3Flat%+%Window2x3FlatInv%

set /a SmallWindows=%SmallWindow1x2Slope%+%SmallWindow1x2Inv%+%SmallWindow1x2Face%+%SmallWindow1x2SideLeft%+%SmallWindow1x2SideLeftInv%+%SmallWindow1x2SideRight%+%SmallWindow1x2SideRightInv%+%SmallWindow1x1Slope%+%SmallWindow1x1Face%+%SmallWindow1x1Side%+%SmallWindow1x1SideInv%+%SmallWindow1x1Inv%+%SmallWindow1x2Flat%+%SmallWindow1x2FlatInv%+%SmallWindow1x1Flat%+%SmallWindow1x1FlatInv%+ %SmallWindow3x3Flat%+%SmallWindow3x3FlatInv%+%SmallWindow2x3Flat%+%SmallWindow2x3FlatInv%

REM ---

if %LargeLightArmor% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Light Armor			%LargeLightArmor%
	)
if %LargeHeavyArmor% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Heavy Armor			%LargeHeavyArmor%
	)	
if %LargeBlastdoors% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Blast Doors			%LargeBlastdoors%
	)
if %SmallLightArmor% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Light Armor			%SmallLightArmor%
	)
if %SmallHeavyArmor% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Heavy Armor			%SmallHeavyArmor%
	)
if %SmallBlastdoors% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Blast Doors			%SmallBlastdoors%
	)

if %SmallProgrammableBlock% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Programmable block		%SmallProgrammableBlock%
	)
if %LargeProjector% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Projector			%LargeProjector%
	)
if %SmallProjector% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Projector			%SmallProjector%
	)
if %SmallBlockSensor% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Sensor				%SmallBlockSensor%
	)
if %LargeBlockSensor% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Sensor				%LargeBlockSensor%
	)
if %SmallBlockSoundBlock% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Sound Block			%SmallBlockSoundBlock%
	)
if %LargeBlockSoundBlock% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Sound Block			%LargeBlockSoundBlock%
	)
if %ButtonPanelLarge% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Button Panel			%ButtonPanelLarge%
	)
if %ButtonPanelSmall% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Button Panel			%ButtonPanelSmall%
	)
if %TimerBlockLarge% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Timer Block			%TimerBlockLarge%
	)
if %TimerBlockSmall% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Timer Block			%TimerBlockSmall%
	)
if %LargeProgrammableBlock% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Programmable Block		%LargeProgrammableBlock%
	)
if %LargeBlockRadioAntenna% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Antenna				%LargeBlockRadioAntenna%
	)
if %LargeBlockBeacon% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Beacon				%LargeBlockBeacon%
	)
if %SmallBlockBeacon% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Beacon				%SmallBlockBeacon%
	)
if %SmallBlockRadioAntenna% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Antenna				%SmallBlockRadioAntenna%
	)
if %LargeBlockRemoteControl% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Remote Control			%LargeBlockRemoteControl%
	)
if %SmallBlockRemoteControl% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Remote Control			%SmallBlockRemoteControl%
	)
if %LargeBlockLaserAntenna% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Laser Antenna			%LargeBlockLaserAntenna%
	)
if %SmallBlockLaserAntenna% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Laser Antenna			%SmallBlockLaserAntenna%
	)

if %LargeBlockRadioAntennaDish% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Antenna Dish				%LargeBlockRadioAntennaDish%
	)
	
if %ControlPanel% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Control Panel			%ControlPanel%
	)
if %SmallControlPanel% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Control Panel			%SmallControlPanel%
	)
if %LargeBlockCockpit% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Control Station			%LargeBlockCockpit%
	)
if %LargeBlockCockpitSeat% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Cockpit				%LargeBlockCockpitSeat%
	)
if %SmallBlockCockpit% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Cockpit				%SmallBlockCockpit%
	)
if %CockpitOpen% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Flight Seat			%CockpitOpen%
	)
if %OpenCockpitSmall% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Control Seat			%OpenCockpitSmall%
	)
if %OpenCockpitLarge% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Control Seat			%OpenCockpitLarge%
	)

if %PassengerSeatLarge% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Passenger Seat			%PassengerSeatLarge%
	)
if %PassengerSeatSmall% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Passenger Seat			%PassengerSeatSmall%
	)

if %LargeBlockGyro% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Gyroscope			%LargeBlockGyro%
	)
if %SmallBlockGyro% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Gyroscope			%SmallBlockGyro%
	)

if %DecoDLC% gtr 0 (
	set /a line+=1
	set line!line!=[LG] DLC Decorative Blocks	%DecoDLC%
	)

if %Doors% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Doors				%Doors%
	)
if %AirtightHangarDoor% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Hangar Doors			%AirtightHangarDoor%
	)

if %StoreBlock% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Store				%StoreBlock%
	)
if %SafeZoneBlock% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Safe Zone Block		%SafeZoneBlock%
	)
if %ContractBlock% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Contracts			%ContractBlock%
	)
if %AtmBlock% gtr 0 (
	set /a line+=1
	set line!line!=[LG] ATM				%AtmBlock%
	)

if %LargeBlockBatteryBlock% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Battery				%LargeBlockBatteryBlock%
	)
if %SmallBlockBatteryBlock% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Battery				%SmallBlockBatteryBlock%
	)
if %SmallBlockSmallBatteryBlock% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Small Battery			%SmallBlockSmallBatteryBlock%
	)
if %SmallBlockSmallGenerator% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Small Generator			%SmallBlockSmallGenerator%
	)
if %SmallBlockLargeGenerator% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Large Generator			%SmallBlockLargeGenerator%
	)
if %LargeBlockSmallGenerator% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Small Generator			%LargeBlockSmallGenerator%
	)
if %LargeBlockLargeGenerator% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Large Generator			%LargeBlockLargeGenerator%
	)
if %LargeHydrogenEngine% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Hydrogen Engine			%LargeHydrogenEngine%
	)
if %SmallHydrogenEngine% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Hydrogen Engine			%SmallHydrogenEngine%
	)
if %LargeBlockWindTurbine% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Wind Turbine			%LargeBlockWindTurbine%
	)
if %LargeBlockSolarPanel% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Solar Panel			%LargeBlockSolarPanel%
	)
if %SmallBlockSolarPanel% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Solar Panel			%SmallBlockSolarPanel%
	)

if %GravityGenerator% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Gravity Generator		%GravityGenerator%
	)
if %GravityGeneratorSphere% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Spherical Gravity Generator	%GravityGeneratorSphere%
	)
if %VirtualMassLarge% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Virtual Mass			%VirtualMassLarge%
	)
if %VirtualMassSmall% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Virtual Mass			%VirtualMassSmall%
	)
if %SpaceBallLarge% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Space Ball			%SpaceBallLarge%
	)
if %SpaceBallSmall% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Space Ball			%SpaceBallSmall%
	)

if %Passage% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Passage				%Passage%
	)
if %LargeStairs% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Stairs				%LargeStairs%
	)
if %LargeRamp% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Ramp				%LargeRamp%
	)

if %CatWalks% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Catwalks				%CatWalks%
	)

if %LargeCoverWall% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Cover Wall			%LargeCoverWall%
	)
if %LargeCoverWallHalf% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Cover Half-Wall			%LargeCoverWallHalf%
	)
if %LargeBlockInteriorWall% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Interior Wall			%LargeBlockInteriorWall%
	)
if %LargeInteriorPillar% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Pillar				%LargeInteriorPillar%
	)

if %Ladder2% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Ladder				%Ladder2%
	)
if %LadderSmall% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Ladder				%LadderSmall%
	)

if %LargeLCDs% gtr 0 (
	set /a line+=1
	set line!line!=[LG] LCDs				%LargeLCDs%
	)
if %SmallLCDs% gtr 0 (
	set /a line+=1
	set line!line!=[SG] LCDs				%SmallLCDs%
	)
if %LargeCornerLCDs% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Corner LCDs			%LargeCornerLCDs%
	)
if %SmallCornerLCDs% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Corner LCDs			%SmallCornerLCDs%
	)

if %LargeBlockFrontLight% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Spotlight			%LargeBlockFrontLight%
	)
if %SmallBlockFrontLight% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Spotlight			%SmallBlockFrontLight%
	)
if %SmallLight% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Interior Light			%SmallLight%
	)
if %SmallBlockSmallLight% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Interior Light			%SmallBlockSmallLight%
	)
if %LargeCornerLights% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Corner Lights			%LargeCornerLights%
	)
if %SmallCornerLights% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Corner Lights			%SmallCornerLights%
	)

if %OxygenTank% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Oxygen Tank			%OxygenTank%
	)
if %OxygenTankSmall% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Small Oxygen Tank		%OxygenTankSmall%
	)
if %LargeHydrogenTank% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Hydrogen Tank				%LargeHydrogenTank%
	)
if %LargeHydrogenTankSmall% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Small Hydrogen Tank			%LargeHydrogenTankSmall%
	)
if %SmallHydrogenTank% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Hydrogen Tank			%SmallHydrogenTank%
	)
if %SmallHydrogenTankSmall% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Small Hydrogen Tank		%SmallHydrogenTankSmall%
	)
if %AirVent% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Air Vent				%AirVent%
	)
if %SmallAirVent% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Air Vent				%SmallAirVent%
	)

if %SmallBlockSmallContainer% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Small Cargo Container		%SmallBlockSmallContainer%
	)
if %SmallBlockMediumContainer% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Medium Cargo Container		%SmallBlockMediumContainer%
	)
if %SmallBlockLargeContainer% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Large Cargo Container		%SmallBlockLargeContainer%
	)
if %LargeBlockSmallContainer% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Small Cargo Container		%LargeBlockSmallContainer%
	)
if %LargeBlockLargeContainer% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Large Cargo Container		%LargeBlockLargeContainer%
	)
if %Collector% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Collector			%Collector%
	)
if %CollectorSmall% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Collector			%CollectorSmall%
	)
if %Connector% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Connector			%Connector%
	)
if %ConnectorMedium% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Connector			%ConnectorMedium%
	)
if %ConnectorSmall% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Ejector			%ConnectorSmall%
	)

if %LargeConveyors% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Large Conveyors			%LargeConveyors%
	)
if %SmallConveyors% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Small Conveyors			%SmallConveyors%
	)
if %LargeBlockConveyorSorter% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Conveyor Sorter			%LargeBlockConveyorSorter%
	)
if %MediumBlockConveyorSorter% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Medium Conveyor Sorter	%MediumBlockConveyorSorter%
	)
if %SmallBlockConveyorSorter% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Conveyor Sorter		%SmallBlockConveyorSorter%
	)

if %LargePistonBase% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Piston				%LargePistonBase%
	)
if %SmallPistonBase% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Piston				%SmallPistonBase%
	)
if %LargeStator% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Rotor				%LargeStator%
	)
if %SmallStator% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Rotor				%SmallStator%
	)
if %LargeAdvancedStator% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Advanced Rotor			%LargeAdvancedStator%
	)
if %SmallAdvancedStator% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Advanced Rotor			%SmallAdvancedStator%
	)

if %LargeMedicalRoom% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Medical Room			%LargeMedicalRoom%
	)
if %LargeBlockCryoChamber% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Cryo Chamber			%LargeBlockCryoChamber%
	)
if %SmallBlockCryoChamber% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Cryo Chamber			%SmallBlockCryoChamber%
	)

if %LargeRefinery% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Refinery				%LargeRefinery%
	)
if %Blast Furnace% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Blast Furnace			%Blast Furnace%
	)
if %OxygenGenerator% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Oxygen Generator			%OxygenGenerator%
	)
if %OxygenGeneratorSmall% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Oxygen Generator			%OxygenGeneratorSmall%
	)
if %LargeAssembler% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Assembler			%LargeAssembler%
	)
if %BasicAssembler% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Basic Assembler			%BasicAssembler%
	)
if %SurvivalKitLarge% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Survival Kit			%SurvivalKitLarge%
	)
if %SurvivalKit% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Survival Kit			%SurvivalKit%
	)
if %LargeBlockOxygenFarm% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Oxygen Farm			%LargeBlockOxygenFarm%
	)
if %LargeProductivityModule% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Productivity Module		%LargeProductivityModule%
	)
if %LargeEffectivenessModule% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Effectiveness Module		%LargeEffectivenessModule%
	)
if %LargeEnergyModule% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Energy Module			%LargeEnergyModule%
	)

if %LargeBlockSmallThrust% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Small Thruster			%LargeBlockSmallThrust%
	)
if %LargeBlockLargeThrust% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Large Thruster			%LargeBlockLargeThrust%
	)
if %SmallBlockSmallThrust% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Small Thruster			%SmallBlockSmallThrust%
	)
if %SmallBlockLargeThrust% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Large Thruster			%SmallBlockLargeThrust%
	)
if %LargeBlockLargeHydrogenThrust% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Large Hydrogen Thruster		%LargeBlockLargeHydrogenThrust%
	)
if %LargeBlockSmallHydrogenThrust% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Small Hydrogen Thruster		%LargeBlockSmallHydrogenThrust%
	)
if %SmallBlockLargeHydrogenThrust% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Large Hydrogen Thruster		%SmallBlockLargeHydrogenThrust%
	)
if %SmallBlockSmallHydrogenThrust% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Small Hydrogen Thruster		%SmallBlockSmallHydrogenThrust%
	)
if %LargeBlockLargeAtmosphericThrust% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Large Atmospheric Thruster	%LargeBlockLargeAtmosphericThrust%
	)
if %LargeBlockSmallAtmosphericThrust% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Small Atmospheric Thruster	%LargeBlockSmallAtmosphericThrust%
	)
if %SmallBlockLargeAtmosphericThrust% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Large Atmospheric Thruster	%SmallBlockLargeAtmosphericThrust%
	)
if %SmallBlockSmallAtmosphericThrust% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Small Atmospheric Thruster	%SmallBlockSmallAtmosphericThrust%
	)

if %LargeBlockDrill% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Drill				%LargeBlockDrill%
	)
if %SmallBlockDrill% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Drill				%SmallBlockDrill%
	)
if %LargeShipGrinder% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Grinder				%LargeShipGrinder%
	)
if %SmallShipGrinder% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Grinder				%SmallShipGrinder%
	)
if %LargeShipWelder% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Welder				%LargeShipWelder%
	)
if %SmallShipWelder% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Welder				%SmallShipWelder%
	)
if %LargeOreDetector% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Ore Detector			%LargeOreDetector%
	)
if %SmallBlockOreDetector% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Ore Detector			%SmallBlockOreDetector%
	)

if %LargeBlockLandingGear% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Landing Gear			%LargeBlockLandingGear%
	)
if %SmallBlockLandingGear% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Landing Gear			%SmallBlockLandingGear%
	)
if %LargeJumpDrive% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Jump Drive			%LargeJumpDrive%
	)
if %SmallCameraBlock% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Camera				%SmallCameraBlock%
	)
if %LargeCameraBlock% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Camera				%LargeCameraBlock%
	)
if %LargeShipMergeBlock% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Merge Block			%LargeShipMergeBlock%
	)
if %SmallShipMergeBlock% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Merge Block			%SmallShipMergeBlock%
	)
if %LgParachute% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Parachute			%LgParachute%
	)
if %SmParachute% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Parachute			%SmParachute%
	)

if %LargeWarhead% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Warhead				%LargeWarhead%
	)
if %SmallWarhead% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Warhead				%SmallWarhead%
	)
if %LargeDecoy% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Decoy				%LargeDecoy%
	)
if %SmallDecoy% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Decoy				%SmallDecoy%
	)
if %LargeGatlingTurret% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Gatling Turret			%LargeGatlingTurret%
	)
if %SmallGatlingTurret% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Gatling Turret			%SmallGatlingTurret%
	)
if %LargeMissileTurret% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Missile Turret			%LargeMissileTurret%
	)
if %SmallMissileTurret% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Missile Turret			%SmallMissileTurret%
	)
if %LargeInteriorTurret% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Interior Turret			%LargeInteriorTurret%
	)
if %LargeMissileLauncher% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Missile Launcher			%LargeMissileLauncher%
	)
if %SmallMissileLauncher% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Missile Launcher			%SmallMissileLauncher%
	)
if %SmallRocketLauncherReload% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Reloadable Missile Launcher	%SmallRocketLauncherReload%
	)
if %SmallGatlingGun% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Gatling Gun			%SmallGatlingGun%
	)

if %LargeWheel3x3% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Wheel 3x3			%LargeWheel3x3%
	)
if %LargeWheel5x5% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Wheel 5x5			%LargeWheel5x5%
	)
if %LargeWheel1x1% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Wheel 1x1			%LargeWheel1x1%
	)
if %SmallWheel3x3% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Wheel 3x3			%SmallWheel3x3%
	)
if %SmallWheel5x5% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Wheel 5x5			%SmallWheel5x5%
	)
if %SmallWheel1x1% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Wheel 1x1			%SmallWheel1x1%
	)

if %LargeWindows% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Windows				%LargeWindows%
	)
if %SmallWindows% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Windows				%SmallWindows%
	)

if %Monolith% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Monolith			%Monolith%
	)
if %Stereolith% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Stereolith			%Stereolith%
	)
if %DeadAstronaut% gtr 0 (
	set /a line+=1
	set line!line!=[SG] Dead Astronaut		%DeadAstronaut%
	)
if %LargeDeadAstronaut% gtr 0 (
	set /a line+=1
	set line!line!=[LG] Dead Astronaut		%LargeDeadAstronaut%
	)





REM -----------------------------------------------------
:COMPS

REM ----------------------------------
set steel=%SteelPlate%
set const=%Construction%
set super=%Superconductor%
set power=%PowerCell%
set grid=%MetalGrid%
set comp=%Computer%
set disp=%Display%
set motor=%Motor%
set tube=%LargeTube%
set stube=%SmallTube%
set inter=%InteriorPlate%
set radio=%RadioCommunication%
set glass=%BulletproofGlass%
set girder=%Girder%
set boom=%Explosives%
set detect=%Detector%
set medic=%Medical%
set grav=%Gravity%
set react=%Reactor%
set solar=%SolarCell%
set thrust=%Thrust%
set canvas=%Canvas%
REM ----------------------------------

echo.
echo.
REM LIST OF COMPONENTS:
set lyne=0
if %steel% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Steel Plates			%steel%
	)	
if %const% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Construction Components		%const%
	)
if %super% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Superconductors			%super%
	)
if %power% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Power Cells			%power%
	)
if %grid% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Metal Grids			%grid%
	)
if %comp% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Computer Components		%comp%
	)
if %disp% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Displays			%disp%
	)
if %motor% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Motors				%motor%
	)
if %tube% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Large Tubes			%tube%
	)
if %stube% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Small Tubes			%stube%
	)
if %inter% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Interior Plates			%inter%
	)
if %radio% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Radio-Communication Components	%radio%
	)
if %glass% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Bulletproof Glass		%glass%
	)
if %girder% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Girders				%girder%
	)
if %boom% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Explosives			%boom%
	)
if %detect% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Detector Components		%detect%
	)
if %medic% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Medical Components		%medic%
	)
if %grav% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Gravity Generator Components	%grav%
	)
if %react% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Reactor Components		%react%
	)
if %solar% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Solar Cells			%solar%
	)
if %thrust% gtr 0 (
	set /a lyne+=1
	set lyne!lyne!=Thruster Components		%thrust%
	)


REM echo Do you want to get a list of blocks, components, ore or full list? (B / C / O / F)
REM set /p "list=>"
REM if %list%==b goto BLOCKS 
REM if %list%==B goto BLOCKS
REM if %list%==c goto COMPS
REM if %list%==C goto COMPS
REM if %list%==o goto ORES
REM if %list%==O goto ORES
REM if %list%==f goto FULL
REM if %list%==F goto FULL
REM if %list%==t goto test
REM goto INPUT


:FULL
set write1=%line1%		&& if "%lyne1%" neq "" set write1=!write1!	%lyne1%
set write2=%line2%		&& if "%lyne2%" neq "" set write2=!write2!	%lyne2%
set write3=%line3%		&& if "%lyne3%" neq "" set write3=!write3!	%lyne3%
set write4=%line4%		&& if "%lyne4%" neq "" set write4=!write4!	%lyne4%
set write5=%line5%		&& if "%lyne5%" neq "" set write5=!write5!	%lyne5%
set write6=%line6%		&& if "%lyne6%" neq "" set write6=!write6!	%lyne6%
set write7=%line7%		&& if "%lyne7%" neq "" set write7=!write7!	%lyne7%
set write8=%line8%		&& if "%lyne8%" neq "" set write8=!write8!	%lyne8%
set write9=%line9%		&& if "%lyne9%" neq "" set write9=!write9!	%lyne9%
set write10=%line10%		&& if "%lyne10%" neq "" set write10=!write10!	%lyne10%
set write11=%line11%		&& if "%lyne11%" neq "" set write11=!write11!	%lyne11%
set write12=%line12%		&& if "%lyne12%" neq "" set write12=!write12!	%lyne12%
set write13=%line13%		&& if "%lyne13%" neq "" set write13=!write13!	%lyne13%
set write14=%line14%		&& if "%lyne14%" neq "" set write14=!write14!	%lyne14%
set write15=%line15%		&& if "%lyne15%" neq "" set write15=!write15!	%lyne15%
set write16=%line16%		&& if "%lyne16%" neq "" set write16=!write16!	%lyne16%
set write17=%line17%		&& if "%lyne17%" neq "" set write17=!write17!	%lyne17%
set write18=%line18%		&& if "%lyne18%" neq "" set write18=!write18!	%lyne18%
set write19=%line19%		&& if "%lyne19%" neq "" set write19=!write19!	%lyne19%
set write20=%line20%		&& if "%lyne20%" neq "" set write20=!write20!	%lyne20%
set write21=%line21%		&& if "%lyne21%" neq "" set write21=!write21!	%lyne21%
set write22=%line22%		&& if "%lyne22%" neq "" set write22=!write22!	%lyne22%
set write23=%line23%		&& if "%lyne23%" neq "" set write23=!write23!	%lyne23%
set write24=%line24%		&& if "%lyne24%" neq "" set write24=!write24!	%lyne24%
set write25=%line25%		&& if "%lyne25%" neq "" set write25=!write25!	%lyne25%
set write26=%line26%		&& if "%lyne26%" neq "" set write26=!write26!	%lyne26%
set write27=%line27%		&& if "%lyne27%" neq "" set write27=!write27!	%lyne27%
set write28=%line28%		&& if "%lyne28%" neq "" set write28=!write28!	%lyne28%
set write29=%line29%		&& if "%lyne29%" neq "" set write29=!write29!	%lyne29%
set write30=%line30%		&& if "%lyne30%" neq "" set write30=!write30!	%lyne30%
set write31=%line31%		&& if "%lyne31%" neq "" set write31=!write31!	%lyne31%
set write32=%line32%		&& if "%lyne32%" neq "" set write32=!write32!	%lyne32%
set write33=%line33%		&& if "%lyne33%" neq "" set write33=!write33!	%lyne33%
set write34=%line34%		&& if "%lyne34%" neq "" set write34=!write34!	%lyne34%
set write35=%line35%		&& if "%lyne35%" neq "" set write35=!write35!	%lyne35%
set write36=%line36%		&& if "%lyne36%" neq "" set write36=!write36!	%lyne36%
set write37=%line37%		&& if "%lyne37%" neq "" set write37=!write37!	%lyne37%
set write38=%line38%		&& if "%lyne38%" neq "" set write38=!write38!	%lyne38%
set write39=%line39%		&& if "%lyne39%" neq "" set write39=!write39!	%lyne39%
set write40=%line40%		&& if "%lyne40%" neq "" set write40=!write40!	%lyne40%
set write41=%line41%		&& if "%lyne41%" neq "" set write41=!write41!	%lyne41%
set write42=%line42%		&& if "%lyne42%" neq "" set write42=!write42!	%lyne42%
set write43=%line43%		&& if "%lyne43%" neq "" set write43=!write43!	%lyne43%
set write44=%line44%		&& if "%lyne44%" neq "" set write44=!write44!	%lyne44%
set write45=%line45%		&& if "%lyne45%" neq "" set write45=!write45!	%lyne45%
set write46=%line46%		&& if "%lyne46%" neq "" set write46=!write46!	%lyne46%
set write47=%line47%		&& if "%lyne47%" neq "" set write47=!write47!	%lyne47%
set write48=%line48%		&& if "%lyne48%" neq "" set write48=!write48!	%lyne48%
set write49=%line49%		&& if "%lyne49%" neq "" set write49=!write49!	%lyne49%
set write50=%line50%		&& if "%lyne50%" neq "" set write50=!write50!	%lyne50%
set write51=%line51%		&& if "%lyne51%" neq "" set write51=!write51!	%lyne51%
set write52=%line52%		&& if "%lyne52%" neq "" set write52=!write52!	%lyne52%
set write53=%line53%		&& if "%lyne53%" neq "" set write53=!write53!	%lyne53%
set write54=%line54%		&& if "%lyne54%" neq "" set write54=!write54!	%lyne54%
set write55=%line55%		&& if "%lyne55%" neq "" set write55=!write55!	%lyne55%
set write56=%line56%		&& if "%lyne56%" neq "" set write56=!write56!	%lyne56%
set write57=%line57%		&& if "%lyne57%" neq "" set write57=!write57!	%lyne57%
set write58=%line58%		&& if "%lyne58%" neq "" set write58=!write58!	%lyne58%
set write59=%line59%		&& if "%lyne59%" neq "" set write59=!write59!	%lyne59%
set write60=%line60%		&& if "%lyne60%" neq "" set write60=!write60!	%lyne60%
set write61=%line61%		&& if "%lyne61%" neq "" set write61=!write61!	%lyne61%
set write62=%line62%		&& if "%lyne62%" neq "" set write62=!write62!	%lyne62%
set write63=%line63%		&& if "%lyne63%" neq "" set write63=!write63!	%lyne63%
set write64=%line64%		&& if "%lyne64%" neq "" set write64=!write64!	%lyne64%
set write65=%line65%		&& if "%lyne65%" neq "" set write65=!write65!	%lyne65%
set write66=%line66%		&& if "%lyne66%" neq "" set write66=!write66!	%lyne66%
set write67=%line67%		&& if "%lyne67%" neq "" set write67=!write67!	%lyne67%
set write68=%line68%		&& if "%lyne68%" neq "" set write68=!write68!	%lyne68%
set write69=%line69%		&& if "%lyne69%" neq "" set write69=!write69!	%lyne69%
set write70=%line70%		&& if "%lyne70%" neq "" set write70=!write70!	%lyne70%
set write71=%line71%		&& if "%lyne71%" neq "" set write71=!write71!	%lyne71%
set write72=%line72%		&& if "%lyne72%" neq "" set write72=!write72!	%lyne72%
set write73=%line73%		&& if "%lyne73%" neq "" set write73=!write73!	%lyne73%
set write74=%line74%		&& if "%lyne74%" neq "" set write74=!write74!	%lyne74%
set write75=%line75%		&& if "%lyne75%" neq "" set write75=!write75!	%lyne75%
set write76=%line76%		&& if "%lyne76%" neq "" set write76=!write76!	%lyne76%
set write77=%line77%		&& if "%lyne77%" neq "" set write77=!write77!	%lyne77%
set write78=%line78%		&& if "%lyne78%" neq "" set write78=!write78!	%lyne78%
set write79=%line79%		&& if "%lyne79%" neq "" set write79=!write79!	%lyne79%
set write80=%line80%		&& if "%lyne80%" neq "" set write80=!write80!	%lyne80%
set write81=%line81%		&& if "%lyne81%" neq "" set write81=!write81!	%lyne81%
set write82=%line82%		&& if "%lyne82%" neq "" set write82=!write82!	%lyne82%
set write83=%line83%		&& if "%lyne83%" neq "" set write83=!write83!	%lyne83%
set write84=%line84%		&& if "%lyne84%" neq "" set write84=!write84!	%lyne84%
set write85=%line85%		&& if "%lyne85%" neq "" set write85=!write85!	%lyne85%
set write86=%line86%		&& if "%lyne86%" neq "" set write86=!write86!	%lyne86%
set write87=%line87%		&& if "%lyne87%" neq "" set write87=!write87!	%lyne87%
set write88=%line88%		&& if "%lyne88%" neq "" set write88=!write88!	%lyne88%
set write89=%line89%		&& if "%lyne89%" neq "" set write89=!write89!	%lyne89%
set write90=%line90%		&& if "%lyne90%" neq "" set write90=!write90!	%lyne90%
set write91=%line91%		&& if "%lyne91%" neq "" set write91=!write91!	%lyne91%
set write92=%line92%		&& if "%lyne92%" neq "" set write92=!write92!	%lyne92%
set write93=%line93%		&& if "%lyne93%" neq "" set write93=!write93!	%lyne93%
set write94=%line94%		&& if "%lyne94%" neq "" set write94=!write94!	%lyne94%
set write95=%line95%		&& if "%lyne95%" neq "" set write95=!write95!	%lyne95%
set write96=%line96%		&& if "%lyne96%" neq "" set write96=!write96!	%lyne96%
set write97=%line97%		&& if "%lyne97%" neq "" set write97=!write97!	%lyne97%
set write98=%line98%		&& if "%lyne98%" neq "" set write98=!write98!	%lyne98%
set write99=%line99%		&& if "%lyne99%" neq "" set write99=!write99!	%lyne99%
set write100=%line100%		&& if "%lyne100%" neq "" set write100=!write100!	%lyne100%
set write101=%line101%		&& if "%lyne101%" neq "" set write101=!write101!	%lyne101%
set write102=%line102%		&& if "%lyne102%" neq "" set write102=!write102!	%lyne102%
set write103=%line103%		&& if "%lyne103%" neq "" set write103=!write103!	%lyne103%
set write104=%line104%		&& if "%lyne104%" neq "" set write104=!write104!	%lyne104%
set write105=%line105%		&& if "%lyne105%" neq "" set write105=!write105!	%lyne105%
set write106=%line106%		&& if "%lyne106%" neq "" set write106=!write106!	%lyne106%
set write107=%line107%		&& if "%lyne107%" neq "" set write107=!write107!	%lyne107%
set write108=%line108%		&& if "%lyne108%" neq "" set write108=!write108!	%lyne108%
set write109=%line109%		&& if "%lyne109%" neq "" set write109=!write109!	%lyne109%
set write110=%line110%		&& if "%lyne110%" neq "" set write110=!write110!	%lyne110%
set write111=%line111%		&& if "%lyne111%" neq "" set write111=!write111!	%lyne111%
set write112=%line112%		&& if "%lyne112%" neq "" set write112=!write112!	%lyne112%
set write113=%line113%		&& if "%lyne113%" neq "" set write113=!write113!	%lyne113%
set write114=%line114%		&& if "%lyne114%" neq "" set write114=!write114!	%lyne114%
set write115=%line115%		&& if "%lyne115%" neq "" set write115=!write115!	%lyne115%
set write116=%line116%		&& if "%lyne116%" neq "" set write116=!write116!	%lyne116%
set write117=%line117%		&& if "%lyne117%" neq "" set write117=!write117!	%lyne117%
set write118=%line118%		&& if "%lyne118%" neq "" set write118=!write118!	%lyne118%
set write119=%line119%		&& if "%lyne119%" neq "" set write119=!write119!	%lyne119%
set write120=%line120%		&& if "%lyne120%" neq "" set write120=!write120!	%lyne120%
set write121=%line121%		&& if "%lyne121%" neq "" set write121=!write121!	%lyne121%
set write122=%line122%		&& if "%lyne122%" neq "" set write122=!write122!	%lyne122%
set write123=%line123%		&& if "%lyne123%" neq "" set write123=!write123!	%lyne123%
set write124=%line124%		&& if "%lyne124%" neq "" set write124=!write124!	%lyne124%
set write125=%line125%		&& if "%lyne125%" neq "" set write125=!write125!	%lyne125%
set write126=%line126%		&& if "%lyne126%" neq "" set write126=!write126!	%lyne126%
set write127=%line127%		&& if "%lyne127%" neq "" set write127=!write127!	%lyne127%
set write128=%line128%		&& if "%lyne128%" neq "" set write128=!write128!	%lyne128%
set write129=%line129%		&& if "%lyne129%" neq "" set write129=!write129!	%lyne129%
set write130=%line130%		&& if "%lyne130%" neq "" set write130=!write130!	%lyne130%
set write131=%line131%		&& if "%lyne131%" neq "" set write131=!write131!	%lyne131%
set write132=%line132%		&& if "%lyne132%" neq "" set write132=!write132!	%lyne132%
set write133=%line133%		&& if "%lyne133%" neq "" set write133=!write133!	%lyne133%
set write134=%line134%		&& if "%lyne134%" neq "" set write134=!write134!	%lyne134%
set write135=%line135%		&& if "%lyne135%" neq "" set write135=!write135!	%lyne135%
set write136=%line136%		&& if "%lyne136%" neq "" set write136=!write136!	%lyne136%
set write137=%line137%		&& if "%lyne137%" neq "" set write137=!write137!	%lyne137%
set write138=%line138%		&& if "%lyne138%" neq "" set write138=!write138!	%lyne138%
set write139=%line139%		&& if "%lyne139%" neq "" set write139=!write139!	%lyne139%
set write140=%line140%		&& if "%lyne140%" neq "" set write140=!write140!	%lyne140%
set write141=%line141%		&& if "%lyne141%" neq "" set write141=!write141!	%lyne141%
set write142=%line142%		&& if "%lyne142%" neq "" set write142=!write142!	%lyne142%
set write143=%line143%		&& if "%lyne143%" neq "" set write143=!write143!	%lyne143%
set write144=%line144%		&& if "%lyne144%" neq "" set write144=!write144!	%lyne144%
set write145=%line145%		&& if "%lyne145%" neq "" set write145=!write145!	%lyne145%
set write146=%line146%		&& if "%lyne146%" neq "" set write146=!write146!	%lyne146%
set write147=%line147%		&& if "%lyne147%" neq "" set write147=!write147!	%lyne147%
set write148=%line148%		&& if "%lyne148%" neq "" set write148=!write148!	%lyne148%
set write149=%line149%		&& if "%lyne149%" neq "" set write149=!write149!	%lyne149%
set write150=%line150%		&& if "%lyne150%" neq "" set write150=!write150!	%lyne150%
set write151=%line151%		&& if "%lyne151%" neq "" set write151=!write151!	%lyne151%
set write152=%line152%		&& if "%lyne152%" neq "" set write152=!write152!	%lyne152%
set write153=%line153%		&& if "%lyne153%" neq "" set write153=!write153!	%lyne153%
set write154=%line154%		&& if "%lyne154%" neq "" set write154=!write154!	%lyne154%
set write155=%line155%		&& if "%lyne155%" neq "" set write155=!write155!	%lyne155%
set write156=%line156%		&& if "%lyne156%" neq "" set write156=!write156!	%lyne156%
set write157=%line157%		&& if "%lyne157%" neq "" set write157=!write157!	%lyne157%
set write158=%line158%		&& if "%lyne158%" neq "" set write158=!write158!	%lyne158%
set write159=%line159%		&& if "%lyne159%" neq "" set write159=!write159!	%lyne159%
set write160=%line160%		&& if "%lyne160%" neq "" set write160=!write160!	%lyne160%
set write161=%line161%		&& if "%lyne161%" neq "" set write161=!write161!	%lyne161%
set write162=%line162%		&& if "%lyne162%" neq "" set write162=!write162!	%lyne162%
set write163=%line163%		&& if "%lyne163%" neq "" set write163=!write163!	%lyne163%
set write164=%line164%		&& if "%lyne164%" neq "" set write164=!write164!	%lyne164%
set write165=%line165%		&& if "%lyne165%" neq "" set write165=!write165!	%lyne165%
set write166=%line166%		&& if "%lyne166%" neq "" set write166=!write166!	%lyne166%
set write167=%line167%		&& if "%lyne167%" neq "" set write167=!write167!	%lyne167%
set write168=%line168%		&& if "%lyne168%" neq "" set write168=!write168!	%lyne168%
set write169=%line169%		&& if "%lyne169%" neq "" set write169=!write169!	%lyne169%
set write170=%line170%		&& if "%lyne170%" neq "" set write170=!write170!	%lyne170%
set write171=%line171%		&& if "%lyne171%" neq "" set write171=!write171!	%lyne171%
set write172=%line172%		&& if "%lyne172%" neq "" set write172=!write172!	%lyne172%
set write173=%line173%		&& if "%lyne173%" neq "" set write173=!write173!	%lyne173%
set write174=%line174%		&& if "%lyne174%" neq "" set write174=!write174!	%lyne174%
set write175=%line175%		&& if "%lyne175%" neq "" set write175=!write175!	%lyne175%
set write176=%line176%		&& if "%lyne176%" neq "" set write176=!write176!	%lyne176%
set write177=%line177%		&& if "%lyne177%" neq "" set write177=!write177!	%lyne177%
set write178=%line178%		&& if "%lyne178%" neq "" set write178=!write178!	%lyne178%
set write179=%line179%		&& if "%lyne179%" neq "" set write179=!write179!	%lyne179%
set write180=%line180%		&& if "%lyne180%" neq "" set write180=!write180!	%lyne180%
set write181=%line181%		&& if "%lyne181%" neq "" set write181=!write181!	%lyne181%
set write182=%line182%		&& if "%lyne182%" neq "" set write182=!write182!	%lyne182%
set write183=%line183%		&& if "%lyne183%" neq "" set write183=!write183!	%lyne183%
set write184=%line184%		&& if "%lyne184%" neq "" set write184=!write184!	%lyne184%
set write185=%line185%		&& if "%lyne185%" neq "" set write185=!write185!	%lyne185%
set write186=%line186%		&& if "%lyne186%" neq "" set write186=!write186!	%lyne186%
set write187=%line187%		&& if "%lyne187%" neq "" set write187=!write187!	%lyne187%
set write188=%line188%		&& if "%lyne188%" neq "" set write188=!write188!	%lyne188%
set write189=%line189%		&& if "%lyne189%" neq "" set write189=!write189!	%lyne189%
set write190=%line190%		&& if "%lyne190%" neq "" set write190=!write190!	%lyne190%
set write191=%line191%		&& if "%lyne191%" neq "" set write191=!write191!	%lyne191%
set write192=%line192%		&& if "%lyne192%" neq "" set write192=!write192!	%lyne192%
set write193=%line193%		&& if "%lyne193%" neq "" set write193=!write193!	%lyne193%
set write194=%line194%		&& if "%lyne194%" neq "" set write194=!write194!	%lyne194%
set write195=%line195%		&& if "%lyne195%" neq "" set write195=!write195!	%lyne195%
set write196=%line196%		&& if "%lyne196%" neq "" set write196=!write196!	%lyne196%
set write197=%line197%		&& if "%lyne197%" neq "" set write197=!write197!	%lyne197%
set write198=%line198%		&& if "%lyne198%" neq "" set write198=!write198!	%lyne198%
set write199=%line199%		&& if "%lyne199%" neq "" set write199=!write199!	%lyne199%
set write200=%line200%		&& if "%lyne200%" neq "" set write200=!write200!	%lyne200%
set write201=%line201%		&& if "%lyne201%" neq "" set write201=!write201!	%lyne201%
set write202=%line202%		&& if "%lyne202%" neq "" set write202=!write202!	%lyne202%
set write203=%line203%		&& if "%lyne203%" neq "" set write203=!write203!	%lyne203%
set write204=%line204%		&& if "%lyne204%" neq "" set write204=!write204!	%lyne204%
set write205=%line205%		&& if "%lyne205%" neq "" set write205=!write205!	%lyne205%
set write206=%line206%		&& if "%lyne206%" neq "" set write206=!write206!	%lyne206%
set write207=%line207%		&& if "%lyne207%" neq "" set write207=!write207!	%lyne207%
set write208=%line208%		&& if "%lyne208%" neq "" set write208=!write208!	%lyne208%
set write209=%line209%		&& if "%lyne209%" neq "" set write209=!write209!	%lyne209%
set write210=%line210%		&& if "%lyne210%" neq "" set write210=!write210!	%lyne210%
set write211=%line211%		&& if "%lyne211%" neq "" set write211=!write211!	%lyne211%
set write212=%line212%		&& if "%lyne212%" neq "" set write212=!write212!	%lyne212%
set write213=%line213%		&& if "%lyne213%" neq "" set write213=!write213!	%lyne213%
set write214=%line214%		&& if "%lyne214%" neq "" set write214=!write214!	%lyne214%
set write215=%line215%		&& if "%lyne215%" neq "" set write215=!write215!	%lyne215%
set write216=%line216%		&& if "%lyne216%" neq "" set write216=!write216!	%lyne216%
set write217=%line217%		&& if "%lyne217%" neq "" set write217=!write217!	%lyne217%
set write218=%line218%		&& if "%lyne218%" neq "" set write218=!write218!	%lyne218%
set write219=%line219%		&& if "%lyne219%" neq "" set write219=!write219!	%lyne219%
set write220=%line220%		&& if "%lyne220%" neq "" set write220=!write220!	%lyne220%
set write221=%line221%		&& if "%lyne221%" neq "" set write221=!write221!	%lyne221%
set write222=%line222%		&& if "%lyne222%" neq "" set write222=!write222!	%lyne222%
set write223=%line223%		&& if "%lyne223%" neq "" set write223=!write223!	%lyne223%
set write224=%line224%		&& if "%lyne224%" neq "" set write224=!write224!	%lyne224%
set write225=%line225%		&& if "%lyne225%" neq "" set write225=!write225!	%lyne225%
set write226=%line226%		&& if "%lyne226%" neq "" set write226=!write226!	%lyne226%
set write227=%line227%		&& if "%lyne227%" neq "" set write227=!write227!	%lyne227%
set write228=%line228%		&& if "%lyne228%" neq "" set write228=!write228!	%lyne228%
set write229=%line229%		&& if "%lyne229%" neq "" set write229=!write229!	%lyne229%
set write230=%line230%		&& if "%lyne230%" neq "" set write230=!write230!	%lyne230%
set write231=%line231%		&& if "%lyne231%" neq "" set write231=!write231!	%lyne231%
set write232=%line232%		&& if "%lyne232%" neq "" set write232=!write232!	%lyne232%
set write233=%line233%		&& if "%lyne233%" neq "" set write233=!write233!	%lyne233%
set write234=%line234%		&& if "%lyne234%" neq "" set write234=!write234!	%lyne234%
set write235=%line235%		&& if "%lyne235%" neq "" set write235=!write235!	%lyne235%
set write236=%line236%		&& if "%lyne236%" neq "" set write236=!write236!	%lyne236%
set write237=%line237%		&& if "%lyne237%" neq "" set write237=!write237!	%lyne237%
set write238=%line238%		&& if "%lyne238%" neq "" set write238=!write238!	%lyne238%
set write239=%line239%		&& if "%lyne239%" neq "" set write239=!write239!	%lyne239%
set write240=%line240%		&& if "%lyne240%" neq "" set write240=!write240!	%lyne240%
set write241=%line241%		&& if "%lyne241%" neq "" set write241=!write241!	%lyne241%
set write242=%line242%		&& if "%lyne242%" neq "" set write242=!write242!	%lyne242%
set write243=%line243%		&& if "%lyne243%" neq "" set write243=!write243!	%lyne243%
set write244=%line244%		&& if "%lyne244%" neq "" set write244=!write244!	%lyne244%
set write245=%line245%		&& if "%lyne245%" neq "" set write245=!write245!	%lyne245%
set write246=%line246%		&& if "%lyne246%" neq "" set write246=!write246!	%lyne246%
set write247=%line247%		&& if "%lyne247%" neq "" set write247=!write247!	%lyne247%
set write248=%line248%		&& if "%lyne248%" neq "" set write248=!write248!	%lyne248%
set write249=%line249%		&& if "%lyne249%" neq "" set write249=!write249!	%lyne249%
set write250=%line250%		&& if "%lyne250%" neq "" set write250=!write250!	%lyne250%
set write251=%line251%		&& if "%lyne251%" neq "" set write251=!write251!	%lyne251%
set write252=%line252%		&& if "%lyne252%" neq "" set write252=!write252!	%lyne252%
set write253=%line253%		&& if "%lyne253%" neq "" set write253=!write253!	%lyne253%
set write254=%line254%		&& if "%lyne254%" neq "" set write254=!write254!	%lyne254%
set write255=%line255%		&& if "%lyne255%" neq "" set write255=!write255!	%lyne255%
set write256=%line256%		&& if "%lyne256%" neq "" set write256=!write256!	%lyne256%
set write257=%line257%		&& if "%lyne257%" neq "" set write257=!write257!	%lyne257%
set write258=%line258%		&& if "%lyne258%" neq "" set write258=!write258!	%lyne258%
set write259=%line259%		&& if "%lyne259%" neq "" set write259=!write259!	%lyne259%
set write260=%line260%		&& if "%lyne260%" neq "" set write260=!write260!	%lyne260%
set write261=%line261%		&& if "%lyne261%" neq "" set write261=!write261!	%lyne261%
set write262=%line262%		&& if "%lyne262%" neq "" set write262=!write262!	%lyne262%
set write263=%line263%		&& if "%lyne263%" neq "" set write263=!write263!	%lyne263%
set write264=%line264%		&& if "%lyne264%" neq "" set write264=!write264!	%lyne264%
set write265=%line265%		&& if "%lyne265%" neq "" set write265=!write265!	%lyne265%
set write266=%line266%		&& if "%lyne266%" neq "" set write266=!write266!	%lyne266%
set write267=%line267%		&& if "%lyne267%" neq "" set write267=!write267!	%lyne267%
set write268=%line268%		&& if "%lyne268%" neq "" set write268=!write268!	%lyne268%
set write269=%line269%		&& if "%lyne269%" neq "" set write269=!write269!	%lyne269%
set write270=%line270%		&& if "%lyne270%" neq "" set write270=!write270!	%lyne270%
set write271=%line271%		&& if "%lyne271%" neq "" set write271=!write271!	%lyne271%
set write272=%line272%		&& if "%lyne272%" neq "" set write272=!write272!	%lyne272%
set write273=%line273%		&& if "%lyne273%" neq "" set write273=!write273!	%lyne273%
set write274=%line274%		&& if "%lyne274%" neq "" set write274=!write274!	%lyne274%
set write275=%line275%		&& if "%lyne275%" neq "" set write275=!write275!	%lyne275%
set write276=%line276%		&& if "%lyne276%" neq "" set write276=!write276!	%lyne276%
set write277=%line277%		&& if "%lyne277%" neq "" set write277=!write277!	%lyne277%
set write278=%line278%		&& if "%lyne278%" neq "" set write278=!write278!	%lyne278%
set write279=%line279%		&& if "%lyne279%" neq "" set write279=!write279!	%lyne279%
set write280=%line280%		&& if "%lyne280%" neq "" set write280=!write280!	%lyne280%
set write281=%line281%		&& if "%lyne281%" neq "" set write281=!write281!	%lyne281%
set write282=%line282%		&& if "%lyne282%" neq "" set write282=!write282!	%lyne282%
set write283=%line283%		&& if "%lyne283%" neq "" set write283=!write283!	%lyne283%
set write284=%line284%		&& if "%lyne284%" neq "" set write284=!write284!	%lyne284%
set write285=%line285%		&& if "%lyne285%" neq "" set write285=!write285!	%lyne285%
set write286=%line286%		&& if "%lyne286%" neq "" set write286=!write286!	%lyne286%
set write287=%line287%		&& if "%lyne287%" neq "" set write287=!write287!	%lyne287%
set write288=%line288%		&& if "%lyne288%" neq "" set write288=!write288!	%lyne288%
set write289=%line289%		&& if "%lyne289%" neq "" set write289=!write289!	%lyne289%
set write290=%line290%		&& if "%lyne290%" neq "" set write290=!write290!	%lyne290%
set write291=%line291%		&& if "%lyne291%" neq "" set write291=!write291!	%lyne291%
set write292=%line292%		&& if "%lyne292%" neq "" set write292=!write292!	%lyne292%
set write293=%line293%		&& if "%lyne293%" neq "" set write293=!write293!	%lyne293%
set write294=%line294%		&& if "%lyne294%" neq "" set write294=!write294!	%lyne294%
set write295=%line295%		&& if "%lyne295%" neq "" set write295=!write295!	%lyne295%
set write296=%line296%		&& if "%lyne296%" neq "" set write296=!write296!	%lyne296%
set write297=%line297%		&& if "%lyne297%" neq "" set write297=!write297!	%lyne297%
set write298=%line298%		&& if "%lyne298%" neq "" set write298=!write298!	%lyne298%
set write299=%line299%		&& if "%lyne299%" neq "" set write299=!write299!	%lyne299%
set write300=%line300%		&& if "%lyne300%" neq "" set write300=!write300!	%lyne300%

set "write0=LIST OF BLOCKS:						LIST OF COMPONENTS:
goto :echo

:echo
echo.
echo.
echo   %write0%
if "%write1%" neq "							" echo   %write1%
if "%write2%" neq "							" echo   %write2%
if "%write3%" neq "							" echo   %write3%
if "%write4%" neq "							" echo   %write4%
if "%write5%" neq "							" echo   %write5%
if "%write6%" neq "							" echo   %write6%
if "%write7%" neq "							" echo   %write7%
if "%write8%" neq "							" echo   %write8%
if "%write9%" neq "							" echo   %write9%
if "%write10%" neq "							" echo   %write10%
if "%write11%" neq "							" echo   %write11%
if "%write12%" neq "							" echo   %write12%
if "%write13%" neq "							" echo   %write13%
if "%write14%" neq "							" echo   %write14%
if "%write15%" neq "							" echo   %write15%
if "%write16%" neq "							" echo   %write16%
if "%write17%" neq "							" echo   %write17%
if "%write18%" neq "							" echo   %write18%
if "%write19%" neq "							" echo   %write19%
if "%write20%" neq "							" echo   %write20%
if "%write21%" neq "							" echo   %write21%
if "%write22%" neq "							" echo   %write22%
if "%write23%" neq "							" echo   %write23%
if "%write24%" neq "							" echo   %write24%
if "%write25%" neq "							" echo   %write25%
if "%write26%" neq "							" echo   %write26%
if "%write27%" neq "							" echo   %write27%
if "%write28%" neq "							" echo   %write28%
if "%write29%" neq "							" echo   %write29%
if "%write30%" neq "							" echo   %write30%
if "%write31%" neq "							" echo   %write31%
if "%write32%" neq "							" echo   %write32%
if "%write33%" neq "							" echo   %write33%
if "%write34%" neq "							" echo   %write34%
if "%write35%" neq "							" echo   %write35%
if "%write36%" neq "							" echo   %write36%
if "%write37%" neq "							" echo   %write37%
if "%write38%" neq "							" echo   %write38%
if "%write39%" neq "							" echo   %write39%
if "%write40%" neq "							" echo   %write40%
if "%write41%" neq "							" echo   %write41%
if "%write42%" neq "							" echo   %write42%
if "%write43%" neq "							" echo   %write43%
if "%write44%" neq "							" echo   %write44%
if "%write45%" neq "							" echo   %write45%
if "%write46%" neq "							" echo   %write46%
if "%write47%" neq "							" echo   %write47%
if "%write48%" neq "							" echo   %write48%
if "%write49%" neq "							" echo   %write49%
if "%write50%" neq "							" echo   %write50%
if "%write51%" neq "							" echo   %write51%
if "%write52%" neq "							" echo   %write52%
if "%write53%" neq "							" echo   %write53%
if "%write54%" neq "							" echo   %write54%
if "%write55%" neq "							" echo   %write55%
if "%write56%" neq "							" echo   %write56%
if "%write57%" neq "							" echo   %write57%
if "%write58%" neq "							" echo   %write58%
if "%write59%" neq "							" echo   %write59%
if "%write60%" neq "							" echo   %write60%
if "%write61%" neq "							" echo   %write61%
if "%write62%" neq "							" echo   %write62%
if "%write63%" neq "							" echo   %write63%
if "%write64%" neq "							" echo   %write64%
if "%write65%" neq "							" echo   %write65%
if "%write66%" neq "							" echo   %write66%
if "%write67%" neq "							" echo   %write67%
if "%write68%" neq "							" echo   %write68%
if "%write69%" neq "							" echo   %write69%
if "%write70%" neq "							" echo   %write70%
if "%write71%" neq "							" echo   %write71%
if "%write72%" neq "							" echo   %write72%
if "%write73%" neq "							" echo   %write73%
if "%write74%" neq "							" echo   %write74%
if "%write75%" neq "							" echo   %write75%
if "%write76%" neq "							" echo   %write76%
if "%write77%" neq "							" echo   %write77%
if "%write78%" neq "							" echo   %write78%
if "%write79%" neq "							" echo   %write79%
if "%write80%" neq "							" echo   %write80%
if "%write81%" neq "							" echo   %write81%
if "%write82%" neq "							" echo   %write82%
if "%write83%" neq "							" echo   %write83%
if "%write84%" neq "							" echo   %write84%
if "%write85%" neq "							" echo   %write85%
if "%write86%" neq "							" echo   %write86%
if "%write87%" neq "							" echo   %write87%
if "%write88%" neq "							" echo   %write88%
if "%write89%" neq "							" echo   %write89%
if "%write90%" neq "							" echo   %write90%
if "%write91%" neq "							" echo   %write91%
if "%write92%" neq "							" echo   %write92%
if "%write93%" neq "							" echo   %write93%
if "%write94%" neq "							" echo   %write94%
if "%write95%" neq "							" echo   %write95%
if "%write96%" neq "							" echo   %write96%
if "%write97%" neq "							" echo   %write97%
if "%write98%" neq "							" echo   %write98%
if "%write99%" neq "							" echo   %write99%
if "%write100%" neq "							" echo   %write100%
if "%write101%" neq "							" echo   %write101%
if "%write102%" neq "							" echo   %write102%
if "%write103%" neq "							" echo   %write103%
if "%write104%" neq "							" echo   %write104%
if "%write105%" neq "							" echo   %write105%
if "%write106%" neq "							" echo   %write106%
if "%write107%" neq "							" echo   %write107%
if "%write108%" neq "							" echo   %write108%
if "%write109%" neq "							" echo   %write109%
if "%write110%" neq "							" echo   %write110%
if "%write111%" neq "							" echo   %write111%
if "%write112%" neq "							" echo   %write112%
if "%write113%" neq "							" echo   %write113%
if "%write114%" neq "							" echo   %write114%
if "%write115%" neq "							" echo   %write115%
if "%write116%" neq "							" echo   %write116%
if "%write117%" neq "							" echo   %write117%
if "%write118%" neq "							" echo   %write118%
if "%write119%" neq "							" echo   %write119%
if "%write120%" neq "							" echo   %write120%
if "%write121%" neq "							" echo   %write121%
if "%write122%" neq "							" echo   %write122%
if "%write123%" neq "							" echo   %write123%
if "%write124%" neq "							" echo   %write124%
if "%write125%" neq "							" echo   %write125%
if "%write126%" neq "							" echo   %write126%
if "%write127%" neq "							" echo   %write127%
if "%write128%" neq "							" echo   %write128%
if "%write129%" neq "							" echo   %write129%
if "%write130%" neq "							" echo   %write130%
if "%write131%" neq "							" echo   %write131%
if "%write132%" neq "							" echo   %write132%
if "%write133%" neq "							" echo   %write133%
if "%write134%" neq "							" echo   %write134%
if "%write135%" neq "							" echo   %write135%
if "%write136%" neq "							" echo   %write136%
if "%write137%" neq "							" echo   %write137%
if "%write138%" neq "							" echo   %write138%
if "%write139%" neq "							" echo   %write139%
if "%write140%" neq "							" echo   %write140%
if "%write141%" neq "							" echo   %write141%
if "%write142%" neq "							" echo   %write142%
if "%write143%" neq "							" echo   %write143%
if "%write144%" neq "							" echo   %write144%
if "%write145%" neq "							" echo   %write145%
if "%write146%" neq "							" echo   %write146%
if "%write147%" neq "							" echo   %write147%
if "%write148%" neq "							" echo   %write148%
if "%write149%" neq "							" echo   %write149%
if "%write150%" neq "							" echo   %write150%
if "%write151%" neq "							" echo   %write151%
if "%write152%" neq "							" echo   %write152%
if "%write153%" neq "							" echo   %write153%
if "%write154%" neq "							" echo   %write154%
if "%write155%" neq "							" echo   %write155%
if "%write156%" neq "							" echo   %write156%
if "%write157%" neq "							" echo   %write157%
if "%write158%" neq "							" echo   %write158%
if "%write159%" neq "							" echo   %write159%
if "%write160%" neq "							" echo   %write160%
if "%write161%" neq "							" echo   %write161%
if "%write162%" neq "							" echo   %write162%
if "%write163%" neq "							" echo   %write163%
if "%write164%" neq "							" echo   %write164%
if "%write165%" neq "							" echo   %write165%
if "%write166%" neq "							" echo   %write166%
if "%write167%" neq "							" echo   %write167%
if "%write168%" neq "							" echo   %write168%
if "%write169%" neq "							" echo   %write169%
if "%write170%" neq "							" echo   %write170%
if "%write171%" neq "							" echo   %write171%
if "%write172%" neq "							" echo   %write172%
if "%write173%" neq "							" echo   %write173%
if "%write174%" neq "							" echo   %write174%
if "%write175%" neq "							" echo   %write175%
if "%write176%" neq "							" echo   %write176%
if "%write177%" neq "							" echo   %write177%
if "%write178%" neq "							" echo   %write178%
if "%write179%" neq "							" echo   %write179%
if "%write180%" neq "							" echo   %write180%
if "%write181%" neq "							" echo   %write181%
if "%write182%" neq "							" echo   %write182%
if "%write183%" neq "							" echo   %write183%
if "%write184%" neq "							" echo   %write184%
if "%write185%" neq "							" echo   %write185%
if "%write186%" neq "							" echo   %write186%
if "%write187%" neq "							" echo   %write187%
if "%write188%" neq "							" echo   %write188%
if "%write189%" neq "							" echo   %write189%
if "%write190%" neq "							" echo   %write190%
if "%write191%" neq "							" echo   %write191%
if "%write192%" neq "							" echo   %write192%
if "%write193%" neq "							" echo   %write193%
if "%write194%" neq "							" echo   %write194%
if "%write195%" neq "							" echo   %write195%
if "%write196%" neq "							" echo   %write196%
if "%write197%" neq "							" echo   %write197%
if "%write198%" neq "							" echo   %write198%
if "%write199%" neq "							" echo   %write199%
if "%write200%" neq "							" echo   %write200%
if "%write201%" neq "							" echo   %write201%
if "%write202%" neq "							" echo   %write202%
if "%write203%" neq "							" echo   %write203%
if "%write204%" neq "							" echo   %write204%
if "%write205%" neq "							" echo   %write205%
if "%write206%" neq "							" echo   %write206%
if "%write207%" neq "							" echo   %write207%
if "%write208%" neq "							" echo   %write208%
if "%write209%" neq "							" echo   %write209%
if "%write210%" neq "							" echo   %write210%
if "%write211%" neq "							" echo   %write211%
if "%write212%" neq "							" echo   %write212%
if "%write213%" neq "							" echo   %write213%
if "%write214%" neq "							" echo   %write214%
if "%write215%" neq "							" echo   %write215%
if "%write216%" neq "							" echo   %write216%
if "%write217%" neq "							" echo   %write217%
if "%write218%" neq "							" echo   %write218%
if "%write219%" neq "							" echo   %write219%
if "%write220%" neq "							" echo   %write220%
if "%write221%" neq "							" echo   %write221%
if "%write222%" neq "							" echo   %write222%
if "%write223%" neq "							" echo   %write223%
if "%write224%" neq "							" echo   %write224%
if "%write225%" neq "							" echo   %write225%
if "%write226%" neq "							" echo   %write226%
if "%write227%" neq "							" echo   %write227%
if "%write228%" neq "							" echo   %write228%
if "%write229%" neq "							" echo   %write229%
if "%write230%" neq "							" echo   %write230%
if "%write231%" neq "							" echo   %write231%
if "%write232%" neq "							" echo   %write232%
if "%write233%" neq "							" echo   %write233%
if "%write234%" neq "							" echo   %write234%
if "%write235%" neq "							" echo   %write235%
if "%write236%" neq "							" echo   %write236%
if "%write237%" neq "							" echo   %write237%
if "%write238%" neq "							" echo   %write238%
if "%write239%" neq "							" echo   %write239%
if "%write240%" neq "							" echo   %write240%
if "%write241%" neq "							" echo   %write241%
if "%write242%" neq "							" echo   %write242%
if "%write243%" neq "							" echo   %write243%
if "%write244%" neq "							" echo   %write244%
if "%write245%" neq "							" echo   %write245%
if "%write246%" neq "							" echo   %write246%
if "%write247%" neq "							" echo   %write247%
if "%write248%" neq "							" echo   %write248%
if "%write249%" neq "							" echo   %write249%
if "%write250%" neq "							" echo   %write250%
if "%write251%" neq "							" echo   %write251%
if "%write252%" neq "							" echo   %write252%
if "%write253%" neq "							" echo   %write253%
if "%write254%" neq "							" echo   %write254%
if "%write255%" neq "							" echo   %write255%
if "%write256%" neq "							" echo   %write256%
if "%write257%" neq "							" echo   %write257%
if "%write258%" neq "							" echo   %write258%
if "%write259%" neq "							" echo   %write259%
if "%write260%" neq "							" echo   %write260%
if "%write261%" neq "							" echo   %write261%
if "%write262%" neq "							" echo   %write262%
if "%write263%" neq "							" echo   %write263%
if "%write264%" neq "							" echo   %write264%
if "%write265%" neq "							" echo   %write265%
if "%write266%" neq "							" echo   %write266%
if "%write267%" neq "							" echo   %write267%
if "%write268%" neq "							" echo   %write268%
if "%write269%" neq "							" echo   %write269%
if "%write270%" neq "							" echo   %write270%
if "%write271%" neq "							" echo   %write271%
if "%write272%" neq "							" echo   %write272%
if "%write273%" neq "							" echo   %write273%
if "%write274%" neq "							" echo   %write274%
if "%write275%" neq "							" echo   %write275%
if "%write276%" neq "							" echo   %write276%
if "%write277%" neq "							" echo   %write277%
if "%write278%" neq "							" echo   %write278%
if "%write279%" neq "							" echo   %write279%
if "%write280%" neq "							" echo   %write280%
if "%write281%" neq "							" echo   %write281%
if "%write282%" neq "							" echo   %write282%
if "%write283%" neq "							" echo   %write283%
if "%write284%" neq "							" echo   %write284%
if "%write285%" neq "							" echo   %write285%
if "%write286%" neq "							" echo   %write286%
if "%write287%" neq "							" echo   %write287%
if "%write288%" neq "							" echo   %write288%
if "%write289%" neq "							" echo   %write289%
if "%write290%" neq "							" echo   %write290%
if "%write291%" neq "							" echo   %write291%
if "%write292%" neq "							" echo   %write292%
if "%write293%" neq "							" echo   %write293%
if "%write294%" neq "							" echo   %write294%
if "%write295%" neq "							" echo   %write295%
if "%write296%" neq "							" echo   %write296%
if "%write297%" neq "							" echo   %write297%
if "%write298%" neq "							" echo   %write298%
if "%write299%" neq "							" echo   %write299%
if "%write300%" neq "							" echo   %write300%

REM ---

echo. > "%name%.txt" Blueprint: %name%  by %owner%
echo. >> "%name%.txt"
echo. >> "%name%.txt"
echo. >> "%name%.txt" TOTAL BLOCKS: %TOTAL%
echo. >> "%name%.txt"
echo. >> "%name%.txt" TOTAL PCU: %PCU%
echo. >> "%name%.txt"
echo. >> "%name%.txt" ESTIMATED MASS: %MASS%
echo. >> "%name%.txt"
echo. >> "%name%.txt" ESTIMATED HEALTH: %HEALTH%
echo. >> "%name%.txt"
echo. >> "%name%.txt"

set "write0=LIST OF BLOCKS:						LIST OF COMPONENTS:
echo.
echo.
echo >> "%name%.txt"   %write0%
if "%write1%" neq "							" echo >> "%name%.txt"   %write1%
if "%write2%" neq "							" echo >> "%name%.txt"   %write2%
if "%write3%" neq "							" echo >> "%name%.txt"   %write3%
if "%write4%" neq "							" echo >> "%name%.txt"   %write4%
if "%write5%" neq "							" echo >> "%name%.txt"   %write5%
if "%write6%" neq "							" echo >> "%name%.txt"   %write6%
if "%write7%" neq "							" echo >> "%name%.txt"   %write7%
if "%write8%" neq "							" echo >> "%name%.txt"   %write8%
if "%write9%" neq "							" echo >> "%name%.txt"   %write9%
if "%write10%" neq "							" echo >> "%name%.txt"   %write10%
if "%write11%" neq "							" echo >> "%name%.txt"   %write11%
if "%write12%" neq "							" echo >> "%name%.txt"   %write12%
if "%write13%" neq "							" echo >> "%name%.txt"   %write13%
if "%write14%" neq "							" echo >> "%name%.txt"   %write14%
if "%write15%" neq "							" echo >> "%name%.txt"   %write15%
if "%write16%" neq "							" echo >> "%name%.txt"   %write16%
if "%write17%" neq "							" echo >> "%name%.txt"   %write17%
if "%write18%" neq "							" echo >> "%name%.txt"   %write18%
if "%write19%" neq "							" echo >> "%name%.txt"   %write19%
if "%write20%" neq "							" echo >> "%name%.txt"   %write20%
if "%write21%" neq "							" echo >> "%name%.txt"   %write21%
if "%write22%" neq "							" echo >> "%name%.txt"   %write22%
if "%write23%" neq "							" echo >> "%name%.txt"   %write23%
if "%write24%" neq "							" echo >> "%name%.txt"   %write24%
if "%write25%" neq "							" echo >> "%name%.txt"   %write25%
if "%write26%" neq "							" echo >> "%name%.txt"   %write26%
if "%write27%" neq "							" echo >> "%name%.txt"   %write27%
if "%write28%" neq "							" echo >> "%name%.txt"   %write28%
if "%write29%" neq "							" echo >> "%name%.txt"   %write29%
if "%write30%" neq "							" echo >> "%name%.txt"   %write30%
if "%write31%" neq "							" echo >> "%name%.txt"   %write31%
if "%write32%" neq "							" echo >> "%name%.txt"   %write32%
if "%write33%" neq "							" echo >> "%name%.txt"   %write33%
if "%write34%" neq "							" echo >> "%name%.txt"   %write34%
if "%write35%" neq "							" echo >> "%name%.txt"   %write35%
if "%write36%" neq "							" echo >> "%name%.txt"   %write36%
if "%write37%" neq "							" echo >> "%name%.txt"   %write37%
if "%write38%" neq "							" echo >> "%name%.txt"   %write38%
if "%write39%" neq "							" echo >> "%name%.txt"   %write39%
if "%write40%" neq "							" echo >> "%name%.txt"   %write40%
if "%write41%" neq "							" echo >> "%name%.txt"   %write41%
if "%write42%" neq "							" echo >> "%name%.txt"   %write42%
if "%write43%" neq "							" echo >> "%name%.txt"   %write43%
if "%write44%" neq "							" echo >> "%name%.txt"   %write44%
if "%write45%" neq "							" echo >> "%name%.txt"   %write45%
if "%write46%" neq "							" echo >> "%name%.txt"   %write46%
if "%write47%" neq "							" echo >> "%name%.txt"   %write47%
if "%write48%" neq "							" echo >> "%name%.txt"   %write48%
if "%write49%" neq "							" echo >> "%name%.txt"   %write49%
if "%write50%" neq "							" echo >> "%name%.txt"   %write50%
if "%write51%" neq "							" echo >> "%name%.txt"   %write51%
if "%write52%" neq "							" echo >> "%name%.txt"   %write52%
if "%write53%" neq "							" echo >> "%name%.txt"   %write53%
if "%write54%" neq "							" echo >> "%name%.txt"   %write54%
if "%write55%" neq "							" echo >> "%name%.txt"   %write55%
if "%write56%" neq "							" echo >> "%name%.txt"   %write56%
if "%write57%" neq "							" echo >> "%name%.txt"   %write57%
if "%write58%" neq "							" echo >> "%name%.txt"   %write58%
if "%write59%" neq "							" echo >> "%name%.txt"   %write59%
if "%write60%" neq "							" echo >> "%name%.txt"   %write60%
if "%write61%" neq "							" echo >> "%name%.txt"   %write61%
if "%write62%" neq "							" echo >> "%name%.txt"   %write62%
if "%write63%" neq "							" echo >> "%name%.txt"   %write63%
if "%write64%" neq "							" echo >> "%name%.txt"   %write64%
if "%write65%" neq "							" echo >> "%name%.txt"   %write65%
if "%write66%" neq "							" echo >> "%name%.txt"   %write66%
if "%write67%" neq "							" echo >> "%name%.txt"   %write67%
if "%write68%" neq "							" echo >> "%name%.txt"   %write68%
if "%write69%" neq "							" echo >> "%name%.txt"   %write69%
if "%write70%" neq "							" echo >> "%name%.txt"   %write70%
if "%write71%" neq "							" echo >> "%name%.txt"   %write71%
if "%write72%" neq "							" echo >> "%name%.txt"   %write72%
if "%write73%" neq "							" echo >> "%name%.txt"   %write73%
if "%write74%" neq "							" echo >> "%name%.txt"   %write74%
if "%write75%" neq "							" echo >> "%name%.txt"   %write75%
if "%write76%" neq "							" echo >> "%name%.txt"   %write76%
if "%write77%" neq "							" echo >> "%name%.txt"   %write77%
if "%write78%" neq "							" echo >> "%name%.txt"   %write78%
if "%write79%" neq "							" echo >> "%name%.txt"   %write79%
if "%write80%" neq "							" echo >> "%name%.txt"   %write80%
if "%write81%" neq "							" echo >> "%name%.txt"   %write81%
if "%write82%" neq "							" echo >> "%name%.txt"   %write82%
if "%write83%" neq "							" echo >> "%name%.txt"   %write83%
if "%write84%" neq "							" echo >> "%name%.txt"   %write84%
if "%write85%" neq "							" echo >> "%name%.txt"   %write85%
if "%write86%" neq "							" echo >> "%name%.txt"   %write86%
if "%write87%" neq "							" echo >> "%name%.txt"   %write87%
if "%write88%" neq "							" echo >> "%name%.txt"   %write88%
if "%write89%" neq "							" echo >> "%name%.txt"   %write89%
if "%write90%" neq "							" echo >> "%name%.txt"   %write90%
if "%write91%" neq "							" echo >> "%name%.txt"   %write91%
if "%write92%" neq "							" echo >> "%name%.txt"   %write92%
if "%write93%" neq "							" echo >> "%name%.txt"   %write93%
if "%write94%" neq "							" echo >> "%name%.txt"   %write94%
if "%write95%" neq "							" echo >> "%name%.txt"   %write95%
if "%write96%" neq "							" echo >> "%name%.txt"   %write96%
if "%write97%" neq "							" echo >> "%name%.txt"   %write97%
if "%write98%" neq "							" echo >> "%name%.txt"   %write98%
if "%write99%" neq "							" echo >> "%name%.txt"   %write99%
if "%write100%" neq "							" echo >> "%name%.txt"   %write100%
if "%write101%" neq "							" echo >> "%name%.txt"   %write101%
if "%write102%" neq "							" echo >> "%name%.txt"   %write102%
if "%write103%" neq "							" echo >> "%name%.txt"   %write103%
if "%write104%" neq "							" echo >> "%name%.txt"   %write104%
if "%write105%" neq "							" echo >> "%name%.txt"   %write105%
if "%write106%" neq "							" echo >> "%name%.txt"   %write106%
if "%write107%" neq "							" echo >> "%name%.txt"   %write107%
if "%write108%" neq "							" echo >> "%name%.txt"   %write108%
if "%write109%" neq "							" echo >> "%name%.txt"   %write109%
if "%write110%" neq "							" echo >> "%name%.txt"   %write110%
if "%write111%" neq "							" echo >> "%name%.txt"   %write111%
if "%write112%" neq "							" echo >> "%name%.txt"   %write112%
if "%write113%" neq "							" echo >> "%name%.txt"   %write113%
if "%write114%" neq "							" echo >> "%name%.txt"   %write114%
if "%write115%" neq "							" echo >> "%name%.txt"   %write115%
if "%write116%" neq "							" echo >> "%name%.txt"   %write116%
if "%write117%" neq "							" echo >> "%name%.txt"   %write117%
if "%write118%" neq "							" echo >> "%name%.txt"   %write118%
if "%write119%" neq "							" echo >> "%name%.txt"   %write119%
if "%write120%" neq "							" echo >> "%name%.txt"   %write120%
if "%write121%" neq "							" echo >> "%name%.txt"   %write121%
if "%write122%" neq "							" echo >> "%name%.txt"   %write122%
if "%write123%" neq "							" echo >> "%name%.txt"   %write123%
if "%write124%" neq "							" echo >> "%name%.txt"   %write124%
if "%write125%" neq "							" echo >> "%name%.txt"   %write125%
if "%write126%" neq "							" echo >> "%name%.txt"   %write126%
if "%write127%" neq "							" echo >> "%name%.txt"   %write127%
if "%write128%" neq "							" echo >> "%name%.txt"   %write128%
if "%write129%" neq "							" echo >> "%name%.txt"   %write129%
if "%write130%" neq "							" echo >> "%name%.txt"   %write130%
if "%write131%" neq "							" echo >> "%name%.txt"   %write131%
if "%write132%" neq "							" echo >> "%name%.txt"   %write132%
if "%write133%" neq "							" echo >> "%name%.txt"   %write133%
if "%write134%" neq "							" echo >> "%name%.txt"   %write134%
if "%write135%" neq "							" echo >> "%name%.txt"   %write135%
if "%write136%" neq "							" echo >> "%name%.txt"   %write136%
if "%write137%" neq "							" echo >> "%name%.txt"   %write137%
if "%write138%" neq "							" echo >> "%name%.txt"   %write138%
if "%write139%" neq "							" echo >> "%name%.txt"   %write139%
if "%write140%" neq "							" echo >> "%name%.txt"   %write140%
if "%write141%" neq "							" echo >> "%name%.txt"   %write141%
if "%write142%" neq "							" echo >> "%name%.txt"   %write142%
if "%write143%" neq "							" echo >> "%name%.txt"   %write143%
if "%write144%" neq "							" echo >> "%name%.txt"   %write144%
if "%write145%" neq "							" echo >> "%name%.txt"   %write145%
if "%write146%" neq "							" echo >> "%name%.txt"   %write146%
if "%write147%" neq "							" echo >> "%name%.txt"   %write147%
if "%write148%" neq "							" echo >> "%name%.txt"   %write148%
if "%write149%" neq "							" echo >> "%name%.txt"   %write149%
if "%write150%" neq "							" echo >> "%name%.txt"   %write150%
if "%write151%" neq "							" echo >> "%name%.txt"   %write151%
if "%write152%" neq "							" echo >> "%name%.txt"   %write152%
if "%write153%" neq "							" echo >> "%name%.txt"   %write153%
if "%write154%" neq "							" echo >> "%name%.txt"   %write154%
if "%write155%" neq "							" echo >> "%name%.txt"   %write155%
if "%write156%" neq "							" echo >> "%name%.txt"   %write156%
if "%write157%" neq "							" echo >> "%name%.txt"   %write157%
if "%write158%" neq "							" echo >> "%name%.txt"   %write158%
if "%write159%" neq "							" echo >> "%name%.txt"   %write159%
if "%write160%" neq "							" echo >> "%name%.txt"   %write160%
if "%write161%" neq "							" echo >> "%name%.txt"   %write161%
if "%write162%" neq "							" echo >> "%name%.txt"   %write162%
if "%write163%" neq "							" echo >> "%name%.txt"   %write163%
if "%write164%" neq "							" echo >> "%name%.txt"   %write164%
if "%write165%" neq "							" echo >> "%name%.txt"   %write165%
if "%write166%" neq "							" echo >> "%name%.txt"   %write166%
if "%write167%" neq "							" echo >> "%name%.txt"   %write167%
if "%write168%" neq "							" echo >> "%name%.txt"   %write168%
if "%write169%" neq "							" echo >> "%name%.txt"   %write169%
if "%write170%" neq "							" echo >> "%name%.txt"   %write170%
if "%write171%" neq "							" echo >> "%name%.txt"   %write171%
if "%write172%" neq "							" echo >> "%name%.txt"   %write172%
if "%write173%" neq "							" echo >> "%name%.txt"   %write173%
if "%write174%" neq "							" echo >> "%name%.txt"   %write174%
if "%write175%" neq "							" echo >> "%name%.txt"   %write175%
if "%write176%" neq "							" echo >> "%name%.txt"   %write176%
if "%write177%" neq "							" echo >> "%name%.txt"   %write177%
if "%write178%" neq "							" echo >> "%name%.txt"   %write178%
if "%write179%" neq "							" echo >> "%name%.txt"   %write179%
if "%write180%" neq "							" echo >> "%name%.txt"   %write180%
if "%write181%" neq "							" echo >> "%name%.txt"   %write181%
if "%write182%" neq "							" echo >> "%name%.txt"   %write182%
if "%write183%" neq "							" echo >> "%name%.txt"   %write183%
if "%write184%" neq "							" echo >> "%name%.txt"   %write184%
if "%write185%" neq "							" echo >> "%name%.txt"   %write185%
if "%write186%" neq "							" echo >> "%name%.txt"   %write186%
if "%write187%" neq "							" echo >> "%name%.txt"   %write187%
if "%write188%" neq "							" echo >> "%name%.txt"   %write188%
if "%write189%" neq "							" echo >> "%name%.txt"   %write189%
if "%write190%" neq "							" echo >> "%name%.txt"   %write190%
if "%write191%" neq "							" echo >> "%name%.txt"   %write191%
if "%write192%" neq "							" echo >> "%name%.txt"   %write192%
if "%write193%" neq "							" echo >> "%name%.txt"   %write193%
if "%write194%" neq "							" echo >> "%name%.txt"   %write194%
if "%write195%" neq "							" echo >> "%name%.txt"   %write195%
if "%write196%" neq "							" echo >> "%name%.txt"   %write196%
if "%write197%" neq "							" echo >> "%name%.txt"   %write197%
if "%write198%" neq "							" echo >> "%name%.txt"   %write198%
if "%write199%" neq "							" echo >> "%name%.txt"   %write199%
if "%write200%" neq "							" echo >> "%name%.txt"   %write200%
if "%write201%" neq "							" echo >> "%name%.txt"   %write201%
if "%write202%" neq "							" echo >> "%name%.txt"   %write202%
if "%write203%" neq "							" echo >> "%name%.txt"   %write203%
if "%write204%" neq "							" echo >> "%name%.txt"   %write204%
if "%write205%" neq "							" echo >> "%name%.txt"   %write205%
if "%write206%" neq "							" echo >> "%name%.txt"   %write206%
if "%write207%" neq "							" echo >> "%name%.txt"   %write207%
if "%write208%" neq "							" echo >> "%name%.txt"   %write208%
if "%write209%" neq "							" echo >> "%name%.txt"   %write209%
if "%write210%" neq "							" echo >> "%name%.txt"   %write210%
if "%write211%" neq "							" echo >> "%name%.txt"   %write211%
if "%write212%" neq "							" echo >> "%name%.txt"   %write212%
if "%write213%" neq "							" echo >> "%name%.txt"   %write213%
if "%write214%" neq "							" echo >> "%name%.txt"   %write214%
if "%write215%" neq "							" echo >> "%name%.txt"   %write215%
if "%write216%" neq "							" echo >> "%name%.txt"   %write216%
if "%write217%" neq "							" echo >> "%name%.txt"   %write217%
if "%write218%" neq "							" echo >> "%name%.txt"   %write218%
if "%write219%" neq "							" echo >> "%name%.txt"   %write219%
if "%write220%" neq "							" echo >> "%name%.txt"   %write220%
if "%write221%" neq "							" echo >> "%name%.txt"   %write221%
if "%write222%" neq "							" echo >> "%name%.txt"   %write222%
if "%write223%" neq "							" echo >> "%name%.txt"   %write223%
if "%write224%" neq "							" echo >> "%name%.txt"   %write224%
if "%write225%" neq "							" echo >> "%name%.txt"   %write225%
if "%write226%" neq "							" echo >> "%name%.txt"   %write226%
if "%write227%" neq "							" echo >> "%name%.txt"   %write227%
if "%write228%" neq "							" echo >> "%name%.txt"   %write228%
if "%write229%" neq "							" echo >> "%name%.txt"   %write229%
if "%write230%" neq "							" echo >> "%name%.txt"   %write230%
if "%write231%" neq "							" echo >> "%name%.txt"   %write231%
if "%write232%" neq "							" echo >> "%name%.txt"   %write232%
if "%write233%" neq "							" echo >> "%name%.txt"   %write233%
if "%write234%" neq "							" echo >> "%name%.txt"   %write234%
if "%write235%" neq "							" echo >> "%name%.txt"   %write235%
if "%write236%" neq "							" echo >> "%name%.txt"   %write236%
if "%write237%" neq "							" echo >> "%name%.txt"   %write237%
if "%write238%" neq "							" echo >> "%name%.txt"   %write238%
if "%write239%" neq "							" echo >> "%name%.txt"   %write239%
if "%write240%" neq "							" echo >> "%name%.txt"   %write240%
if "%write241%" neq "							" echo >> "%name%.txt"   %write241%
if "%write242%" neq "							" echo >> "%name%.txt"   %write242%
if "%write243%" neq "							" echo >> "%name%.txt"   %write243%
if "%write244%" neq "							" echo >> "%name%.txt"   %write244%
if "%write245%" neq "							" echo >> "%name%.txt"   %write245%
if "%write246%" neq "							" echo >> "%name%.txt"   %write246%
if "%write247%" neq "							" echo >> "%name%.txt"   %write247%
if "%write248%" neq "							" echo >> "%name%.txt"   %write248%
if "%write249%" neq "							" echo >> "%name%.txt"   %write249%
if "%write250%" neq "							" echo >> "%name%.txt"   %write250%
if "%write251%" neq "							" echo >> "%name%.txt"   %write251%
if "%write252%" neq "							" echo >> "%name%.txt"   %write252%
if "%write253%" neq "							" echo >> "%name%.txt"   %write253%
if "%write254%" neq "							" echo >> "%name%.txt"   %write254%
if "%write255%" neq "							" echo >> "%name%.txt"   %write255%
if "%write256%" neq "							" echo >> "%name%.txt"   %write256%
if "%write257%" neq "							" echo >> "%name%.txt"   %write257%
if "%write258%" neq "							" echo >> "%name%.txt"   %write258%
if "%write259%" neq "							" echo >> "%name%.txt"   %write259%
if "%write260%" neq "							" echo >> "%name%.txt"   %write260%
if "%write261%" neq "							" echo >> "%name%.txt"   %write261%
if "%write262%" neq "							" echo >> "%name%.txt"   %write262%
if "%write263%" neq "							" echo >> "%name%.txt"   %write263%
if "%write264%" neq "							" echo >> "%name%.txt"   %write264%
if "%write265%" neq "							" echo >> "%name%.txt"   %write265%
if "%write266%" neq "							" echo >> "%name%.txt"   %write266%
if "%write267%" neq "							" echo >> "%name%.txt"   %write267%
if "%write268%" neq "							" echo >> "%name%.txt"   %write268%
if "%write269%" neq "							" echo >> "%name%.txt"   %write269%
if "%write270%" neq "							" echo >> "%name%.txt"   %write270%
if "%write271%" neq "							" echo >> "%name%.txt"   %write271%
if "%write272%" neq "							" echo >> "%name%.txt"   %write272%
if "%write273%" neq "							" echo >> "%name%.txt"   %write273%
if "%write274%" neq "							" echo >> "%name%.txt"   %write274%
if "%write275%" neq "							" echo >> "%name%.txt"   %write275%
if "%write276%" neq "							" echo >> "%name%.txt"   %write276%
if "%write277%" neq "							" echo >> "%name%.txt"   %write277%
if "%write278%" neq "							" echo >> "%name%.txt"   %write278%
if "%write279%" neq "							" echo >> "%name%.txt"   %write279%
if "%write280%" neq "							" echo >> "%name%.txt"   %write280%
if "%write281%" neq "							" echo >> "%name%.txt"   %write281%
if "%write282%" neq "							" echo >> "%name%.txt"   %write282%
if "%write283%" neq "							" echo >> "%name%.txt"   %write283%
if "%write284%" neq "							" echo >> "%name%.txt"   %write284%
if "%write285%" neq "							" echo >> "%name%.txt"   %write285%
if "%write286%" neq "							" echo >> "%name%.txt"   %write286%
if "%write287%" neq "							" echo >> "%name%.txt"   %write287%
if "%write288%" neq "							" echo >> "%name%.txt"   %write288%
if "%write289%" neq "							" echo >> "%name%.txt"   %write289%
if "%write290%" neq "							" echo >> "%name%.txt"   %write290%
if "%write291%" neq "							" echo >> "%name%.txt"   %write291%
if "%write292%" neq "							" echo >> "%name%.txt"   %write292%
if "%write293%" neq "							" echo >> "%name%.txt"   %write293%
if "%write294%" neq "							" echo >> "%name%.txt"   %write294%
if "%write295%" neq "							" echo >> "%name%.txt"   %write295%
if "%write296%" neq "							" echo >> "%name%.txt"   %write296%
if "%write297%" neq "							" echo >> "%name%.txt"   %write297%
if "%write298%" neq "							" echo >> "%name%.txt"   %write298%
if "%write299%" neq "							" echo >> "%name%.txt"   %write299%
if "%write300%" neq "							" echo >> "%name%.txt"   %write300%

REM ---

clip < "%name%.txt"

echo.
echo Results have been saved to your clipboard and %name%.txt file.

echo.
pause> nul | set /p "=Press any key three times to exit..."
pause> nul
pause> nul




























    