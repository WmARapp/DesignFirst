**free

dcl-s outputDisplay  char(20); 
dcl-s variable int(10); 

For variable = 1 by 1 to 100; 

    outputDisplay = *blanks;

    if %rem(variable:3) = 0;
        outputDisplay = %trim(outputDisplay) + 'Fizz';
        EndIf;

    If %rem(variable:5) = 0;
        outputDisplay =  %trim(outputDisplay) + 'Buzz';
    EndIf;

    if outputDisplay = *blanks;
        outputDisplay = %char( variable );
    EndIf;

    dsply outputDisplay;

EndFor;

return;