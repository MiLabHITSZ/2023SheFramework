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
            fig = obj.Map.Draw();
            hold on;
            gscatter(PopDec(:, 1), PopDec(:, end), FrontNo');
            xlabel('x_1');
            ylabel('x_2');
            axis([30 70 30 70]);
            %             title(caption);

            % title(caption + " " + num2str(fig.Number) + "run");
            hold off;
            %
            frame = getframe(fig);
            img = frame2im(frame);
            filepath = "./figure/run/" + caption +num2str(fig.Number) + ".png";
            imwrite(img, filepath);
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
