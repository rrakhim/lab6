% Variable for converting radians to degrees
deg = pi/180;

% Creating links by providing values for different parameters.
% Some of them are provided in manual (mass, gear ratio, etc.),
% others taken from the DH parameters (calculated in notebook,
% photo in GitHub folder).
%
% 'd' - distance between X axes measured along Z axis
% 'a' - distance between Z axes measured along X axis
% 'alpha' - angle between Z axes measured by X axis
% 'qlim' - range limit of the link [min max]
% 'm' - mass of the link
% 'I' - inertia matrix of the link, found by the formula from the manual
% 'B' - (viscous)friction of the link
% 'G' - gear ratio of the link
% 'Jm' - motor inertia of the link

L(1) = Revolute('d', 1, 'a', 0, 'alpha', pi/2, ...
    'qlim', [-pi/2 pi/2], 'm', 10, ...
    'I', [0.5*10*0.05^2 0 0; ...
          0 ((1/12)*10*1+0.25*10*0.05^2) 0; ...
          0 0 ((1/12)*10*1+0.25*10*0.05^2)], ...
    'B', 1e-3, 'G', 500, 'Jm', 1e-4);

L(2) = Revolute('d', 0, 'a', 1, 'alpha', 0, ...
    'qlim', [-pi/2 pi/2], 'm', 10, ...
    'I', [0.5*10*0.05^2 0 0; ...
          0 ((1/12)*10*1+0.25*10*0.05^2) 0; ...
          0 0 ((1/12)*10*1+0.25*10*0.05^2)], ...
    'B', 1e-3, 'G', 500, 'Jm', 1e-4);

L(3) = Revolute('d', 0, 'a', 1, 'alpha', 0, ...
    'qlim', [-pi/2 pi/2], 'm', 11, ...
    'I', [0.5*10*0.05^2 0 0; ...
          0 ((1/12)*10*1+0.25*10*0.05^2) 0; ...
          0 0 ((1/12)*10*1+0.25*10*0.05^2)], ...
    'B', 1e-3, 'G', 500, 'Jm', 1e-4);

% Name our robot and connect links to it
lab5robot = SerialLink(L, 'name', 'Lab 5 Robot Arm');

% Finding RSME
%home5 = [0 0 0]*deg;
%pose_end5 = lab5robot.fkine(home5);
%xyz5 = transl(pose_end5);
%error5 = [];
%error5 = [error5, sqrt((xyz5(1))^2 + (xyz5(2))^2 + (xyz5(3))^2)]

% Default pose, no angles
%qz = [0 0 0];

% Plotting the robot in default pose and using teaching tool
%lab5robot.plot(qz);
%lab5robot.teach;