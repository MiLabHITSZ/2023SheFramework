classdef polygon

    properties
        polygons;
    end

    methods

        function obj = polygon(polygons)
            obj.polygons = polygons;
        end

        function f = EuclideanDistance(obj, x)
            f = [];

            for i = obj.polygons
                f = [f, pdist2(x, i.Vertices)];
            end

        end

        function p = PS(obj)
            x = linspace(0, 100, 1000);
            y = linspace(0, 100, 1000);
            [X, Y] = meshgrid(x, y);
            x = X(:);
            y = Y(:);
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

        %% The PF of the first party
        function p = getFirstPF(obj)
            x = linspace(0, 100, 1000);
            y = linspace(0, 100, 1000);
            [X, Y] = meshgrid(x, y);
            x = X(:);
            y = Y(:);
            % tell if the points are in the pooygons
            i = obj.polygons(1);
            in = inpolygon(x, y, i.Vertices(:, 1), i.Vertices(:, end));

            x = x(in);
            y = y(in);
            p = [x, y];
            p = obj.EuclideanDistance(p);
            % scatter(x, y);
        end

        function p = PF(obj)
            p = obj.PS();
            p = obj.EuclideanDistance(p);
        end

        function fig = Draw(obj)
            %Draw - draw the map
            %
            % Syntax: Draw(obj)
            %
            % two triangle, each for one party.
            fig = figure();
            clf;
            xlabel('x_1');
            ylabel('x_2');
            axis([0 100 0 100]);
            axis square;
            set(gca,'ytick',[0 :20: 100]);
            set(gca,'xtick',[0 :20: 100]);
            hold on;

            for i = obj.polygons
                plot(i);
            end

        end

    end

end
