data = readtable('RegenOnly_new.txt');

%%
% data_COP = [[1e-4 -15 0] ; table2array(data(4:end,[1 2 7]))];
% data_DeltaT = [[1e-4 -15 0] ; table2array(data(4:end,[1 2 6]))];
% data_Qth = [[1e-4 -15 0] ; table2array(data(4:end,[1 2 5]))];

data_COP = table2array(data(:,[1 2 7]));
data_DeltaT = table2array(data(:,[1 2 6]));
data_Qth = table2array(data(:,[1 2 5]));

%%
data_COP_r = data_COP;
data_DeltaT_r = data_DeltaT;
data_Qth_r = data_Qth;

for n=1:2:200
    data_COP_r((n)*201+1:(n+1)*201,:) = flipud(data_COP((n)*201+1:(n+1)*201,:));
    data_DeltaT_r((n)*201+1:(n+1)*201,:) = flipud(data_DeltaT((n)*201+1:(n+1)*201,:));
    data_Qth_r((n)*201+1:(n+1)*201,:) = flipud(data_Qth((n)*201+1:(n+1)*201,:));
end

COP_r = reshape(data_COP_r(:,3),[201, 201]);
COP_e = COP_r(1:10:end,1:10:end);
DeltaT_r = reshape(data_DeltaT_r(:,3),[201, 201]);
DeltaT_e = DeltaT_r(1:10:end,1:10:end);
Qth_r = reshape(data_Qth_r(:,3),[201, 201]);
Qth_e = Qth_r(1:10:end,1:10:end);


mag_u = data_COP_r(1:201:end,1);
mag_u_e = mag_u(1:10:end);
arg_u = data_COP_r(202:402,2);
arg_u_e = arg_u(1:10:end);

[MAG_u, ARG_u] = meshgrid(mag_u_e,arg_u_e);

%%
COP_v = [reshape(MAG_u,[21^2,1]) reshape(ARG_u,[21^2,1]) reshape(COP_e,[21^2,1])];
DeltaT_v = [reshape(MAG_u,[21^2,1]) reshape(ARG_u,[21^2,1]) reshape(DeltaT_e,[21^2,1])];
Qth_v = [reshape(MAG_u,[21^2,1]) reshape(ARG_u,[21^2,1]) reshape(Qth_e,[21^2,1])];

save("data_DeltaEC_u_opt_COP.txt",'COP_v','-ascii')
save("data_DeltaEC_u_opt_DeltaT.txt",'DeltaT_v','-ascii')
save("data_DeltaEC_u_opt_Qth.txt",'Qth_v','-ascii')
%%

figure
contour(mag_u_e,arg_u_e,COP_e)
title("COP")
colorbar
xlabel("|u|")
ylabel("arg u")

figure
contour(mag_u_e,arg_u_e,DeltaT_e)
title("\Delta T")
colorbar
xlabel("|u|")
ylabel("arg u")

figure
contour(mag_u_e,arg_u_e,Qth_e)
title("Q_{th}")
colorbar
xlabel("|u|")
ylabel("arg u")

%%
% save("DeltaEC_u_opt_COP.txt",'data_COP','-ascii')
% save("DeltaEC_u_opt_DeltaT.txt",'data_DeltaT','-ascii')
% save("DeltaEC_u_opt_Qth.txt",'data_Qth','-ascii')