classdef LinearMap

    properties
        polygons;
        LinePoints = [30, 50; 70, 50; ];
    end

    methods

        function obj = LinearMap(polygons)
            obj.polygons = polygons;
        end

        function f = EuclideanDistance(obj, x)
            f = pdist2(x, obj.LinePoints);

            for i = obj.polygons
                f = [f, pdist2(x, i.Vertices)];
            end

        end

        function p = PS(obj)
            x = linspace(30, 70, 10000);
            y = repelem(50, 10000);
            x = x';
            y = y';
            % tell if the points are in the pooygons
            in = true(length(x), 1);

            for i = obj.polygons
                in = in & inpolygon(x, y, i.Vertices(:, 1), i.Vertices(:, end));
            end

            x = x(in);
            y = y(in);
            p = [x, y];
            % scatter(x, y);
        end

        function p = PF(obj)
            p = obj.PS();
            p = obj.EuclideanDistance(p);
        end

        %% The PF of the first party
        function p = getFirstPF(obj)
            x = linspace(30, 70, 10000);
            y = repelem(50, 10000);
            p = obj.EuclideanDistance([x', y']);
        end

        function fig = Draw(obj)
            %Draw - draw the map
            %
            % Syntax: Draw(obj)
            %
            % two triangle, each for one party.
            fig = figure();
            clf;
            hold on;
            xlabel('x_1');
            ylabel('x_2');
            axis([0 100 0 100]);
            axis square;
            set(gca, 'ytick', [0:20:100]);
            set(gca, 'xtick', [0:20:100]);

            plot(obj.LinePoints(:, 1), obj.LinePoints(:, end));

            for i = obj.polygons
                plot(i);
            end

            plot(obj.LinePoints(1, 1), obj.LinePoints(1, end), 'ro');
            plot(obj.LinePoints(2, 1), obj.LinePoints(2, end), 'bx');
            hold off;

        end

    end

end
