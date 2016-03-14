%% Optimisation de Potts4
clear all;
nb_iterations = 10;
T_0s = 3.5:0.1:4;           % 3.5
q_maxs = 750;               % 750
alphas = 0.88:0.01:0.92;    % 0.92
betas = 1.1:0.02:1.3;          % 1.3

T_0_best = 3.4;
q_max_best = 600;
alpha_best = 0.9;
beta_best = 1.2;
score_best = 0;

% for i = 1:nb_iterations
%     for T_0 = T_0s
%         score = Potts4(T_0, q_max_best, alpha_best, beta_best);
%         if score > score_best
%             T_0_best = T_0;
%             score_best = score;
%         end
%     end
%     fprintf('T_0_best = %3f : %f\n', T_0_best, score);
%     for q_max = q_maxs
%         score = Potts4(T_0_best, q_max, alpha_best, beta_best);
%         if score > score_best
%             q_max_best = q_max;
%             score_best = score;
%         end
%     end
%     fprintf('q_max_best = %3f : %f\n', q_max_best, score);
%     for alpha = alphas
%         score = Potts4(T_0_best, q_max_best, alpha, beta_best);
%         if score > score_best
%             alpha_best = alpha;
%             score_best = score;
%         end
%     end
%     fprintf('alpha_best = %3f : %f\n', alpha_best, score);
%     for beta = betas
%         score = Potts4(T_0_best, q_max_best, alpha_best, beta);
%         if score > score_best
%             beta_best = beta;
%             score_best = score;
%         end
%     end
%     fprintf('beta_best = %3f : %f\n', beta_best, score);
% end
for T_0 = T_0s
    for q_max = q_maxs
        for alpha = alphas
            for beta = betas
                score = Potts4(T_0, q_max, alpha, beta);
                if score > score_best
                    T_0_best = T_0;
                    q_max_best = q_max;
                    alpha_best = alpha;
                    beta_best = beta;
                    score_best = score;
                    fprintf('New best score : %2f %2f %f2 %f2 : %2f\n', T_0_best, q_max_best, alpha_best, beta_best, score_best);
                end
            end
        end
    end
end

T_0_best
q_max_best
alpha_best
beta_best
score_best