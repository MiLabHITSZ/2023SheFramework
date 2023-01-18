function score = OneTurn(problem)
  score = main('-algorithm', @OptDM, '-problem', str2func(problem), '-N', 200, '-save', 1, ...
                    '-run', 1, '-evaluation', 40000, '-D', 2, '-rate', 0)
end