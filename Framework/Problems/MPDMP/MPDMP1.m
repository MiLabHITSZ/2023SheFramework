classdef MPDMP1 < MPDMP
    % two regular crossed lines
    methods

        function obj = MPDMP1()
            obj.Map = square();
            obj.Metric = {@IGD};

            obj.initialize();
        end

        %% PF
        function P = PF(obj)
            P = [20 * sqrt(2), 20 * sqrt(2), 20 * sqrt(2), 20 * sqrt(2)];
        end

        %% draw the point
        function Draw(obj, PopDec, FrontNo, caption)
            fig = Draw@MPDMP(obj, PopDec, FrontNo, caption);

            filepath = "./figure/" + caption + "MPDMP1.png";
            saveas(fig, filepath);
        end

        function draw(obj)
            obj.Map.Draw();
            hold on;
            PS = obj.PS();
            flag = plot(PS(1), PS(2), 'rd');
            legend(flag, 'PS');
            hold off;
        end

    end

end
