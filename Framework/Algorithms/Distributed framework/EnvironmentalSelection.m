function [Population,FrontNo,CrowdDis] = EnvironmentalSelection(Population,N,DM,Global)
% The environmental selection of OptMPNDS2

%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------
    %% Non-dominated sorting
    % objs=Population.objs;
    % data = objs(:,DM{1});

    % Global.count = Global.count + 1;
    % % fprintf('data1=%f,count=%f\n', size(data, 1), Global.count);
    % labSend(data, 2, Global.count);
    % labBarrier;
    % p = labReceive(2, Global.count);
    % % fprintf('data1=%f\n', size(p(1)));
    % data = cat(2,data, p);
    
    %%take use of MPNDS to sort
    % [FrontNo,MaxFNo] = PLNDS(objs,Population.cons,N,DM);
    [FrontNo, MaxFNo, CrowdDis] = DistributedSort(Population, N, DM);
    % CrowdDis = CrowdingDistance(objs,FrontNo);
    % isequal(FrontNo, FrontNo1)
    Next = FrontNo < MaxFNo;

    Last     = find(FrontNo==MaxFNo);
    [~,Rank] = sort(CrowdDis(Last),'descend');
    Next(Last(Rank(1:N-sum(Next)))) = true;

    %% Population for next generation
    Population = Population(Next);
    FrontNo    = FrontNo(Next);
    CrowdDis   = CrowdDis(Next);
  end