%% Gasdynamics
% Script to verify as per Shapiro Vol. 1 p. 102 Fig. 4.19

addpath('gasdynamics')
addpath('num')

expansionRatios = 10.^linspace(0,3, 1e3);
ambientPressureRatios = ...
    [0 0.001 0.002 0.003 0.005 0.010 0.020 0.030 0.050];

k = 1.2;

pa = 1.0143e5;

p0Vector = 0.7*linspace(40*pa, 60*pa, 20);

set(gca, 'FontName', 'Arial')
semilogx(1,0)
hold on
for pa_p0 = ambientPressureRatios
    thrustCoefficients = ...
        arrayfun(@(e) getThrustCoefficient(k, e, pa_p0), expansionRatios);
    semilogx(expansionRatios, thrustCoefficients, 'k');
end

for p0 = p0Vector
    thrustCoefficients = ...
        arrayfun(@(e) getThrustCoefficient(k, e, pa/p0),expansionRatios);
    % semilogx(expansionRatios,thrustCoefficients, 'b');
    idx = find(thrustCoefficients==max(thrustCoefficients));
    semilogx(expansionRatios(idx), thrustCoefficients(idx), 'r.');
end

hold off
xlabel('Expansion Ratio')
ylabel('Thrust coefficient')
grid on
axis([3 9 1.4 1.6])