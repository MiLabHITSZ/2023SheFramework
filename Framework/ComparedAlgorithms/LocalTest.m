function LocalTest()

    addpath(genpath(fileparts(mfilename('fullpath')))); %add path
    s = RandStream.create('mrg32k3a');
    RandStream.setGlobalStream(s);

    problems = ["MPDMP1", "MPDMP2", "MPDMP3", "MPDMP4", "MPDMP5", "MPDMP6", "MPDMP7", "MPDMP8"];
    population = 200;
    evaluation = 40000;
    dim = 2;
    test_case = {

            @OptMPNDS2, @MPDMP1, population, 1, 1, evaluation, dim;

            };
    %% run the algorithms
    for FileOrder = 1

        for problem = problems
            Score = [];
            for j = 0:1:14

                

                result = OneTurn(problem);

                % result = cat(1, result{1:end});
                Score = [Score; result{1}];
            end

        

        result_mean = mean(Score);
        result_std = std(Score);
        location = {sprintf('Data/%d/%s', FileOrder, func2str(test_case{1}))};
        [~, ~] = mkdir(sprintf('%s/%d/', location{1}, dim));
        save(sprintf('%s/%d/%s_%s(%d).mat', location{1}, dim, ...
            problem, func2str(test_case{1}), test_case{6}), ...
            'result_mean', 'result_std', 'Score');
        end
    end

end
