% function [FrontNo, CrowdDis] = Second(Population, N, DM)
%     PopObj = Population.objs;
%     PopObj = PopObj(:, DM);
%     Global = GLOBAL.GetObj();
%     Global.count = Global.count + 1;
%     if Global.count < 10
%         FrontNo = NDSort(PopObj, N);
%     else
%         FrontNo = ones(1, N);
%     end

%     % if rand() <= 1
%     %     FrontNo = ones(1, N);
%     % else
%     %     FrontNo = NDSort(PopObj, N);
%     % end

%     CrowdDis = CrowdingDistance(PopObj, ones(1, N));

% end

function Second1()
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

        if count < 100
            FrontNo = NDSort(PopObj, N);
        else
            FrontNo = ones(1, N);
        end
        % if rand() < 0.8
        %     FrontNo = ones(1, N);
        % else
        %     % FrontNo = randi(N, 1, N);
        %     % FrontNo = NDSort(PopObj, N);
        %     dec = Population.decs;
        %     PopObj = pdist2(dec, [60, 60]);
        %     FrontNo = NDSort(PopObj, N);
        % end

        CrowdDis = CrowdingDistance(PopObj, ones(1, N));
        labSend({FrontNo, CrowdDis}, 1, count);
        count = count + 1;
    end

end
