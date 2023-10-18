% Numberphile is one of my favorite YouTube channels. I watched a clip
% about the golden ratio a long time ago, and I have tried to write a program
% to prove why the golden ratio is irrational, but I haven't been able to do
% that yet. Instead, I'm simulating a simple sunflower pattern.


phi = (1 + sqrt(5)) / 2;
angle = 2 * pi * (1 - 1 / phi);

figure;
set(gcf, 'Color', [0.98, 0.98, 0.98]);

num_seeds = 1000;
r = sqrt((1:num_seeds) - 0.5);
theta = (1:num_seeds) * angle;

x = r .* cos(theta);
y = r .* sin(theta);

scatter(x, y, 60, 'filled', 'MarkerFaceColor', [1, 0.4, 0], 'MarkerEdgeColor', [0, 0, 0]);

title('Sunflower Seed Arrangement', 'FontSize', 16);
xlabel('X', 'FontSize', 14);
ylabel('Y', 'FontSize', 14);
viscircles([0, 0], 0.1, 'EdgeColor', 'k', 'LineWidth', 2);

axis([-max(r) max(r) -max(r) max(r)]);
ax = gca;
ax.FontSize = 12;
ax.Box = 'on';
ax.LineWidth = 2;
grid on;
grid minor;
set(gca, 'GridColor', [0.5, 0.5, 0.5]);
axis equal;

% saveas(gcf, 'sunflower.png');

