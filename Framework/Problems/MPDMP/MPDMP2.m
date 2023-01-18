classdef MPDMP2 < MPDMP
    % two crossed lines
    methods

        function obj = MPDMP2()
            obj.Map = trapezoid1();
            obj.Metric = {@IGD};

            obj.initialize();

        end

        %% draw the point
        function fig = Draw(obj, PopDec, FrontNo, caption)
            fig = Draw@MPDMP(obj, PopDec, FrontNo, caption);

            filepath = "./figure/" + caption + "MPDMP2.png";
            saveas(fig, filepath);
        end

        function fig = draw(obj)
            fig = obj.Map.Draw();
            hold on;
            PS = obj.PS();
            flag = plot(PS(1), PS(2), 'rd');
            legend(flag, 'PS');
            hold off;
        end

    end

end
