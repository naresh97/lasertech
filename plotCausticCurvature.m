function plotCausticCurvature(lambda, w0, aufloesungZ)
%plotCausticCurvature   Plots the caustic graph and curvature radius of the
%                       specified Gaussian beam.
%
%   plotCausticCurvature(LAMBDA, W0, AUFLOESUNGZ)
%
%   LAMBDA:         Wavelength of Gaussian beam (in meters)
%
%   W0:             Radius of Gaussian beam at beam waist (in meters)
%
%   AufloesungZ:    The number of Rayleigh Rangers to plot i.e.
%                   -AufloesungZ*zR < z < AufloesungZ*zR

    zR = (pi/lambda) * w0^2;

    z = linspace(-aufloesungZ*zR,aufloesungZ*zR,1000);
    q = z + i*zR;
    oneOverR = real(1./q);
    w = sqrt(lambda./pi./-imag(1./q));
    psi = atan(z./zR);

    subplot(2,1,1);
    yyaxis left;
    plot(z, w);
    ylabel("w(z)");
    yyaxis right;
    plot(z, psi);
    line(xlim, [pi/2 pi/2], 'LineStyle','--');
    line(xlim, [-pi/2 -pi/2], 'LineStyle', '--');
    ylabel("\psi(z)");
    title("Caustic and Gouy Phase for w_0 = "+w0+", \lambda = "+lambda);xlabel("z");

    subplot(2,1,2);
    plot(z, oneOverR);
    title("Radius of curvature for w_0 = "+w0+", \lambda = "+lambda);xlabel("z");ylabel("1/R(z)");

    hold on;
    zLines = (-aufloesungZ*zR):zR:(aufloesungZ*zR);
    for j = 1:length(zLines)
       subplot(2,1,1);
       line([zLines(j) zLines(j)],ylim, 'Color', 'k', 'LineStyle',':'); 
       subplot(2,1,2);
       line([zLines(j) zLines(j)],ylim, 'Color', 'k', 'LineStyle',':'); 
    end
    hold off;
end