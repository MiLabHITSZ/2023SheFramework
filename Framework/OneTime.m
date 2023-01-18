function OneTime()

    addpath(genpath(fileparts(mfilename('fullpath')))); %add path

    problems = ["MPDMP1", "MPDMP2", "MPDMP3", "MPDMP4", "MPDMP5", "MPDMP6", "MPDMP7", "MPDMP8"];
    problems = ["MPDMP1"];
    algorithms = ["framework"];

    %% run the algorithms
    for algorithm = algorithms

        for problem = problems
            Score = [];
            for j = 0
                if strcmp(algorithm, "Lazy")
                    result = OneTurnLazy(problem, algorithm, j);
                end
                if strcmp(algorithm, "NBA")
                    result = OneTurnNBA(problem, algorithm, j);
                end
                if strcmp(algorithm, "framework")
                    result = OneTurn(problem, algorithm, j);
                end
                % result = cat(1, result{1:end});
                Score = [Score; result{1}];
            end

        end
    end

end
