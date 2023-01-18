classdef MPDMP7 < MPDMP
    % two overlapped squares
    methods

        function obj = MPDMP7()
            polygon1 = nsidedpoly(4, 'Center', [30, 50], 'Sidelength', 40);
            polygon2 = nsidedpoly(4, 'Center', [60, 40], 'Sidelength', 40);
            obj.Map = polygon([polygon1, polygon2]);
            obj.DM = {1:4, 5:8};
            obj.M = 8;
            obj.initialize();
        end

        function draw(obj)
            obj.Map.Draw();
            hold on;
            PS = polyshape([40, 60; 50, 60; 50, 30; 40, 30; ]);
            flag = plot(PS);
            flag.LineStyle = '--';
            flag.EdgeColor = 'red';
            legend(flag, 'PS');
            hold off;
        end

    end

end
