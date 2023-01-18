function [FrontNo, MaxFNo, CrowdDis] = DistributedSort(Population, nSort, DM)
    N = length(Population);
    number = length(DM);
    Front = inf(N, number);
    % Fast Non Dominated Sorting for each party
    % for k = 1:number
    %     Front(:, k) = NDSort(PopObj(:, DM{k}), N);
    % end
    Global = GLOBAL.GetObj();
    % Objs = Global.problem.CalObj(Population.decs);
    Global.count = Global.count + 1;
    % fprintf('data1=%f,count=%f\n', size(data, 1), Global.count);
    labSend(Population, 2, Global.count);
    labSend(Population, 3, Global.count);
    % labBarrier;
    data1 = labReceive(2, Global.count);
    Front(:, 1) = data1{1};
    CrowdDis1 = data1{2};
    data2 = labReceive(3, Global.count);
    Front(:, 2) = data2{1};
    CrowdDis2 = data2{2};
    % data = [data1(:, DM{1}), data2(:, DM{2})];
    % fprintf('data1=%f\n', size(p(1)));
    % % data = cat(2,data, p);
    % isequal(objs, data)

    % [Front(:, 1), CrowdDis1]= First(Population, N, DM{1});
    % [Front(:, 2), CrowdDis2] = Second(Population, N, DM{2});

    [FrontNo, MaxFNo] = NDSort(Front, nSort);
    % CrowdDis = CrowdingDistance(PopObj(:, DM{1}), FrontNo);
    % CrowdDis = CrowdDis + CrowdingDistance(PopObj(:, DM{2}), FrontNo);
    
    CrowdDis = CrowdDis1 + CrowdDis2;
end