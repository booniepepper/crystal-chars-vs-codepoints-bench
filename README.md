# `chars` vs `codepoints` benchmark

I was curious if (like in some other languages) evaluating numeric
representations of strings was faster than their character representations.

The short answer is: in Crystal `codepoints` is negligibly faster.

The following is example output performed on a ThinkPad E480.

```
Benchmark #1: ../bin/hamming --chars
  Time (mean ± σ):      3.263 s ±  0.029 s    [User: 2.276 s, System: 0.975 s]
  Range (min … max):    3.247 s …  3.375 s    50 runs
 
Benchmark #2: ../bin/hamming --codepoints
  Time (mean ± σ):      3.251 s ±  0.040 s    [User: 2.265 s, System: 0.974 s]
  Range (min … max):    3.228 s …  3.395 s    50 runs
 
Summary
  '../bin/hamming --codepoints' ran
    1.00 ± 0.02 times faster than '../bin/hamming --chars'
```

The results are fairly stable, `codepoints` always beat `chars`, but the
difference is tiny. I wouldn't look here for an optimization, especially if you
need to actually _do_ anything with the characters (like display).

## What it's doing

The code under benchmark (`src/hamming.cr`) is calculating the Hamming distance
between two files of 100,000,000 characters each. The test (`test/bench`) is a
bash script that generates test data (using `src/gen_input.cr`) and runs
`hyperfine` for a performance comparision.

The idea for the using Hamming distance, and this benchmark in general, came
from [this exercism.io exercise](https://exercism.io/my/tracks/crystal#exercise-hamming)
where [my solution](https://exercism.io/tracks/crystal/exercises/hamming/solutions/66b59e52700c4c4896101fa47c0b4f15)
got some reasonable questions from the Crystal mentor reviewing it.

## Running the tests

1. Install [hyperfine](https://github.com/sharkdp/hyperfine)
2. Clone this repo
3. Build the crystal bits with `shards build --release`
4. Run `test/bench`
5. ...
6. Profit!

