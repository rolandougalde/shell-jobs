# MS-DOS Batch colors

In a DOS batch file, you can change the color of the text displayed in the command prompt using the color command. 
The color command takes two hexadecimal digits: the first digit is for the background color, and the second is for the text color.

Here’s how to use the color command:

```batch
@echo off

REM Change the text color to light green on a black background
color 0A

echo This is text in light green on a black background.

REM You can change to another color if desired
color 1F
echo This is text in white on a blue background.

pause
```

## Explanation:

- The color command is followed by two digits:
	- The first digit represents the background color.
	- The second digit represents the text color.

Common color codes:

0 = Black
1 = Blue
2 = Green
3 = Aqua
4 = Red
5 = Purple
6 = Yellow
7 = White
8 = Gray
9 = Light Blue
A = Light Green
B = Light Aqua
C = Light Red
D = Light Purple
E = Light Yellow
F = Bright White

The first example in the script uses 0A, which sets the background to black (0) and the text to light green (A). 
The second example changes the background to blue (1) and the text to bright white (F).

### Notes:

The color command only affects the text and background within the command prompt session where the batch file is running.
If you want to reset to the default colors, you can use color without any parameters, or color 07 (default).
Copy and paste this script into a .bat file to see the effects of the different color settings.
