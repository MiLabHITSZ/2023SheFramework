classdef MPDMP5 < MPDMP
    % two overlapped triangles
    properties
        polygon1;
        polygon2;
    end
    methods

        function obj = MPDMP5()
            % polygon1 = polyshape([30, 70; 55, 50; 30, 30; ]);
            % polygon2 = polyshape([70, 70; 70, 30; 45, 50; ]);
            obj.polygon1 = nsidedpoly(3, 'Center', [39, 40], 'Radius', 40);
            obj.polygon2 = nsidedpoly(3, 'Center', [60, 20], 'Radius', 40);
            obj.Map = polygon([obj.polygon1, obj.polygon2]);
            obj.DM = {1:3, 4:6};
            obj.M = 6;
            obj.Metric = {@IGD};

            obj.initialize();
        end

        function fig = Draw(obj, PopDec, FrontNo, caption)
            fig = Draw@MPDMP(obj, PopDec, FrontNo, caption);
            
            axis([0 100 -20 100]);
            filepath = "./figure/" + caption + "MPDMP5.png";
            saveas(fig, filepath);
        end

        function draw(obj)
            obj.Map.Draw();
            hold on;
            PS = intersect(obj.polygon1, obj.polygon2);
            flag = plot(PS);
            flag.LineStyle = '--';
            flag.EdgeColor = 'red';
            legend(flag, 'PS');
            hold off;
        end

    end

end
