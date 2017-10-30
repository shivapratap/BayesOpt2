function plotbo(xgrid, gp, acq, mu, sig)

x = rescaleData(xgrid', gp.xbounds);
X_samples = rescaleData(gp.X, gp.xbounds);
y_samples = rescaleData(gp.y, gp.ybounds);
mmu = rescaleData(mu, gp.ybounds);

y = myfunction(x);

figure;
ax1 = subplot(2,1,1);
plot(x,y)
hold on;
plot(X_samples, y_samples, 'bs');
plot(x, mmu, 'r');
plot(x, (mmu + 1.96*sig), 'g--');
plot(x, (mmu - 1.96*sig), 'g--');
ylabel('Posterior');
hold off;

ax2 = subplot(2,1,2);
plot(x, acq, 'k:');
ylabel('Acq_Function');

end