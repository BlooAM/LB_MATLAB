%Clear MATLAB workspace
clear
clc

Sol = [];
for u0 = 0.01:0.001:0.18
    disp(u0)
    [J,dJds] = SolveCase(u0);
    Sol = [Sol;J,dJds];
end

figure(1)
plot(Sol(:,1),'DisplayName','J')
grid on
legend()

figure(2)
plot(Sol(:,2),'DisplayName','dJds')
grid on
legend()
