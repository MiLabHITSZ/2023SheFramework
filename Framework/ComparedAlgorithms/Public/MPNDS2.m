function [FrontNo,MaxFNo] = MPNDS2(varargin)
    %the procedure for PSNDS
    %DM is the number of decison makers
    PopObj = varargin{1};
    [~,M]  = size(PopObj);
    if nargin == 3
        nSort  = varargin{2};
        DM=varargin{3};
    else
        PopCon = varargin{2};
        nSort  = varargin{3};
        DM=varargin{4};
        Infeasible           = any(PopCon>0,2);
        PopObj(Infeasible,:) = repmat(max(PopObj,[],1),sum(Infeasible),1) + repmat(sum(max(0,PopCon(Infeasible,:)),2),1,M);
    end
    [FrontNo,MaxFNo] = PL_Sort(PopObj,nSort,DM);  
end

function [FrontNo,MaxFNo] = PL_Sort(PopObj,nSort,DM)
    [N,M]          = size(PopObj);
    Front=inf(DM,N);
    %Fast Non Dominated Sorting for each party
    for k=1:DM
        Front(k,:)=NDSort(PopObj(:,(k-1)*M/DM+1:k*M/DM),N);
    end
    Front = Front';
    [FrontNo,MaxFNo] = NDSort(Front,nSort);
end




