classdef MPDMP3 < MPDMP
    % a line and a triangle
    methods

        function obj = MPDMP3()
            polygon = nsidedpoly(3, 'Center', [50, 40], 'Radius', 20);
            obj.Map = LinearMap(polygon);
            obj.DM = {[1, 2], [3, 4, 5]};
            obj.M = 5;
            obj.initialize();
        end

        function fig = Draw(obj, PopDec, FrontNo, caption)
            fig = Draw@MPDMP(obj, PopDec, FrontNo, caption);

            filepath = "./figure/" + caption + "MPDMP3.png";
            saveas(fig, filepath);
        end

        function draw(obj)
            obj.Map.Draw();
            hold on;
            x = linspace(45, 55, 10);
            y = repelem(50, 10);
            flag = plot(x,y,'r*');
            legend(flag, 'PS');
            hold off;
        end

    end

end
