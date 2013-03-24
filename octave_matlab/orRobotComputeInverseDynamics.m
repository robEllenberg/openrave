% values = orRobotComputeInverseDynamics(robotid, indices)
%
% Gets the robot's dof values in a Nx1 vector where N is the DOF
% robotid - unique id of the robot
% indices [optional]- The indices of the joints whose values should be returned.
%                     If not specified, the active degreees of freedeom set by
%                     orRobotSetActiveDOFs will be used.

function values = orRobotComputeInverseDynamics(robotid, linkftcell)


command_str = ['robot_computeinversedynamics ' num2str(robotid)];
if( exist('linkftcell', 'var') )
    for k=1:size(linkftcell,1)
        command_str = [command_str ' ' sprintf('%s ', linkftcell{k,1})];
        command_str = [command_str ' ' sprintf('%f ', linkftcell{k,2})];
    end
end

out = orCommunicator(command_str, 1);
