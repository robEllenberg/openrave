% values = orBodyGetCOM(bodyid)

function [com] = orBodyGetCOM(bodyid)
    command_str = sprintf('body_getcenterofmass %d' ,bodyid);
    out = orCommunicator(command_str, 1);

    if(strcmp('error',sscanf(out,'%s',1)))
        error('Error orBodyGetLinkMasses');
    end

    com = str2num(out);
end
