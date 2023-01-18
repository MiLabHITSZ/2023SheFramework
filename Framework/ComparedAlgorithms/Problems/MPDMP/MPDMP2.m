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
            fig = obj.Map.Draw();
            gscatter(PopDec(:, 1), PopDec(:, end), FrontNo');
            xlabel('x_1');
            ylabel('x_2');
            axis([30 70 30 70]);
            
            frame = getframe(fig);
            img = frame2im(frame);
            filepath = "./figure/run/" + caption +num2str(fig.Number) + ".png";
            imwrite(img, filepath);
        end
        
        function fig = draw(obj)
            fig = obj.Map.Draw();
            hold on;
            PS = obj.PS();
            flag = plot(PS(1), PS(2),'rd');
            legend(flag, 'PS');
            hold off;
        end
    end

end
