classdef MPDMP8 < MPDMP
% two overlapped pentagons
    methods

        function obj = MPDMP8()
            polygon1 = nsidedpoly(5, 'Center', [40, 50], 'Radius', 20);
            polygon2 = nsidedpoly(5, 'Center', [60, 45], 'Radius', 20);
            obj.Map = polygon([polygon1, polygon2]);
            obj.DM = {1:5, 6:10};
            obj.M = 10;

            obj.initialize();
        end

        function Draw(obj, PopDec, FrontNo, caption)
            fig = Draw@MPDMP(obj, PopDec, FrontNo, caption);

            filepath = "./figure/" + caption + "MPDMP8.png";
            saveas(fig, filepath);
        end

        function draw(obj)
            obj.Map.Draw();
            hold on;
            PS = intersect(nsidedpoly(5, 'Center', [40, 50], 'Radius', 20),nsidedpoly(5, 'Center', [60, 45], 'Radius', 20));
            flag = plot(PS);
            flag.LineStyle = '--';
            flag.EdgeColor = 'red';
            legend(flag, 'PS');
            hold off;
        end
    end

end
