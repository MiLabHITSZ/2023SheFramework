% <algorithm>
% OptMPNDS2

function NBA(Global)
    Population = Global.Initialization();
    [~, FrontNo, CrowdDis] = EnvironmentalSelection(Population, Global.N, Global.DM, Global);
    %% Optimization
    while Global.NotTermination(Population)
        MatingPool = TournamentSelection(2, Global.N, FrontNo, -CrowdDis);
        Offspring = GA(Population(MatingPool));
        [Population, FrontNo, CrowdDis] = EnvironmentalSelection([Population, Offspring], Global.N, Global.DM,Global);
        % Global.problem.Draw(Population.decs, FrontNo, func2str(Global.algorithm));
    end

end
