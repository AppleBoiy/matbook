range = linspace(-3, 3, 1000);
e_range = exp(range);

x = 1;
x_axis = [x x];
y_axis = [0 25];

figure;
plot(range, e_range, 'r-', 'DisplayName', 'e^x', 'LineWidth', 2);
hold on

plot(x_axis, y_axis, 'g-', 'DisplayName', 'X', 'LineWidth', 2);
x_text = sprintf('x = %.2f', x);
text(x + 0.2, 10, x_text, 'FontSize', 12, 'Color', 'g');

x_fill = [range(range <= x), fliplr(x_axis)];
y_fill = [e_range(range <= x), fliplr(y_axis)];

fill(x_fill, y_fill, 'b', 'FaceAlpha', 0.5, 'DisplayName', 'Area under e^x');

xlabel('X', 'FontSize', 14);
ylabel('Y', 'FontSize', 14);

slope_x = [x - 0.5, x + 0.5];
slope_x = [max(slope_x(1), min(range)), min(slope_x(2), max(range))];
slope_y = slope_at_x * (slope_x - x) + exp(x);

plot(slope_x, slope_y, 'm-', 'DisplayName', 'Slope', 'LineWidth', 2);

lgd = legend('Location', 'Best');
set(lgd, 'Color', [0.9 0.9 0.9], 'EdgeColor', [0.2 0.2 0.2], 'FontWeight', 'bold', 'FontSize', 12);

slope_text = sprintf('Slope of e^x at x = %.2f: %.4f', x, slope_at_x);
text(x + 0.2, slope_at_x, slope_text, 'FontSize', 12, 'Color', 'm');

area_text = sprintf('Area: e^{%.4f}', log(area_under_curve));
text(x - 2, area_under_curve + 2, area_text, 'FontSize', 12, 'Color', 'b');


title('The value of e', 'FontSize', 16);
grid on;

axis([-3 3 0 25]);

set(gcf, 'Color', [1 1 1]);
set(gca, 'LineWidth', 1, 'FontSize', 12);

% saveas(gcf, './img/e_value.png');