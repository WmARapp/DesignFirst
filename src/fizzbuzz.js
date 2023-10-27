function fizzbuzz(n) {
    for (let i = 0; i <= n - 1;)
        console.log(

            (++i % 3 ? '' : 'fizz')
            + (i % 5 ? '' : 'buzz' )
             || i)
             
}

console.log(fizzbuzz(100))