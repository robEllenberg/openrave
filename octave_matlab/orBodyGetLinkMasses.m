% values = orBodyGetLinkMasses(bodyid)
%
% Returns the masses and COM offsets of all links

function [masses,offsets] = orBodyGetLinkMasses(bodyid,comflag)

if ~exist('comflag','var')
    comflag=0
end
command_str = sprintf('body_getlinkmasses %d %d',bodyid,comflag);

out = orCommunicator(command_str, 1);
if(strcmp('error',sscanf(out,'%s',1)))
    error('Error orBodyGetLinkMasses');
end

rawvalues = str2num(out);
if comflag
    masses = rawvalues(1:length(rawvalues)/4);
    offsets = reshape(rawvalues(length(rawvalues)/4+1:end),[],3);
else
    masses = rawvalues;
    offsets = [];
end
