function Second4()
    count = 0;
    problem = labReceive(1, count);
    count = count + 1;
    
    while true
        Population = labReceive(1, count);
        N = length(Population);
        % Global = GLOBAL.GetObj();
        % temp = Global.DM;
        % DM = temp{1};

        if isempty(Population)
            break;
        end

        PopObj = Population.objs;
        PopObj = PopObj(:, problem.DM{2});

       
        FrontNo = NDSort(PopObj, N);
    


        CrowdDis = CrowdingDistance(PopObj, ones(1, N));
        labSend({FrontNo, CrowdDis}, 1, count);
        count = count + 1;
    end

end
