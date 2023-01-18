function [score] = IGD(obj, PF, DM)
    % �˴���ʾ�йش˺�����ժҪ
    % Author: szng
    % [M, ~] = size(obj);
    % [N, ~] = size(PF);
    % dis = zeros(N, M);

    dis = pdist2(PF(:, DM{1}), obj(:, DM{1}));
    grades = min(dis, [], 2);
    score = [mean(grades), min(grades)];
end
