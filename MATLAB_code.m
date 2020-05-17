%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Design a optical sensor for finding flow and depth of water in a tank
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Author details:%
%Amulya Prabakhar, MEng, Concordia University%
%Bibin Eugine, MEng, Concordia University%
%Sibi Ravichandran, MEng, Concordia University%

surface_intensity = input('Enter the Value of surface intensity');%intensity of light at the surface level of water
Percent = input('Enter five values for the percentage of incident light');% eg: [5 10 50 60 70] 
radius = input('Enter the radius of the Cylinderical tank');
intensity_dep =(Percent * surface_intensity)/100;% intensity of light at a particular depth
wavelength = [800 700 600 500 480 400]; % different wavelenght values
k = [2.24 0.598 0.210 0.0075 0.0050  0.0134]; % extinction coefficients

%Finding the depth of the water using intensity of light
depth = zeros(length(k),length(Percent));
for i = 1:length(k)
    for j = 1:length(Percent)
        depth(i,j) = log(surface_intensity/intensity_dep(j))/k(i); % depth of water 
    end
end

% Plotting Wavelength of light vs Extinction Coefficient
figure(1);
plot(wavelength,k);
xlabel('Wavelength in nm');
ylabel('Extinction Coefficient (/m))');
title('Wavelength of light vs Extinction Coefficient');
set(gca,'YLim',[0 2.5])
set(gca,'YTick',(0:0.15:2.5));

% Plotting Intensity vs Depth for different wavelength 
figure(2); hold on
a1 = plot(Percent,depth(1,:)); M1 = "800nm";
a2 = plot(Percent,depth(2,:)); M2 = "700nm";
a3 = plot(Percent,depth(3,:)); M3 = "600nm";
a4 = plot(Percent,depth(4,:)); M4 = "500nm";
a5 = plot(Percent,depth(5,:)); M5 = "480nm";
a6 = plot(Percent,depth(6,:)); M6 = "400nm";
legend([a1; a2; a3; a4; a5; a6], [M1; M2; M3; M4; M5; M6]);
axis([0 100 0 100]);
xlabel('Percentage of Incident Light');
ylabel(' Depth of Water (m)');
title(' Intensity vs Depth for different wavelength');

% Finding the amount of water inside the tank
constant = pi * radius ^ 2;
flow = constant .* depth; % flow of water
disp("DEPTH:")
disp(depth);
disp("FLOW:")
disp(flow);



