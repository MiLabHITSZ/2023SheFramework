function score = OneTurnNBA(problem, algorithm, index)
    delete(gcp('nocreate'));
    p = parpool(3);
    spmd
    s = RandStream.create('mrg32k3a', 'NumStreams', 90, 'StreamIndices', labindex + index);
    RandStream.setGlobalStream(s);

        switch labindex
            case 1
                score = main('-algorithm', str2func(algorithm), '-problem', str2func(problem), '-N', 200, '-save', 1, ...
                    '-run', 1, '-evaluation', 80000, '-D', 2, '-rate', 0);
            case 2
                First2
            case 3
                Second2
        end

    end

end
