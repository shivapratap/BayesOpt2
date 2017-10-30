function plotbo(x, gp, acq, mu, sig)

y = myfunction(x);

figure;
ax1 = subplot(2,1,1);
plot(x,y)
hold on;
plot(gp.X, gp.y, 'bs');
plot(x, mu, 'r');
plot(x, (mu + 1.96*sig), 'g--');
plot(x, (mu - 1.96*sig), 'g--');
ylabel('Posterior');
hold off;

ax2 = subplot(2,1,2);
plot(x, acq, 'k:');
ylabel('Acq_Function');

end
