function fizzbuzz(n) {
    
    for (let i = 1; i <= n; i++)

        var dspOutput = "";

        if( i % 3 == 0) { dspOutput += "Fizz"; };

        if( i % 5 == 0) { dspOutput += "Buzz"; };
        
        if( dspOutput == "") {dspOutput += i; };

}

console.log(fizzbuzz(100))