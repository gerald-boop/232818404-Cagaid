@echo off

:menu
cls
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
echo 4. Exit
set /p choice=Enter your choice (1-4): 

if "%choice%"=="1" goto circle
if "%choice%"=="2" goto triangle
if "%choice%"=="3" goto quadrilateral
if "%choice%"=="4" goto end
goto menu

:circle
set /p radius=Enter the radius of the circle: 
set /a area=314*radius*radius/100
echo The area of the circle is %area%
pause
goto menu

:triangle
set /p side1=Enter the first side of the triangle: 
set /p side2=Enter the second side of the triangle: 
set /p side3=Enter the third side of the triangle: 
set /a s=(side1+side2+side3)/2
set /a temp=s*(s-side1)*(s-side2)*(s-side3)
set /a area=temp
call :sqrt area
echo The area of the triangle is %area%
if "%side1%"=="%side2%" if "%side2%"=="%side3%" (
    echo The triangle is equilateral.
) else if "%side1%"=="%side2%" if not "%side2%"=="%side3%" (
    echo The triangle is isosceles.
) else if "%side1%"=="%side3%" if not "%side2%"=="%side3%" (
    echo The triangle is isosceles.
) else (
    echo The triangle is scalene.
)
pause
goto menu

:quadrilateral
set /p length=Enter the length of the quadrilateral: 
set /p width=Enter the width of the quadrilateral: 
set /a area=length*width
echo The area of the quadrilateral is %area%
if "%length%"=="%width%" (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)
pause
goto menu

:end
exit /b

:sqrt <result>
setlocal
set /a "a=%~1, r=a/2"
:_sqrt_loop
set /a "r2=(r+r+a/r)/2"
if %r% neq %r2% set "r=%r2%" & goto :_sqrt_loop
endlocal & set %~1=%r%
exit /b
