% input - length of dataset or length of feature-label pairs

function [feature, label] = create_dataset_fk(data_size)

lab5;

% just take a random value of q --> feature
% calculate the FK --> label
% return


rng(0,'twister');

% q1
q_min = -90;
q_max = 90;
q1 = (q_max-q_min).*rand(data_size,1) + q_min;

% q2
q_min = -90;
q_max = 90;
q2 = (q_max-q_min).*rand(data_size,1) + q_min;

% q3
q_min = -90;
q_max = 90;
q3 = (q_max-q_min).*rand(data_size,1) + q_min;

% q4
% q_min = -50;
% q_max = 50;
% q4 = (q_max-q_min).*rand(data_size,1) + q_min;

% q5
% q_min = -50;
% q_max = 50;
% q5 = (q_max-q_min).*rand(data_size,1) + q_min;

q = [q1, q2, q3]*deg;
pose_robot = zeros(data_size,3);


for i=1:data_size
   
    pose_end = lab5robot.fkine(q(i, :));
    xyz = transl(pose_end);
   
    % also more labels can be added
    pose_robot(i, :) =  xyz;
    
end
    
 feature = q;
 label = pose_robot;
    
end